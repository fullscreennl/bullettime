//
//  MainSplash.mm
//  BeetleBeat
//
//  Created by Jeroen Goor van on 2/25/10.
//  Copyright 2010 fullscreen. All rights reserved.
//



#import "OOOSettings.h"
#import "OOOConfig.h"
#import "OOOGameSettingsManager.h"
#import"OOOCalibratorAccelorator.h"

@implementation OOOSettings

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OOOSettings *layer = [OOOSettings node];
	
	//BackgroundLayer *bgLayer = [BackgroundLayer layer];
	[scene addChild: layer];
	// return the scene
	return scene;
}


- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView: [touch view]];
	//NSLog(@"touches pos: %3f",location.x);
	if (location.x>viewportHH + 15.0 and location.x<viewportHH + 80) {
		[self toggleSound];
	}else if(location.x>viewportHH - 80 and location.x< viewportHH + 10) {
		[self setControlFlip];
	}
	/*
	else if(location.x>0 and location.x<70.0f) {
		[self setCalibration];
	}*/
	
}

-(void)setControlFlip
{
	if(flipControls == NO){
		flipControls = YES;
	}else{
		flipControls = NO;
	}
	NSDictionary *userinfo3 = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo3]];
	[self setSwirlPos:soundFXMuted];
}

-(void)setCalibration
{
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[OOOCalibratorAccelorator scene]]];
    
}

-(void)toggleSound
{
	if(soundFXMuted == NO){
		NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo]];
		soundFXMuted = YES;
		NSDictionary *userinfo1 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1], @"muted",nil];
		[[NSNotificationCenter defaultCenter] 
						   postNotification:[NSNotification 
						   notificationWithName:@"onSoundFXSwitch" 
						   object:nil 
						   userInfo:userinfo1]];
		
		
	}else{
		soundFXMuted = NO;
		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0], @"muted",nil];
		[[NSNotificationCenter defaultCenter] 
						   postNotification:[NSNotification 
						   notificationWithName:@"onSoundFXSwitch" 
						   object:nil 
						   userInfo:userinfo2]];
		
		NSDictionary *userinfo3 = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
		[[NSNotificationCenter defaultCenter] 
						   postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo3]];
		
		;
	}
	
	[self setSwirlPos:soundFXMuted];
}


-(void)toggleDoodle
{
/*
	if(doodleStyle == NO){
		doodleStyle = YES;
	}else{
		doodleStyle = NO;
	}
	
	[self setSwirlPos:soundFXMuted];
 */
}


-(void)setSwirlPos:(BOOL)_soundState
{
	if(_soundState == YES){
		//off
		
		//swirlSprite.position = ccp(398, 160+35);
		swirlSpriteOff.opacity = 255;
		swirlSprite.opacity = 0;
	}else{
		//on
		//friendSilentSpr.opacity = 0;
		//friendloudSpr.opacity = 255;
		
		//swirlSprite.position = ccp(314, 160+35);
		swirlSpriteOff.opacity = 0;
		swirlSprite.opacity = 255;
	}
	
	if(flipControls == NO){
		//swirlSprite2.position = ccp(398, 60+62);
		swirlSpriteOff2.opacity = 255;
		swirlSprite2.opacity = 0;
		[jumpshootLabel setString:@"J  S"];
		
	}else{
		//swirlSprite2.position = ccp(314, 60+62);
		swirlSpriteOff2.opacity = 0;
		swirlSprite2.opacity = 255;
		[jumpshootLabel setString:@"S  J"];
	}
	/*writing to local settings.plist*/
	
	/*
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *appSettingsPath = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"];
	[settings setObject:[NSNumber numberWithBool:soundFXMuted] forKey:@"soundFXMuted"];
	[settings setObject:[NSNumber numberWithBool:flipControls] forKey:@"flipControls"];
	//[settings setObject:calibrationOffset forKey:@""];
	[settings writeToFile:appSettingsPath atomically:YES];
	[[OOOGameSettingsManager sharedManager] setSettings:settings];
	*/
	[settings setObject:[NSNumber numberWithBool:soundFXMuted] forKey:@"soundFXMuted"];
	[settings setObject:[NSNumber numberWithBool:flipControls] forKey:@"flipControls"];
	[[OOOGameSettingsManager sharedManager] save];
}

-(void)sniffDeviceEnv{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewportH = 768;
        viewportW = 1024;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = YES;
    }else{
        viewportH = 375;
        viewportW = 667;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipad = NO;
    }
}

-(id) init
{
	if( (self=[super init])) {
        [self sniffDeviceEnv];
		self.isTouchEnabled = YES;
		/*
		CCSpriteBatchNode *sheet = [CCSpriteBatchNode batchNodeWithFile:@"gui_texture.pvr" capacity:150];
		
		
		CCTexture2D *tex = [[CCTextureCache sharedTextureCache] addImage:@"gui_texture.pvr"];
		[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"gui_texture.plist" texture:tex];
		
		[self addChild:sheet z:0 tag:674];
		*/
		settings = [[OOOGameSettingsManager sharedManager] getSettings];
		soundFXMuted = [[settings objectForKey:@"soundFXMuted"] boolValue];
		flipControls =[[settings objectForKey:@"flipControls"] boolValue];
		calibrationOffset = [settings objectForKey:@"calibrationOffset"];
		CGSize screenSize = [CCDirector sharedDirector].winSize;
		
		
		CCSprite *sprite = [CCSprite spriteWithFile:@"settings_dialog_painted_s.png"];
		[self addChild:sprite];
		sprite.position = ccp( screenSize.width/2, screenSize.height/2);
		
        if(ipad){
            CCSprite *bg2 = [CCSprite spriteWithFile:@"cadre2.png"];
            bg2.scaleX = 0.98f;
            [sprite addChild:bg2];
            bg2.position =ccp(sprite.contentSize.width/2.0f,sprite.contentSize.height/2.0f+7);
        }
		swirlSprite = [CCSprite  spriteWithSpriteFrameName:@"swirl_painted.png"];
		[self addChild:swirlSprite];
		//swirlSprite.scale=0.5;
		swirlSprite.position = ccp(viewportHW + 74, viewportHH + 35);
		
		swirlSpriteOff = [CCSprite spriteWithSpriteFrameName:@"swirl_painted_off.png"];
		[self addChild:swirlSpriteOff];
		//swirlSpriteOff.scale=0.5;
		swirlSpriteOff.position = ccp(viewportHW + 158, viewportHH + 35);
		swirlSprite2 = [CCSprite  spriteWithSpriteFrameName:@"swirl_painted.png"];
		[self addChild:swirlSprite2];
		//swirlSprite2.scale=0.5;
		swirlSprite2.position = ccp(viewportHW + 74, viewportHH - 38);
		swirlSpriteOff2 = [CCSprite  spriteWithSpriteFrameName:@"swirl_painted_off.png"];
		//swirlSpriteOff2.scale=0.5;
		swirlSpriteOff2.position = ccp(viewportHW + 158, viewportHH - 38);
		[self addChild:swirlSpriteOff2];
		
		
		CCMenu *menu = [CCMenu menuWithItems:nil];
		//menu.position = ccp(240, 160);
		
				
		CCSprite *upsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green.png"];
		CCSprite *downsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green_down.png"];
		CCSprite *disabledsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_dis.png"];
		//CCSprite *upsprite = [CCSprite spriteWithFile:@"generic_btn.png"];
		CCMenuItem *subItem = [CCMenuItemSprite itemFromNormalSprite:upsprite 
													  selectedSprite:downsprite 
													  disabledSprite:disabledsprite 
															  target:self 
															selector:@selector(goBack:)];	
		
		NSString *text = @"MENU";
		//subItem.userData = [[NSNumber numberWithInt:1] retain];
		CCLabelBMFont *textLabel = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
		textLabel.position = ccp(round( subItem.contentSize.width / 2)-35 ,round( subItem.contentSize.height / 2) - 8);
		
		textLabel.anchorPoint = ccp(0.5, 0.2);
		textLabel.scale = .6;
		[subItem addChild:textLabel z:99];	
		
		[menu addChild:subItem z:1 tag:1];
		subItem.position = ccp(115, 120);
		subItem.rotation = -9;
		CGPoint dstPoint = subItem.position;
		int offset = round(screenSize.width/2) + 150;
		id movebtn = [CCMoveBy actionWithDuration:2 position:ccp(dstPoint.x - offset,0)];
		id actionbtn = [CCEaseElasticOut actionWithAction:movebtn period:0.3f];
		
		subItem.position = ccp( dstPoint.x + offset, dstPoint.y);
		[subItem runAction:actionbtn];
		upsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green.png"];
		downsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_green_down.png"];
		disabledsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_dis.png"];
		
		CCMenuItem *subItem2 = [CCMenuItemSprite itemFromNormalSprite:upsprite 
													   selectedSprite:downsprite 
													   disabledSprite:disabledsprite 
															   target:self 
															 selector:@selector(setCalibration)];	
		text = @"CALIBRATE";
		//subItem.userData = [[NSNumber numberWithInt:1] retain];
		CCLabelBMFont *textLabel2 = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
		textLabel2.position = ccp(round( subItem2.contentSize.width / 2)-10 ,round( subItem2.contentSize.height / 2) - 8);
		
		textLabel2.anchorPoint = ccp(0.5, 0.2);
		textLabel2.scale = .6;
		[subItem2 addChild:textLabel2 z:99];	
		
		[menu addChild:subItem2 z:2 tag:2];
		subItem2.position = ccp(110, -105);
		
		
		
		
		[self addChild:menu];		
		
		
		text = @"J  S";
		//subItem.userData = [[NSNumber numberWithInt:1] retain];
		jumpshootLabel = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
		jumpshootLabel.position = ccp(viewportHW -12 ,viewportHH - 43);
		
		//textLabel.anchorPoint = ccp(0.5, 0.5);
		jumpshootLabel.scale = .3;
		[self addChild:jumpshootLabel];
		
		[self setSwirlPos:soundFXMuted];
		
	}
	return self;
}	

-(void) goBack: (id)sender
{
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];	
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onLeaveLevel" 
					   object:nil
					   userInfo:nil]];
}



- (void)dealloc 
{
	//[settings release];
	//NSLog(@"deallocing settings");
    [super dealloc];
}


@end
