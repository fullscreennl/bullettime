//
//  OOOCalibratorAccelorator.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OOOCalibratorAccelorator.h"
#import "OOOGameSettingsManager.h"
#import "cocos2d.h"
#import "OOOConfig.h"

@implementation OOOCalibratorAccelorator

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OOOCalibratorAccelorator *layer = [OOOCalibratorAccelorator node];
	
	//BackgroundLayer *bgLayer = [BackgroundLayer layer];
	[scene addChild: layer];
	// return the scene
	return scene;
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
		settings = [[OOOGameSettingsManager sharedManager] getSettings];
		
		
		
		framecounter = 0;
		// enable touches
		self.isTouchEnabled = YES;
		
		// enable accelerometer
		self.isAccelerometerEnabled = YES;
		
		CGSize screenSize = [CCDirector sharedDirector].winSize;
		CCSprite *bg = [CCSprite spriteWithFile:@"calibration_dialog_painted_s.png"];
		[self addChild:bg];
        if(ipad){
            CCSprite *bg2 = [CCSprite spriteWithFile:@"cadre2.png"];
            bg2.scaleX = 0.98f;
            [bg addChild:bg2];
            bg2.position =ccp(bg.contentSize.width/2.0f,bg.contentSize.height/2.0f+7);
        }
        bg.position = ccp(screenSize.width/2,screenSize.height/2);
        
		samples = [NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:0.0f],[NSNumber numberWithFloat:0.0f],nil]; 
		[samples retain];
	
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
															selector:@selector(onCalibrate:)];	
		
		
		
		NSString *text = @"CALIBRATE";
		//subItem.userData = [[NSNumber numberWithInt:1] retain];
		CCLabelBMFont *textLabel = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
		textLabel.position = ccp(round( subItem.contentSize.width / 2)-10 ,round( subItem.contentSize.height / 2) - 8);
		
		textLabel.anchorPoint = ccp(0.5, 0.3);
		textLabel.scale = .65;
		[subItem addChild:textLabel z:99];	
		
		[menu addChild:subItem z:1 tag:1];
		subItem.position = ccp(-110, -65);
        CCSprite *upsprite2 =[CCSprite spriteWithSpriteFrameName:@"generic_btn_orange.png"];
		CCSprite *downsprite2 =[CCSprite spriteWithSpriteFrameName:@"generic_btn_orange_down.png"];
		disabledsprite =[CCSprite spriteWithSpriteFrameName:@"generic_btn_dis.png"];
		
		CCMenuItem *subItem2 = [CCMenuItemSprite itemFromNormalSprite:upsprite2 
													   selectedSprite:downsprite2 
													   disabledSprite:disabledsprite 
															   target:self 
															 selector:@selector(onResetCalibrate:)];	
		text = @"RESET";
		//subItem.userData = [[NSNumber numberWithInt:1] retain];
		CCLabelBMFont *textLabel2 = [CCLabelBMFont labelWithString:text fntFile:MAIN_FONT];
		textLabel2.position = ccp(round( subItem.contentSize.width / 2)-10 ,round( subItem.contentSize.height / 2) - 8);
		
		textLabel2.anchorPoint = ccp(0.5, 0.3);
		textLabel2.scale = .65;
		[subItem2 addChild:textLabel2 z:99];	
		
		[menu addChild:subItem2 z:2 tag:2];
		subItem2.position = ccp(110, -65);
		
		
		//CGPoint dstPoint = subItem.position;
		//int offset = round(screenSize.width/2 + 150); 240 + 150
		//id movebtn = [CCMoveBy actionWithDuration:2 position:ccp(dstPoint.x - offset,0)];
		//id actionbtn = [CCEaseElasticOut actionWithAction:movebtn period:0.3f];
		
		//subItem.position = ccp( dstPoint.x + offset, dstPoint.y);
		//[subItem runAction:actionbtn];
		
		[self addChild:menu];
		[self buildMenuBTN];
		[self buildIndicator];
	}	
	return self;
}


-(void) buildMenuBTN
{
	CCMenu *menu = [CCMenu menuWithItems:nil];
	//menu.position = ccp(240, 160);
	CGSize screenSize = [CCDirector sharedDirector].winSize;
	
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
	
	textLabel.anchorPoint = ccp(0.5, 0.3);
	textLabel.scale = .65;
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
	
	[self addChild:menu];		
}


-(void)buildIndicator
{
	//CCSpriteBatchNode *_sheet = [CCSpriteBatchNode batchNodeWithFile:@"main_texture.png" capacity:150];
	//[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"main_texture.plist"];
	//[self addChild:_sheet z:0 tag:674];
	
	//ind = [[CCSprite alloc] initWithSpriteFrameName:@"hero_neutral_pose.png"];
	ind =[CCSprite spriteWithSpriteFrameName:@"calibration_indicator.png"]; 
	[self addChild:ind];
	ind.position =ccp(viewportHW,viewportHH - 90);
	ind.scale = .4;

}

-(void)onResetCalibrate:(id) sel{
	//NSLog(@"onResetCalibrate");
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
					   postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
	//return avg;
	[settings setObject:[NSNumber numberWithFloat:0.0f] forKey:@"calibrationOffset"];
	[[OOOGameSettingsManager sharedManager] save];
}


-(void)onCalibrate:(id) sel{
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
					   postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
	//NSLog(@"onCalibrate");
	float sum = 0;
	int i = 0;
	float sub = 0;
	for (i = 0; i < 3 ;i = i + 1){
		//NSLog(@"%i",i);
		//NSLog(@"%@",[samples objectAtIndex:0]);
		sub = [[samples objectAtIndex:i] floatValue];
		sum = sum + sub;
		
		//NSLog(@"array value %i: %f",i,sub);
	}
	float avg = (sum / 3.0f);
	//NSLog(@"average value");
	//return avg;
	[settings setObject:[NSNumber numberWithFloat:avg] forKey:@"calibrationOffset"];
	[[OOOGameSettingsManager sharedManager] save];
}

-(void) goBack: (id)sender
{
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"menu_tap", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];	
	//[[CCDirector sharedDirector] replaceScene:[CCFadeTransition transitionWithDuration:1.0 scene:[OOOMainMenu scene]]];
	/*
	NSDictionary *dict = [[NSDictionary dictionaryWithObject:@"leveldata/menu" forKey:@"level_id"] retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onDrawLevel" 
					   object:nil
					   userInfo:dict]];
	[dict release];
	*/
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onLeaveLevel" 
					   object:nil
					   userInfo:nil]];
	
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
	//NSLog(@"accelaration.x: %2.1f accelaration.y %2.3f", round(acceleration.x*10)/10.0, round(acceleration.y*1000)/1000.0);
	
	
	//float accelX = (float) acceleration.x * 500;
	float accelY = (float) acceleration.y;
	float calibrationOffset = [[settings objectForKey:@"calibrationOffset"] floatValue];
	float newOffset = (accelY - calibrationOffset)*240.0;
	
	//ind.position =ccp(240 + newOffset, 68);
	ind.position =ccp(viewportHW + newOffset,viewportHH - 90);
	
	if (framecounter > 2) {
		framecounter = 0;
	}
	[samples replaceObjectAtIndex:framecounter withObject:[NSNumber numberWithFloat:accelY]];
	framecounter =  framecounter + 1;	
}

- (void)dealloc 
{
	//[settings release];
    //[ind release];
	[samples release];
	//NSLog(@"deallocing OOOCalibratorAccelorator!!");
    [super dealloc];
}

@end
