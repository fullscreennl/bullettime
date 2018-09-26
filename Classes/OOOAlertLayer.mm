//
//  OOOAlertLayer.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/17/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOAlertLayer.h"
#import "OOOConfig.h"
#import "OOOGameViewDecorator.h"
#import "OOORect.h"
#import "OOOBatmanAlert.h"
#import "OOOSharedLevelmapData.h"
#import "OOOGameSprite.h"
#import "HeroSprite.h"
#import "AnimatedSpeachBubble.h"
#import "OOORatingRequest.h"
#import "oneononeAppDelegate.h"

@implementation OOOAlertLayer

static OOOAlertLayer *layer=nil;

+(id) layer
{
	layer = [OOOAlertLayer node];
	return layer;
}

-(void)sniffDeviceEnv{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewportH = 768;
        viewportW = 1024;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = YES;
    }else{
        viewportH = screenSize.height;
        viewportW = screenSize.width;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = NO;
    }
}

-(id) init
{
	if( (self=[super init])) {
        screenSize = [(oneononeAppDelegate*)[[UIApplication sharedApplication] delegate] getScreenSize];
		[self sniffDeviceEnv];
		self.isTouchEnabled = YES;

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(showAlert:) 
													 name:@"showAlert" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(showImageAlert:) 
													 name:@"showImageAlert" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onMenuFocusChanged:) 
													 name:@"onMenuFocusChanged" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onPauseControlls:) 
													 name:@"onPauseControlls" 
												   object:nil];
		
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(onUpgradeSuccess:) 
                                                     name:@"upgradeSuccess" 
                                                   object:nil];

		imageAlertYpos =-130;
		//textAlertYpos =-80;
        raterequest = [[OOORatingRequest alloc] init];
        //NSLog(@"delegate %@ ",[(oneononeAppDelegate*)[[UIApplication sharedApplication] delegate] getScreenSize]);
        
        //NSLog(@"screen dimmies: %@, %f", NSStringFromCGSize(screenSize), screenSize.width);
	}
	return self;
}

#pragma mark speachBubbleAlert
#pragma mark -

-(void)onPauseControlls:(NSNotification *)note{
	//NSLog(@"speak !");
	
	//HeroSprite *hero;
	OOOGameSprite *zone;
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	if([sprite1 isMemberOfClass:[HeroSprite class]]){
		//hero = (HeroSprite*)sprite1;
		zone = sprite2;
	}else{
		//hero = (HeroSprite*)sprite2;
		zone = sprite1;
	}
	
	[zone destroy];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"disableControlls" 
					   object:nil 
					   userInfo:nil]];
}	

-(void)onMenuFocusChanged:(NSNotification*)note{

	OOOSharedLevelmapData *lmd = [OOOSharedLevelmapData get];
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];

	NSArray *level_desc;
	NSNumber *score;
    int stars;
	
	level_desc = [lmd levelDataForIndex:[sprite1 getSpriteData]];
	score = [lmd levelScoreForIndex:[sprite1 getSpriteData]];
    stars = [lmd levelStarsForIndex:[sprite1 getSpriteData]];
	if (!level_desc) {
		level_desc =[lmd levelDataForIndex:[sprite2 getSpriteData]];
		score = [lmd levelScoreForIndex:[sprite1 getSpriteData]];
        stars = [lmd levelStarsForIndex:[sprite1 getSpriteData]];
	}
	
    if(ipad){
        [self showMenuInfoForDataIPad:level_desc andScore:score andStars:stars];
    }else{
        [self showMenuInfoForData:level_desc andScore:score andStars:stars];
    }

}

-(void)onUpgradeSuccess:(NSNotification *) note{
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    NSLog(@"upgrade suc6 %@ , %@ self %@",[note name],[note object],self);
   // teaser_menu.visible= NO;
    if(ipad){
        dialog_bg =[CCSprite spriteWithFile:@"extra_dialog_bg.png"];
        dialog_sub_bg =[CCSprite spriteWithFile:@"bullettime_thankyou.png"];
        [dialog_bg addChild:dialog_sub_bg];
        dialog_sub_bg.position =ccp(dialog_bg.contentSize.width/2.0f,dialog_bg.contentSize.height/2.0f);
        CCSprite *cadre =[CCSprite spriteWithFile:@"cadre2.png"];
        [dialog_bg addChild:cadre];
        cadre.position = ccp(dialog_bg.contentSize.width/2.0f,dialog_bg.contentSize.height/2.0f+5.0);
        cadre.scaleX = 0.98f;
    }else{
        dialog_bg =[CCSprite spriteWithFile:@"bullettime_thankyou.png"];
    }

    dialog_bg.position =ccp(0,viewportH );
    //[self addChild:dialog_bg];
    CCMenu *thankyou = [CCMenu menuWithItems:[CCMenuItemSprite itemFromNormalSprite:dialog_bg selectedSprite:nil target:self selector:@selector(dismiss)], nil];
    [self addChild:thankyou z:9999 tag:99];
    id moveAction;
    if(ipad){
        moveAction=  [CCMoveBy actionWithDuration:0.6 position: ccp(0,-320-160-124)];
    }else{
        moveAction = [CCMoveBy actionWithDuration:0.6 position: ccp(0,-viewportH)];        
    }
    id ease_action = [CCEaseIn actionWithAction:moveAction rate:2];

    [dialog_bg 	runAction:ease_action];	
   // CCSprite *thankyouSprite = [CCSprite spriteWithFile:@"bullettime_thankyou.png"];
    //CCMenu *thankyou = [CCMenu menuWithItems:[CCMenuItemSprite itemFromNormalSprite:thankyouSprite selectedSprite:nil target:self selector:@selector(dismiss)], nil];
    //[self addChild:thankyou z:9999 tag:99];
}

-(void)dismiss{
    [self removeChildByTag:99 cleanup:YES];
}

-(void)showMenuInfoForData:(NSArray *)data andScore:(NSNumber *)score andStars:(int)stars{
	
	[self removeAllSprites:nil];
	
	CCLabelBMFont *titleLabel;
	
	NSString *msg = [data objectAtIndex:1];
	NSArray *msgs = [msg componentsSeparatedByString:@"#"];
	
	lines = [[NSMutableArray alloc]init];
    
    float yoffset = 40.0;

	uint arrayCount = [msgs count];
	for (int i = 0; i < arrayCount; i++) {
        if(i != 1){
            titleLabel = [CCLabelBMFont labelWithString:[msgs objectAtIndex:i] fntFile:MAIN_FONT];
            titleLabel.position = ccp(viewportHW,(viewportH - yoffset) - i*18);
            if(i == 0){
                titleLabel.scale = 1.0f;
            }else{
                titleLabel.scale = 0.30;
            }
            [self addChild:titleLabel];
            [lines addObject:titleLabel];
        }
	}
	
	if (score) {
        //NSLog(@"numstars : %i",stars);
		//titleLabel = [CCLabelBMFont labelWithString:[score stringValue] fntFile:MAIN_FONT];
		//titleLabel.position = ccp(viewportHW,(viewportH - yoffset) - 3*20);
		//titleLabel.scale = 0.8;
		//[self addChild:titleLabel];
		//[lines addObject:titleLabel];
        [self showStars:stars];
	}else{
        [self showStars:0];
    }
    
	
}

-(void)showMenuInfoForDataIPad:(NSArray *)data andScore:(NSNumber *)score andStars:(int)stars{
	
	[self removeAllSprites:nil];
	
	CCLabelBMFont *titleLabel;
	
	NSString *msg = [data objectAtIndex:1];
	NSArray *msgs = [msg componentsSeparatedByString:@"#"];
	
	lines = [[NSMutableArray alloc]init];
    float yoffset = 200.0;

	uint arrayCount = [msgs count];
	for (int i = 0; i < arrayCount; i++) {
		titleLabel = [CCLabelBMFont labelWithString:[msgs objectAtIndex:i] fntFile:MAIN_FONT];
        
		titleLabel.position = ccp(viewportHW,(viewportH - yoffset) - i*40);
        if(i == 0){
            titleLabel.scale = 1.2f;
        }else{
            titleLabel.scale = 0.53;
        }
		[self addChild:titleLabel];
		[lines addObject:titleLabel];
	}
	
	if (score) {
        //NSLog(@"numstars : %i",stars);
		//titleLabel = [CCLabelBMFont labelWithString:[score stringValue] fntFile:MAIN_FONT];
		//titleLabel.position = ccp(viewportHW,(viewportH - yoffset) - 3*40);
		//titleLabel.scale = 1.0;
		//[self addChild:titleLabel];
		//[lines addObject:titleLabel];
        [self showStars:stars];
	}else{
        [self showStars:0];
    }

	
}

-(void)showStars:(int)numstars{
    
    float yoffset = -20;
    if(ipad){
        yoffset = 200;
    }
    
    if(stars_holder == nil){
        stars_holder = [[CCSprite alloc] init];
        stars_holder.position = ccp(viewportHW - 40,(viewportH - yoffset) - 3*40);
        for (int i=0; i<3;i++) {
            CCSprite *star = [[CCSprite alloc] initWithSpriteFrameName:@"star.png"];
            star.position = ccp(i*40.0,0.0);
            star.visible = NO;
            [stars_holder addChild:star z:i tag:i];
            [star release];
        }
        [self addChild:stars_holder];
        [stars_holder release];
    }
    
    for (int x=0; x<3;x++) {
        [stars_holder getChildByTag:x].visible = NO;  
    }
    for (int j=0; j<numstars;j++) {
        [stars_holder getChildByTag:j].visible = YES;  
    }
    if(numstars == 2){
        stars_holder.position = ccp(viewportHW - 20,(viewportH - yoffset) - 3*40);
    }else if(numstars == 1){
        stars_holder.position = ccp(viewportHW - 0,(viewportH - yoffset) - 3*40);
    }else{
        stars_holder.position = ccp(viewportHW - 40,(viewportH - yoffset) - 3*40);
    }
}

-(void)showImageAlert:(NSNotification*)note{
	
	NSString *png = [[note userInfo] objectForKey:@"msg"];
	float time = [[[note userInfo] objectForKey:@"time"] floatValue];
	float alertScale = [[[note userInfo] objectForKey:@"alertScale"] floatValue];
	
	OOOBatmanAlert *alert;
	
	if (time) {
		alert = [[OOOBatmanAlert alloc]initWithPNGName:png andTime:time];
	}else{
		alert = [[OOOBatmanAlert alloc]initWithPNGName:png];
	}
	

	alert.position = ccp(viewportHW,viewportHH+30);
	
	float endScale = 0.0;
	if (alertScale){
		alert.scale = 0.7f;
		endScale = alertScale;
	}else{
		endScale = 2.0f;
	}
	id scale_action = [CCScaleBy actionWithDuration:0.4 scale:endScale];
	id ease_action = [CCEaseIn actionWithAction:scale_action rate:2];
	[alert runAction:ease_action];
	
	[self addChild:alert];
	[alert release];
	pressed = NO;
	
}

-(void)showAlert:(NSNotification *)note{
	pressed=NO;
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
	//bg = [[OOORect alloc]init];
	//[self addChild:bg];
    
    BOOL confimation_type = NO;
	
	bgImage = [[note userInfo] objectForKey:@"bg"];
	if(!bgImage){
		dialog_bg =[CCSprite spriteWithFile:@"notification_dialog_bg2.png"];
	}else {
		dialog_bg =[CCSprite spriteWithFile:bgImage];
        if([bgImage hasPrefix:@"CONF"]){
            confirmationDialogContext = bgImage;
            confimation_type = YES;
        }
        if(ipad){
            dialog_bg =[CCSprite spriteWithFile:@"extra_dialog_bg.png"];
            dialog_sub_bg =[CCSprite spriteWithFile:bgImage];
            [dialog_bg addChild:dialog_sub_bg];
            dialog_sub_bg.position =ccp(dialog_bg.contentSize.width/2.0f,dialog_bg.contentSize.height/2.0f);
            CCSprite *cadre =[CCSprite spriteWithFile:@"cadre2.png"];
            [dialog_bg addChild:cadre];
            cadre.position = ccp(dialog_bg.contentSize.width/2.0f,dialog_bg.contentSize.height/2.0f+5.0);
            cadre.scaleX = 0.98f;
        }
	}
    int viewportheight = screenSize.height;
    int viewportwidth = screenSize.width;
	dialog_bg.position =ccp(screenSize.width/2,viewportH + viewportheight);
    
    dialog_bg.scaleY= screenSize.height / 320.0f;
    dialog_bg.scaleX= screenSize.width / 480.0f;
	[self addChild:dialog_bg];
    id moveAction;
    if(ipad){
        moveAction=  [CCMoveBy actionWithDuration:0.6 position: ccp(0,-320-160-124)];
    }else{
        moveAction = [CCMoveBy actionWithDuration:0.6 position: ccp(0,-1.5*viewportheight)];
    }
	id ease_action = [CCEaseIn actionWithAction:moveAction rate:2];
	
    [dialog_bg 	runAction:ease_action];	
    
       
	lines = [[NSMutableArray alloc]init];

	CCLabelBMFont *titleLabel;
	
	NSString *msg = [[note userInfo] objectForKey:@"msg"];
    //NSLog(@"alert: %@",msg);
	NSArray *msgs = [msg componentsSeparatedByString:@"#"];
    //NSLog(@"alert: %@",msgs);
	
	int arrayCount = [msgs count];
	float textFieldHeight = 220.0;
	float effectiveHeight = arrayCount*40.0;
	float startPos = 320 - (textFieldHeight - effectiveHeight)/2.0;
	
	for (int i = 0; i < arrayCount; i++) {
		titleLabel = [CCLabelBMFont labelWithString:[msgs objectAtIndex:i] fntFile:MAIN_FONT];

		titleLabel.position = ccp(240.0, startPos  - 20 - i*40);
		titleLabel.scale = 0.7;
		//id scale_action = [CCScaleBy actionWithDuration:0.2 scale:5.0f];
		//id ease_action = [CCEaseIn actionWithAction:scale_action rate:2];
		//[titleLabel runAction:ease_action];
		[dialog_bg addChild:titleLabel];
		[lines addObject:titleLabel];
	}
	if([msg isEqualToString:@""]){
		imageAlertYpos = -130;
		//NSLog(@"NO text found! in alert %@",msgs);
	}else{
		imageAlertYpos = -80;
		//NSLog(@"text found! in alert");
	}
    
    if(confimation_type){
        [self schedule:@selector(drawYesNoButtons:) interval:1.5f];
    }else{
        [self schedule:@selector(drawButton:) interval:1.5f];
    }
	
}

-(void)drawYesNoButtons:(id)target{
	
	[self unschedule:@selector(drawYesNoButtons:)];

	menu = [CCMenu menuWithItems:nil];
	
	CCSprite *upsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green.png"];
	CCSprite *downsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green_down.png"];
	CCSprite *disabledsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_dis.png"];
	
	CCMenuItem *subItem = [CCMenuItemSprite itemFromNormalSprite:upsprite 
												  selectedSprite:downsprite 
												  disabledSprite:disabledsprite 
														  target:self 
														selector:@selector(dismissConfirmationDialog:)];
	NSString *text = @"YES";
	subItem.userData = [NSNumber numberWithInt:1];
	CCLabelBMFont *textLabel = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
	textLabel.position = ccp(round( subItem.contentSize.width / 2) ,round( subItem.contentSize.height / 2) - 8);
	
	textLabel.anchorPoint = ccp(0.5, 0.3);
	textLabel.scale = .65;
	[subItem addChild:textLabel];
	
    CCSprite *upsprite2 =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green.png"];
	CCSprite *downsprite2 =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green_down.png"];
	CCSprite *disabledsprite2 =[CCSprite spriteWithSpriteFrameName:@"generic_btn_dis.png"];
    
    CCMenuItem *subItem2 = [CCMenuItemSprite itemFromNormalSprite:upsprite2 
												  selectedSprite:downsprite2 
												  disabledSprite:disabledsprite2 
														  target:self 
														selector:@selector(dismissConfirmationDialog:)];
	NSString *text2 = @"NO THANKS";
	subItem2.userData = [NSNumber numberWithInt:0];
	CCLabelBMFont *textLabel2 = [CCLabelBMFont labelWithString:text2 fntFile:MAIN_FONT];
	textLabel2.position = ccp(round( subItem2.contentSize.width / 2) ,round( subItem2.contentSize.height / 2) - 8);
	
	textLabel2.anchorPoint = ccp(0.5, 0.3);
	textLabel2.scale = .65;
	[subItem2 addChild:textLabel2];
	
	//subItem.position = ccp(0,0);
	float ypos;
    if(ipad){
        ypos = 60;
    }else{
        ypos = 30;
    }
    if(ipad){
        subItem.position = ccp(135,ypos);
        subItem2.position = ccp(385,ypos);
    }else{
        subItem.position = ccp(115,ypos);
        subItem2.position = ccp(375,ypos);
    }
    [menu addChild:subItem];
    [menu addChild:subItem2];

    menu.position = ccp(0,0);
	[dialog_bg addChild:menu];
}

-(void)drawButton:(id)target{
	
	[self unschedule:@selector(drawButton:)];
	/*
	CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithFile:@"gui_texture.pvr" capacity:150];
	//[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"gui_texture.plist"];
	
	CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:@"gui_texture.pvr"];
	[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"gui_texture.plist" texture:tex];
	
	[self addChild:sheet z:0 tag:1];
	*/
	menu = [CCMenu menuWithItems:nil];
	
	CCSprite *upsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green.png"];
	CCSprite *downsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green_down.png"];
	CCSprite *disabledsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_dis.png"];
	
	CCMenuItem *subItem = [CCMenuItemSprite itemFromNormalSprite:upsprite 
												  selectedSprite:downsprite 
												  disabledSprite:disabledsprite 
														  target:self 
														selector:@selector(dismissAlert:)];
	NSString *text = @"OK";
	//subItem.userData = [[NSNumber numberWithInt:1] retain];
	CCLabelBMFont *textLabel = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
	textLabel.position = ccp(round( subItem.contentSize.width / 2) ,round( subItem.contentSize.height / 2) - 8);
	
	textLabel.anchorPoint = ccp(0.5, 0.3);
	textLabel.scale = .65;
	[subItem addChild:textLabel z:99];	
	
	//subItem.position = ccp(0,0);
	float ypos;
    if(ipad){
        ypos = 60;
    }else{
        ypos = 40;
    }
	[menu addChild:subItem];
	[menuItems addObject:subItem];
    menu.position = ccp(365,ypos);
    if(bgImage){
        if(ipad){
            menu.position = ccp(390,ypos);
        }else{
            menu.position = ccp(380,ypos-10);
        }
    }
	[dialog_bg addChild:menu];
}


-(void)dismissConfirmationDialog:(CCMenuItemSprite *)sender{
    
    BOOL yes = [(NSNumber *)sender.userData boolValue];
    NSDictionary *confirmation_info;
    if(yes){
        confirmation_info = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1],@"state",nil];
    }else{
        confirmation_info = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0],@"state",nil];
    }
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:confirmationDialogContext
                       object:nil 
                       userInfo:confirmation_info]];
    
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];	
    
    //if(!yes){
        
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
					   notificationWithName:@"resumeGame" 
					   object:nil 
					   userInfo:nil]];
        
    //}
    [self hideAlert];
}


-(void)dismissAlert:(id)sender{
	//NSLog(@"click!");
	if(!pressed){
		pressed=YES;
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
				postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];	
		[[NSNotificationCenter defaultCenter] 
				postNotification:[NSNotification 
					   notificationWithName:@"resumeGame" 
					   object:nil 
					   userInfo:nil]];
	
		[self hideAlert];
	}
}

-(void)hideAlert{
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	id moveAction = [CCMoveBy actionWithDuration:0.3 position: ccp(0,screenSize.height)];
	id ease_action = [CCEaseIn actionWithAction:moveAction rate:2];
	CCCallFunc *funcCall = [CCCallFunc actionWithTarget:self selector:@selector(removeAllSprites:)];
	[dialog_bg runAction:[CCSequence actions:ease_action,funcCall,nil]];			 

}


-(void)removeAllSprites:(id) sel
{
	int arrayCount = [lines count];
	for (int i = 0; i < arrayCount; i++) {
		[self removeChild:[lines objectAtIndex:i] cleanup:YES];
	}
	[self removeChild:menu cleanup:YES];
	[self removeChild:bg cleanup:YES];
    if(dialog_sub_bg)
    {
          //  [self removeChild:dialog_sub_bg cleanup:YES];
    }
	[bg release];
	[lines release];
    lines = nil;
}

-(void)dealloc{
    [raterequest release];
    [lines release];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

@end
