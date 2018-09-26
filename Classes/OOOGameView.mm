//
//  OOOGameView.m
//  oneonone
//
//  Created by Johan ten Broeke on 2/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

// enums that will be used as tags

#import "OOOGameView.h"
#import "OOOGameSprite.h"
#import "OOOBackgroundLayer.h"
#import "OOODebugDrawLayer.h"
#import "SimpleAudioEngine.h"
#import "OOOJointLayer.h"
#import "OOOQuitLevelLayer.h"
#import "OOOConfig.h"
#import "OOOTextureCacheManager.h"
#import "OOOGameSettingsManager.h"
#import "OOOJointTexture.h"
#import "StaticVisualSprite.h"
#import "OOOFrontLayer.h"

#import "OOORecordedFrameData.h"
#import "OOOSharedInputRecorder.h"

#import "OOOAchievementManager.h"
#import "AccelerometerSimulation.h"
#import "oneononeAppDelegate.h"

@implementation OOOGameView

static int numobjects = 0;

+(id) sceneWithLevelId:(NSString *)level_id
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OOOGameView *layer = [OOOGameView node];
	[layer buildLevel:level_id];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

+(id) sceneWithDictionary:(NSDictionary *)dict
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OOOGameView *layer = [OOOGameView node];
	[layer buildLevelWithDictionary:dict];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

+(void)addInstance{
	numobjects ++;
	//NSLog(@"add num OOOGameView objects %i",numobjects);
}

+(void)removeInstance{
	numobjects --;
	//NSLog(@"remove num OOOGameView objects %i",numobjects);
}

+(int)getNumInstances{
	return numobjects;
}

-(void)drawBG:(NSArray*)arr{
	//NSLog(@"arr %@",arr);
	bgLayer = [OOOBackgroundLayer layer];
	[bgLayer drawWithImages:arr];
	[self addChild: bgLayer z:0 tag:666];
}

-(void)drawFG:(NSArray*)arr{
	fgLayer = [OOOFrontLayer layer];
	[fgLayer drawWithImages:arr];
	[self addChild: fgLayer z:0 tag:666];
}

-(id) init
{
	if( (self=[super init])) {
        screenSize = [(oneononeAppDelegate*)[[UIApplication sharedApplication] delegate] getScreenSize];
        [self sniffDeviceEnv];
        
		[OOOGameView addInstance];
		
		framecounter = 0;
		gameModel = [[OOOGameModel alloc] init];
		// enable touches
		self.isTouchEnabled = YES;
		
		// enable accelerometer
		//self.isAccelerometerEnabled = YES;
		
		CGSize screenSize = [CCDirector sharedDirector].winSize;
		CCLOG(@"Screen width %0.2f screen height %0.2f",screenSize.width,screenSize.height);
		
		//bgLayer = [OOOBackgroundLayer layer];
		//NSArray *deafaultBGFormat = [NSArray arrayWithObjects:@"background_tile3.png",@"moon.png",@"tree_%@.png",@"flat_%@.png",@"cloud_2.png",nil];
		//[bgLayer drawWithImages:deafaultBGFormat];
		//[self addChild: bgLayer z:0 tag:666];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onScroll:) 
													 name:@"onScroll" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(stopScrolling:) 
													 name:@"stopGameScrolling" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(resumeScrolling:) 
													 name:@"resumeGameScrolling" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onGameViewMoveBy:) 
													 name:@"onGameViewMoveBy" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(switchScrollStrategy:) 
													 name:@"scrollStrategy" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onJump:) 
													 name:@"onJump" 
												   object:nil];

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onZoom:) 
													 name:@"onZoomTriggerHit" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(zoom:) 
													 name:@"zoom" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(alert:) 
													 name:@"onAlertHit" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onEventTrigger:) 
													 name:@"onEventTriggerHit" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(resumeGame:) 
													 name:@"resumeGame" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(stopGame:) 
													 name:@"stopGame" 
												   object:nil];

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onControllsDisabled:) 
													 name:@"disableControlls" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(enableControlls:) 
													 name:@"speachCompleted" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(goTouchMode:) 
													 name:@"touchControlMode" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(doubleTeleporter:) 
													 name:@"doubleTeleporter" 
												   object:nil];
		

		cannon = [[OOOCannon alloc] init];
		
		world_orientation = WORLD_ORIENTATION_UP;
		
		worldScaling = 1.0f;
		targetScaling = 1.0f;
		accelY = 0.0f;
		
		alertShown = NO;
		NSMutableDictionary *settings = [[OOOGameSettingsManager sharedManager ] getSettings];
		calibrationOffset = [settings objectForKey:@"calibrationOffset"];
		flipControls = [[settings objectForKey:@"flipControls"] boolValue];
		nonVisibleSprites =[[NSMutableArray alloc] init];
		scrollMode = SCROLLMODE_STANDARD; //SCROLLMODE_BATTLE;
		scollPosSwitchSpeed = SCROLLPOS_SWITCH_NORMAL;
		
		controllsEnabled = YES;
        
        //if (RECORDING_PLAYBACK_MODE != 0) {
        //    uir = [[OOOSharedInputRecorder alloc] init];
        //    currentRecordingFrame = [[OOORecordedFrameData alloc] init];
        //    if (RECORDING_PLAYBACK_MODE == 2){
        //        controllsEnabled = NO;
        //        [uir loadFile];
        //    }
        //}
        
        timestep_accumulator = 0.0f;
        
        //touchControlMode = TOUCH_CONTROL_MODE_AB;
        touchControlMode = TOUCH_CONTROL_MODE_NORMAL;
        
        scrollID = @"none";
        
        scrolling = YES;
    
    }
	return self;
}


-(void)doubleTeleporter:(NSNotification *)note{
    CCSprite *im = [CCSprite spriteWithSpriteFrameName:@"teleporter.png"];
    im.position = ccp(480*6.0-50.0,60.0);
    [self addChild:im];
}

-(void)sniffDeviceEnv{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        viewportH = 768;
        viewportW = 1024;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipadZoomCompensation = 2.13333;
    }else{
        viewportH = screenSize.height;
        viewportW = screenSize.width;
        viewportHH = viewportH/2;
        viewportHW = viewportW/2;
        ipadZoomCompensation = 1.4;
    }
}

-(void)onControllsDisabled:(NSNotification*)note{
	controllsEnabled = NO;
}

-(void)enableControlls:(NSNotification*)note{
    controllsEnabled = YES;
}

-(void)switchScrollStrategy:(NSNotification *)note{
    if(touchControlMode == TOUCH_CONTROL_MODE_AB){
        return;
    }
	scrollMode = [[[note userInfo] objectForKey:@"type"]intValue];
	if(scrollMode == SCROLLMODE_BATTLE){
		scollPosSwitchSpeed = SCROLLPOS_SWITCH_FAST;
	}else{
		scollPosSwitchSpeed = SCROLLPOS_SWITCH_NORMAL;
	}
}

-(void)resumeGame:(NSNotification *)note{
    if (RECORDING_PLAYBACK_MODE != 2){
        controllsEnabled = YES;
    }
	alertShown = NO;
}

-(void)stopGame:(NSNotification*)note{
	alertShown = YES;
}


-(void)onEventTrigger:(NSNotification *)note{
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	NSString *msg = @"";
	
	if ([[sprite1 getName] isEqualToString:@"EventTrigger"]) {
		msg = [sprite1 getSpriteData]; 
		[sprite1 destroy];
	}else if ([[sprite2 getName] isEqualToString:@"EventTrigger"]) {
		msg = [sprite2 getSpriteData]; 
		[sprite2 destroy];
	}
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:msg 
					   object:nil 
					   userInfo:nil]];
	
}


-(void)alert:(NSNotification *)note{
    
    
	
	alertShown = YES;
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	NSString *msg = @"";
	NSString *bg = nil;
	
	if ([[sprite1 getName] isEqualToString:@"Alert"]) {
		msg = [sprite1 getSpriteData]; 
		[sprite1 destroy];
	}else if ([[sprite2 getName] isEqualToString:@"Alert"]) {
		msg = [sprite2 getSpriteData]; 
		[sprite2 destroy];
	}
	
	if ([[sprite1 getName] isEqualToString:@"ImageAlert"]) {
		bg = [sprite1 getSpriteData]; 
		[sprite1 destroy];
	}else if ([[sprite2 getName] isEqualToString:@"ImageAlert"]) {
		bg = [sprite2 getSpriteData]; 
		[sprite2 destroy];
	}
    
    // DIRTY HACK ALERT - this should not be in a base class //
    if([OOOAchievementManager isGameCenterAPIAvailable] && [bg isEqualToString:@"CONF_gamecenter.png"]){
        alertShown = NO;
        return;
    }
    
    // DIRTY HACK ALERT - this should not be in a base class //
    if([[[[OOOGameSettingsManager sharedManager] getSettings] objectForKey:@"userHasRated"] boolValue] && [bg isEqualToString:@"CONF_rating_request.png"]){
        alertShown = NO;
        return;
    }
	
	//NSLog(@"alert! %@",msg);
	
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:msg ,@"msg" ,bg, @"bg" ,nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"showAlert" 
					   object:nil 
					   userInfo:userInfo]];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"stopGame" 
					   object:nil 
					   userInfo:nil]];
	
}

-(void)zoom:(NSNotification *)note{
	NSNumber *zoomfact = [[note userInfo] objectForKey:@"zoomfact"];
    //NSLog(@"zoom fact:%@",zoomfact);
    float zf;
    if([zoomfact floatValue] <= 0.6){
        zf = [zoomfact floatValue]*ipadZoomCompensation;
    }else{
        zf = [zoomfact floatValue];
    }
    
	[self setTargetScaling:zf];
}

-(void)onZoom: (NSNotification *)note{
	
	//NSLog(@"onZoom!");
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	NSString *zoomfact = @"1.0";
	
	if ([[sprite1 getName] isEqualToString:@"ZoomTrigger"]) {
		zoomfact = [sprite1 getSpriteData]; 
	}else if ([[sprite2 getName] isEqualToString:@"ZoomTrigger"]) {
		zoomfact = [sprite2 getSpriteData]; 
	}	

    float zf;
    if([zoomfact floatValue] <= 0.6){
        zf = [zoomfact floatValue]*ipadZoomCompensation;
    }else{
        zf = [zoomfact floatValue];
    }
    
	[self setTargetScaling:zf];

}

-(void)setTargetScaling:(float)scaleFact{
	targetScaling = scaleFact;
	float diff = targetScaling - worldScaling;
	scaleStep = diff/60.0f;
	numTransitionFrames = 0;
}

-(void)setTargetPos:(float)pos{
	if (pos != 0.0f) {
		targetPos = pos;
	}
	float diff = targetPos - actualPos;
	float posStep = diff/scollPosSwitchSpeed;
	actualPos = actualPos + posStep;
}

-(void)onJump:(NSNotification *)note{
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"hero_jump", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
}

-(void)onGameViewMoveBy:(NSNotification *)note{
    
    float regX = -((GAMEWORLD_WIDTH/2)-viewportHW)*worldScaling;
	
    float maxX = regX - viewportHW +(GAMEWORLD_WIDTH/2)*worldScaling;
	float minX = regX + viewportHW -(GAMEWORLD_WIDTH/2)*worldScaling;
    
    float dist = [[[note userInfo] objectForKey:@"swipedist"] floatValue];
    if(self.position.x - dist > maxX){
        self.position = ccp(maxX,self.position.y);
    }else if(self.position.x - dist < minX){
        self.position = ccp(minX,self.position.y);
    }else{
        self.position = ccp( self.position.x - dist, self.position.y);
    }
    bgLayer.position = CGPointMake( -(self.position.x*0.2), 0);
	[bgLayer paralax];
}

-(void)stopScrolling:(NSNotification*)note{
    scrolling = NO;
}

-(void)resumeScrolling:(NSNotification*)note{
    scrolling = YES;
}

-(void)onScroll:(NSNotification *)note{
    
    if(!scrolling){
        return;
    }
    
    float inx = [[[note userInfo] objectForKey:@"xposition"] floatValue];
	float iny = [[[note userInfo] objectForKey:@"yposition"] floatValue];

    if(![scrollID isEqualToString:[[note userInfo] objectForKey:@"id"]]){
        scrollDistX = prevScrollX - inx;
        scrollDistY = prevScrollY - iny;
        scrollID = [[note userInfo] objectForKey:@"id"];
    }
    
    prevScrollX = inx;
    prevScrollY = iny;
    
     
    scrollDistY = scrollDistY/1.02;
    scrollDistX = scrollDistX/1.02;
    
    heroposX = inx + scrollDistX;
	heroposY = iny + scrollDistY;

	BOOL transition_compensation = NO;
	
	if(worldScaling != targetScaling){
		transition_compensation = YES;
		numTransitionFrames ++;
		worldScaling = worldScaling + scaleStep;
		if (numTransitionFrames == 60) {
			worldScaling = targetScaling;
			transition_compensation = NO;
		}
	}
	
	float worldposX;
	float worldposY;
	
	float regX = -((GAMEWORLD_WIDTH/2)-viewportHW)*worldScaling;
	float regY = -((GAMEWORLD_HEIGHT/2)-viewportHH)*worldScaling;
	
	worldposX = - (heroposX  - actualPos) * worldScaling;
	worldposY = - (heroposY  - viewportHH - (120/worldScaling))* worldScaling;
	
	float maxX = regX - viewportHW +(GAMEWORLD_WIDTH/2)*worldScaling;
	float minX = regX + viewportHW -(GAMEWORLD_WIDTH/2)*worldScaling;
	
	float maxY = regY - viewportHH +(GAMEWORLD_HEIGHT/2)*worldScaling;
	float minY = regY + viewportHH -(GAMEWORLD_HEIGHT/2)*worldScaling;
	
	if (worldposX > maxX) {
		worldposX = maxX;
	}
	
	if (worldposX < minX) {
		worldposX = minX;
	}
	
	if (worldposY > maxY) {
		worldposY = maxY;
	}
	
	if (worldposY < minY) {
		worldposY = minY;
	}
	
	if (GAMEWORLD_HEIGHT*worldScaling < viewportH) {
		worldposY = regY;
	}
	
	if (GAMEWORLD_WIDTH*worldScaling < viewportW) {
		worldposX = regX;
	}
	
	self.scale = worldScaling;	
	self.position = CGPointMake( worldposX, worldposY);
	
	bgLayer.position = CGPointMake( -(worldposX*0.2), 0);
	[bgLayer paralax];
	
	float xspeed = [[[note userInfo] objectForKey:@"xspeed"] floatValue];
	
	float offset;
	if (transition_compensation) {
		offset = 0;
	}else{
		offset = 200/worldScaling;
	}
	
	if (scrollMode == SCROLLMODE_STANDARD) {

		if(xspeed < -5){
			[self setTargetPos:viewportHW+offset];
		}else if (xspeed > 2) {
			[self setTargetPos:viewportHW-offset];
		}else {
			[self setTargetPos:viewportHW];
		}
		
	}else if(scrollMode == SCROLLMODE_BATTLE){
		
		if(accelY > 50){
			[self setTargetPos:viewportHW+offset];
		}else if (accelY < -50) {
			[self setTargetPos:viewportHW-offset];
		}else {
			[self setTargetPos:0.0f];
		}

	
	}else if(scrollMode == SCROLLMODE_LEFT){
		
		[self setTargetPos:viewportHW-offset];
		
	}else if(scrollMode == SCROLLMODE_RIGHT){
		
		[self setTargetPos:viewportHW+offset];
		
	}
}

-(void)buildLevelWithDictionary:(NSDictionary *)dict{
	level_data_loader = [[OOOLevelData alloc] initWithDict:dict];
	[self drawLevel];	
}

-(void)buildLevel:(NSString *)level_id{
	[level_data_loader release];
	//NSLog(@"level id:%@",level_id);
	level_data_loader = [[OOOLevelData alloc] initWithLevel:level_id];
	[self drawLevel];
}

-(void) drawLevel{
	level_data = [level_data_loader getdata];
	scrollMode = [[level_data objectForKey:@"scrollmode"]intValue];
	if (level_data) {
		[self drawBackground];
		[self drawJointLayer];
		[self buildSpriteSheets];
		[self drawCompounds];
		[self buildJoints];
		if(DUBUG_DRAW){
			[self createDebugDraw];
		}
		[self registerContacts];
		[self createCanons];
		[self schedule: @selector(tick:)];	
	}

}

-(void)drawJointLayer{
	jointLayer = [OOOJointLayer layer];
	[jointLayer setWorld:(b2World *)[gameModel getWorld]];
	[self addChild: jointLayer z:0 tag:121];
}

-(void)createDebugDraw{
	dbDrawLayer = [OOODebugDrawLayer layer];
	[dbDrawLayer setWorld:(b2World *)[gameModel getWorld]];
	[self addChild: dbDrawLayer z:0 tag:121];
}

- (void) onEnterTransitionDidFinish{
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"levelLoaded" 
					   object:nil 
					   userInfo:nil]];
	// enable accelerometer
	self.isAccelerometerEnabled = YES;
	[gameModel onEnterTransitionDidFinish];
}

-(void)createCanons{
	NSArray *cannons = [[level_data objectForKey:@"level"] objectForKey:@"cannons"];
	int arrayCount = [cannons count];
	for (int i = 0; i < arrayCount; i++) {
		[cannon addCannonDef:[cannons objectAtIndex:i]];
	}
}

-(void)registerContacts{
	NSArray *contacts = [[level_data objectForKey:@"level"] objectForKey:@"contacts"];
	[gameModel registerContacts:contacts];
}

-(void)buildJoints{
	NSArray *joints = [[level_data objectForKey:@"level"] objectForKey:@"joints"];
	int arrayCount = [joints count];
	for (int i = 0; i < arrayCount; i++) {
		if ([[[joints objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"revolute"]){
			[gameModel createRevJoint:[joints objectAtIndex:i]];
		}else if ([[[joints objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"distance"]) {

			OOOJointTexture *jointTexture = [[OOOJointTexture alloc] init];
			b2Joint *joint = [gameModel createDistJoint:[joints objectAtIndex:i]];
			[jointTexture setJoint:joint withDef:[joints objectAtIndex:i]];
			[jointLayer addChild:jointTexture];
			[jointTexture release];
			
		}else if ([[[joints objectAtIndex:i] objectForKey:@"type"]isEqualToString:@"prismatic"]) {
			[gameModel createPrismJoint:[joints objectAtIndex:i]];
		}
	}
}

-(void)drawBackground{
	NSString *bg = nil;
	bg = [[level_data objectForKey:@"level"] objectForKey:@"background"];
	if (bg) {
		CCSprite *sprite = [CCSprite spriteWithFile:bg];
		[bgLayer addChild:sprite z:0 tag:1];
		sprite.position = ccp(720, 160);
	}
}

-(void) buildSpriteSheets{
	//NSLog(@"building sprite sheets");
	NSArray *sheets = [[level_data objectForKey:@"level"] objectForKey:@"sheets"];
	
	//NSLog(@"sheets %@",sheets);
	
	int arrayCount = [sheets count];
	for (int i = 0; i < arrayCount; i++) {
		NSString *sheetname = nil;
		
		sheetname = [[sheets objectAtIndex:i] objectForKey:@"atlas"];
		CCSpriteBatchNode *sheet;
		
		NSString *img = [sheetname stringByAppendingString:@".pvr"];
		
		//NSLog(@"sheet name : %@",sheetname);

		sheet = [CCSpriteBatchNode batchNodeWithFile:img capacity:150];

		NSString *atlas = [sheetname stringByAppendingString:@".plist"];
		NSNumber *_id = [[sheets objectAtIndex:i] objectForKey:@"id"];

		[[OOOTextureCacheManager sharedTextureCacheManager]addAtlas:atlas andTexture:img];
		
		[self addChild:sheet z:0 tag:[_id intValue]];
	}
	
}

-(void) drawCompounds{
	spawnque = [[NSMutableDictionary dictionary] retain];
	eventSpawnTable = [[NSMutableDictionary dictionary]retain];
	newSpriteList = [[NSMutableArray alloc] init];
	NSArray *comps = [[level_data objectForKey:@"level"] objectForKey:@"compounds"];
	int arrayCount = [comps count];
	for (int i = 0; i < arrayCount; i++) {
		[self drawCompoundWithDict:[comps objectAtIndex:i]];
	}
}

-(void)spawn{
	NSMutableArray *obj = [spawnque objectForKey:[NSNumber numberWithInt:framecounter]];
	if (obj){
		int arrayCount = [obj count];
		for (int i = 0; i < arrayCount; i++) {
			[self _drawCompoundWithDict:[obj objectAtIndex:i]];
		}
	}
}


-(void)_drawCompoundWithDict: (NSDictionary *)dict{
	
	float w = [[[dict objectForKey:@"body"] objectForKey:@"width"]floatValue];
	float h = [[[dict objectForKey:@"body"] objectForKey:@"height"]floatValue];
	float x = [[[dict objectForKey:@"body"] objectForKey:@"x"]floatValue];
	float y = [[[dict objectForKey:@"body"] objectForKey:@"y"]floatValue];
	
	NSString *firstFrame = [[dict objectForKey:@"body"] objectForKey:@"firstFrame"];
	NSNumber *sheet_id = [[dict objectForKey:@"body"] objectForKey:@"sheet_id"];
	NSNumber *spr_id = [[dict objectForKey:@"body"] objectForKey:@"id"];
	NSString *name = [[dict objectForKey:@"body"] objectForKey:@"name"];
	
	NSString *classname = [[dict objectForKey:@"body"] objectForKey:@"classname"];
	NSString *spritedata = [[dict objectForKey:@"body"] objectForKey:@"spritedata"];
	
	if ([classname isEqualToString:@""]) {
		classname = nil;
	}
	
	//NSLog(@"looking up frame %@ in sheet id : %@",firstFrame,sheet_id);
	
	// get sprite sheet
	CCSpriteBatchNode *actor_sheet = (CCSpriteBatchNode*) [self getChildByTag:[sheet_id intValue]];
	
	// create sprite
	OOOGameSprite *sprite;
	
	if (classname) {
		//NSLog(@"instance name %@",name);
		//NSLog(@"class name %@",classname);
		sprite = [[NSClassFromString(classname) alloc] initWithSheet:actor_sheet andName:name andKeyFrame:firstFrame];
		[sprite setClassName:classname];
	}else{
		sprite = [[OOOGameSprite alloc] initWithSheet:actor_sheet andName:name andKeyFrame:firstFrame]; 
		[sprite setClassName:@"BaseClass"];
	}
	[sprite setSpriteData:spritedata];
	[sprite setHeight: h];
	[sprite setWidth: w];
	sprite.position = CGPointMake(x, y);
	
	if (firstFrame) {
		[actor_sheet addChild:sprite z:0 tag:[spr_id intValue]];
	}else{
		//[sprite retain];
		[nonVisibleSprites addObject:sprite];
		
	}
		
	if([dict objectForKey:@"shapes"]){
		b2Body *body = [gameModel createCompoundPhysicsWithSpriteAttached:sprite andDict:dict];
		[sprite setB2Body:body];
	}else {
		[(StaticVisualSprite*)sprite setBGLayer:bgLayer];
	}

	[sprite release];
}

-(void)drawCompoundWithDict: (NSDictionary *)dict{
	// get data
	//NSLog(@"dict: %@",dict);
	
	int spawnframe = [[[dict objectForKey:@"body"] objectForKey:@"spawnframe"]intValue];
	
	if (spawnframe != 0) {
		if ([spawnque objectForKey:[NSNumber numberWithInt:spawnframe]]) {
			[[spawnque objectForKey:[NSNumber numberWithInt:spawnframe]] addObject:dict];
		}else{
			NSMutableArray *sprites_to_spawn = [NSMutableArray array];
			[sprites_to_spawn addObject:dict];
			[spawnque setObject:sprites_to_spawn forKey:[NSNumber numberWithInt:spawnframe]];
		}
		return;
	}
	
	NSString *spawnEvent = [[dict objectForKey:@"body"] objectForKey:@"spawnEvent"];
	
	if (spawnEvent) {
		//NSLog(@"spawnEvent %@",dict);
		
		[eventSpawnTable setObject:dict forKey:spawnEvent];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onEventSpawnSprite:) 
													 name:spawnEvent 
												   object:nil]; 
		return;
	}
	
	[self _drawCompoundWithDict:dict];
}

-(void)onEventSpawnSprite: (NSNotification *)note{

	NSString *evtname = [note name];
	
	if([note userInfo]){
		NSDictionary *spritedef_incomming = [eventSpawnTable objectForKey:evtname];
		
		NSMutableDictionary * spritedef = [[NSMutableDictionary dictionaryWithDictionary:spritedef_incomming] retain];
		NSMutableDictionary * bodydef = [NSMutableDictionary dictionaryWithDictionary:[spritedef objectForKey:@"body"]];
		
		[bodydef setObject:[[note userInfo] objectForKey:@"x"] forKey:@"x"];
		[bodydef setObject:[[note userInfo] objectForKey:@"y"] forKey:@"y"];
		[bodydef setObject:[[note userInfo] objectForKey:@"name"] forKey:@"name"];
		
		[spritedef setObject:bodydef forKey:@"body"];
		
		
		[self prepSpriteForCreation:spritedef];
        [spritedef release];
        
	}else {
		[self prepSpriteForCreation:[eventSpawnTable objectForKey:evtname]];
	}

	
}

-(void)prepSpriteForCreation: (NSDictionary *)dict{
	if(![newSpriteList containsObject:dict]){
		[newSpriteList addObject:dict];
	}
}

-(void)createNewEventSprites{
	while([newSpriteList count] > 0){
		NSDictionary *dict = [newSpriteList objectAtIndex:0];
		[self _drawCompoundWithDict:dict];
        [newSpriteList removeObjectAtIndex:0];
	}
}

#pragma mark -
#pragma mark User Controlls

-(void)goTouchMode:(NSNotification*)note{    
    NSString *touchmode = [[note userInfo] objectForKey:@"mode"];
    if([touchmode isEqualToString:@"gun"]){
        touchControlMode = TOUCH_CONTROL_MODE_NORMAL;
    }else if([touchmode isEqualToString:@"cannon"]){
        touchControlMode = TOUCH_CONTROL_MODE_AB;
    }
}

-(void)broadCastTouch:(NSSet*)touches withName:(NSString*)noteName{
    
    float y = 0.0;
    float x = 0.0;
    
    UITouch *touch = [[touches allObjects]objectAtIndex:0];
    
    //for( UITouch *touch in touches ) {
        CGPoint location = [touch locationInView: [touch view]];
        location = [[CCDirector sharedDirector] convertToGL: location];
        x = location.x;
        y = location.y;
    //}
    
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:x],@"x",
                              [NSNumber numberWithFloat:y],@"y",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:noteName 
                       object:nil 
                       userInfo:userinfo]];
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	if(touchControlMode == TOUCH_CONTROL_MODE_AB){
        [self broadCastTouch:touches withName:@"onCannonMove"];
    }
}


- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event{
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if(touchControlMode == TOUCH_CONTROL_MODE_NORMAL){
        [self _ccTouchesEnded:touches withEvent:event];
    }else{
        [self broadCastTouch:touches withName:@"onCannonShoot"];
    }
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if(touchControlMode == TOUCH_CONTROL_MODE_NORMAL){
        [self _ccTouchesBegan:touches withEvent:event];
    }else{
        [self broadCastTouch:touches withName:@"onCannonActivated"];
    }
}

- (void)_ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

	if (!controllsEnabled) {
		return;
	}
    
    for( UITouch *touch in touches ) {
		CGPoint location = [touch locationInView: [touch view]];
		location = [[CCDirector sharedDirector] convertToGL: location];
		float x = location.x;
		BOOL mustNotify = NO;
		
		if (!flipControls && x < viewportHW) {
			mustNotify = YES;
		}else if (flipControls && x > viewportHW) {
			mustNotify = YES;
		}
		
		if (mustNotify) {
            NSNotification *note = [NSNotification 
                                    notificationWithName:@"onJumpingStopped" 
                                    object:nil 
                                    userInfo:nil];
            
            //if (RECORDING_PLAYBACK_MODE == 1) {
            //    [currentRecordingFrame addEvent:note];
            //}
            
			[[NSNotificationCenter defaultCenter] postNotification:note];
		}
	}
	 
}

- (void)_ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	if (!controllsEnabled) {
		return;
	}
	
	if (alertShown) {
		return;
	}
	
	for( UITouch *touch in touches ) {
			CGPoint location = [touch locationInView: [touch view]];
			location = [[CCDirector sharedDirector] convertToGL: location];
			float x = location.x;
			NSString *eventName1 = nil;
			NSString *eventName2 = nil;
			if (flipControls) {
				eventName1 = [NSString stringWithString:@"onFire"];
				eventName2 = [NSString stringWithString:@"onSwipe"];
			}else{
				eventName2 = [NSString stringWithString:@"onFire"];
				eventName1 = [NSString stringWithString:@"onSwipe"];
			}
			if (x < viewportHW ) {
                
                NSNotification *note = [NSNotification 
                                        notificationWithName:eventName1 
                                        object:nil 
                                        userInfo:nil];
                
                //if (RECORDING_PLAYBACK_MODE == 1) {
                //    [currentRecordingFrame addEvent:note];
                //}
                
                [[NSNotificationCenter defaultCenter] postNotification:note];
				
			}else{
                
                NSNotification *note = [NSNotification 
                                        notificationWithName:eventName2 
                                        object:nil 
                                        userInfo:nil];
                
                //if (RECORDING_PLAYBACK_MODE == 1) {
                //    [currentRecordingFrame addEvent:note];
                //}
                
                [[NSNotificationCenter defaultCenter] postNotification:note];
                
			}						
			
	}
	
}

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{	
	//NSLog(@"accelaration.x: %2.1f accelaration.y %2.3f", round(acceleration.x*10)/10.0, round(acceleration.y*1000)/1000.0);
	if (!controllsEnabled) {
		return;
	}
	
	float accelX = (float) acceleration.x * 500;
	accelY = (float) (acceleration.y - [calibrationOffset floatValue]) * 500;

	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:accelX], @"dx", [NSNumber numberWithFloat:accelY], @"dy",nil];
	[userinfo retain];
	
	//NSLog(@"accel running !");
    
    NSNotification *note = [NSNotification 
                            notificationWithName:@"onAccel" 
                            object:nil 
                            userInfo:userinfo];
    
    //if (RECORDING_PLAYBACK_MODE == 1) {
    //    [currentRecordingFrame addEvent:note];
    //}
    
    [[NSNotificationCenter defaultCenter] postNotification:note];
	
	[userinfo release];
	
}

#pragma mark -

-(void) tick: (ccTime) dt
{
	
    //NSLog(@"time delta: %f",dt);
    //float diff = dt - BOX2D_DELTA;
    //timestep_accumulator += diff;
    
    
    //if (RECORDING_PLAYBACK_MODE != 0) {
    //    if (RECORDING_PLAYBACK_MODE == 2){
    //        [uir playBackRecordedFrameAtIndex:framecounter];
    //    }else{
    //        [uir recordFrame:currentRecordingFrame];
    //    }
    //}
    
    framecounter ++;
	[self spawn];
	[gameModel onGameLoop];
    //if(timestep_accumulator > BOX2D_DELTA){
        //NSLog(@"extra step needed !");
        //[gameModel onGameLoop];
        //timestep_accumulator = timestep_accumulator - BOX2D_DELTA;
    //}
	[cannon execute:framecounter];
	[self createNewEventSprites];
    
    //if (RECORDING_PLAYBACK_MODE != 0) {
    //    if (RECORDING_PLAYBACK_MODE == 1){
    //        [currentRecordingFrame release];
    //        currentRecordingFrame = [[OOORecordedFrameData alloc] init];
    //    }
    //}
    
}

-(void)dealloc{
	[OOOGameView removeInstance];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[level_data_loader release];
	//[level_data release];

	framecounter = NULL;
	
	[spawnque release];
	[eventSpawnTable release];
	[newSpriteList release];
	
	[cannon release];
	
	[nonVisibleSprites release];
	[gameModel release];
    
    //if (RECORDING_PLAYBACK_MODE == 1){
    //    [uir saveFile];
    //}
    //[currentRecordingFrame release];
    //[uir release];
    
    
    
	[super dealloc];
}

@end
