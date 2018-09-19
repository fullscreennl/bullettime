//
//  oneononeAppDelegate.m
//  oneonone
//
//  Created by Johan ten Broeke on 2/20/10.
//  Copyright fullscreen.nl 2010. All rights reserved.
//

#import "oneononeAppDelegate.h"
#import "cocos2d.h"
#import "MainSplash.h" 
#import "OOOGameViewDecorator.h"
#import "SimpleAudioEngine.h"
#import <AudioToolbox/AudioToolbox.h>
#import "OOOAudioManager.h"
#import "OOOSharedLevelmapData.h"
#import "OOOSettings.h"
#import "OOOTransition.h"
#import "OOORemoteLevelLoader.h"
#import "OOOConfig.h"
#import "MainRootViewController.h"

@implementation oneononeAppDelegate

@synthesize window;

- (void) removeStartupFlicker
{
	//
	// THIS CODE REMOVES THE STARTUP FLICKER
	//
	// Uncomment the following code if you Application only supports landscape mode
	//
#if GAME_AUTOROTATION == kGameAutorotationUIViewController
	
		CC_ENABLE_DEFAULT_GL_STATES();
		CCDirector *director = [CCDirector sharedDirector];
		CGSize size = [director winSize];
		CCSprite *sprite = [CCSprite spriteWithFile:@"Default.png"];
		sprite.position = ccp(size.width/2, size.height/2);
		sprite.rotation = -90;
		[sprite visit];
		[[director openGLView] swapBuffers];
		CC_ENABLE_DEFAULT_GL_STATES();
	
#endif // GAME_AUTOROTATION == kGameAutorotationUIViewController	
}


- (void) applicationDidFinishLaunching:(UIApplication*)application
{
     [application setStatusBarHidden:YES];
 //   [[UIApplication sharedApplication] setStatusBarHidden:YES];
	// Init the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSLog(@"bounds here: %@", NSStringFromCGRect([[UIScreen mainScreen] bounds]));

	// cocos2d will inherit these values
	[window setUserInteractionEnabled:YES];	
	[window setMultipleTouchEnabled:YES];
	
	// Try to use CADisplayLink director
	// if it fails (SDK < 3.1) use the default director
	if( ! [CCDirector setDirectorType:CCDirectorTypeDisplayLink] )
		[CCDirector setDirectorType:CCDirectorTypeDefault];
	
	cutscene = [[OOOTransition alloc]init];

	[CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];
	
	// before creating any layer, set the landscape mode
	[[CCDirector sharedDirector] setDeviceOrientation:CCDeviceOrientationLandscapeLeft];
	//[[CCDirector sharedDirector] setAnimationInterval:ANIMATION_INTERVAL];
    [CCDirector sharedDirector].animationInterval = ANIMATION_INTERVAL;
	//[[CCDirector sharedDirector] setDisplayFPS:YES];
	
	// create an OpenGL view
	EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
								   pixelFormat:kEAGLColorFormatRGBA8
								   depthFormat:0 //GL_DEPTH_COMPONENT24_OES
						];//preserveBackbuffer:NO];
	[glView setMultipleTouchEnabled:YES];
	
	// connect it to the director
	[[CCDirector sharedDirector] setOpenGLView:glView];
	
	// glview is a child of the main window
	// [window addSubview:glView];
    MainRootViewController *vc = [[[MainRootViewController alloc] init] autorelease];
    
    [vc setView:glView];
    [window setRootViewController:vc];
	
	[OOOAudioManager sharedOOOAudioManager];
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"intro", @"sound",nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo]];
	
	[window makeKeyAndVisible];		
	
	[self removeStartupFlicker];
	
	MainSplash	*mainSplash = [MainSplash scene];
	
	[[CCDirector sharedDirector] runWithScene: (CCScene*) mainSplash];

	OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
	
	
	if(TESTMODE){
		
		[self testLevel];
	
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(reloadTestLevel:) 
													 name:@"onLeaveLevel" 
												object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(reloadTestLevel:) 
                                                     name:@"onDrawLevel" 
                                                   object:nil];

	}else{
	
		if(![slm tutorialsDone]){
			[[CCDirector sharedDirector] replaceScene:[OOOGameViewDecorator sceneWithLevelId:@"leveldata/level_0_0_0"]];
		}else{
			[slm goMenu];
			int ind = [[slm levelProgresInd] intValue];
			//NSLog(@"current level index: %i",ind);
			if (ind < 33) {
				[[CCDirector sharedDirector] replaceScene:[OOOGameViewDecorator sceneWithLevelId:@"leveldata/menu"]];
			}else if(ind > 65){
                [[CCDirector sharedDirector] replaceScene:[OOOGameViewDecorator sceneWithLevelId:@"leveldata/menu3"]];
            }else {
				[[CCDirector sharedDirector] replaceScene:[OOOGameViewDecorator sceneWithLevelId:@"leveldata/menu2"]];
			}
		}
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLeaveLevel:) 
													 name:@"onLeaveLevel" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(drawLevel:) 
                                                     name:@"onDrawLevel" 
                                                   object:nil];
		
	}
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(goLastMenu:) 
												 name:@"goLastMenu" 
											   object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(goMidMenu:) 
												 name:@"goMidMenu" 
											   object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(goMidMenuForward:) 
												 name:@"goForwardMidMenu" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(goFirstMenu:) 
												 name:@"goFirstMenu" 
											   object:nil];

	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(enterLevel:) 
												 name:@"onEnterLevel" 
											   object:nil];

	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(reloadTestLevel:) 
												 name:@"onTestLevel" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(goSettings:) 
												 name:@"goSettings" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(goTestLevel:) 
												 name:@"onTestLevelLoaded" 
											   object:nil];
	
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"sfx_small_explosion.wav"];
    
    isDrawingLevel = NO;
	
	
}

-(void)goLastMenu:(NSNotification*)note{
    //NSLog(@"-(void)goLastMenu:(NSNotification*)note{");
	OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
	[slm goMenu];
	[cutscene setLevelId:@"leveldata/menu_3_walkto"];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}

-(void)goMidMenu:(NSNotification*)note{
    //NSLog(@"-(void)goMidMenu:(NSNotification*)note{");
	OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
	[slm goMenu];
	[cutscene setLevelId:@"leveldata/menu_2_walkback"];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}

-(void)goMidMenuForward:(NSNotification*)note{
    //NSLog(@"-(void)goMidMenuForward:(NSNotification*)note");
	OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
	[slm goMenu];
	[cutscene setLevelId:@"leveldata/menu_2_walkto"];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}


-(void)goFirstMenu:(NSNotification*)note{
    //NSLog(@"-(void)goFirstMenu:(NSNotification*)note{");
	OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
	[slm goMenu];
	[cutscene setLevelId:@"leveldata/menu_walkback"];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}

-(void)reloadTestLevel:(NSNotification*)note{
	[cutscene setTestModeWithTarget:self];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}

-(void)testLevel{
	rll = [[OOORemoteLevelLoader alloc] init];
	[rll loadRemoteTestLevel];
}

-(void)goTestLevel:(NSNotification*)note{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:[OOOGameViewDecorator buildTestLevel:[note userInfo]]]];
	//[[CCDirector sharedDirector] replaceScene:[OOOGameViewDecorator buildTestLevel:[note userInfo]]];
	[rll release];
}

-(void)goSettings:(NSNotification *)note{    
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[OOOSettings scene]]];
}

-(void)drawLevel:(NSNotification *)note{
    
    if(isDrawingLevel){
        return;
    }
    
    isDrawingLevel = YES;
    
	NSString *level_id = [[note userInfo] objectForKey:@"level_id"];
    if([level_id isEqualToString:@"leveldata/menu"]){
        OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
        int ind = [[slm levelProgresInd] intValue];
        if (ind < 33) {
            level_id = @"leveldata/menu";
        }else if(ind > 65){
            level_id = @"leveldata/menu3";
        }else{
            level_id = @"leveldata/menu2";
        }
    }
	[cutscene setLevelId:level_id];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}

-(void)enterLevel:(NSNotification *)note{
    
    isDrawingLevel = NO;

	NSString *level_id = [[note userInfo] objectForKey:@"level_id"];
    
    //NSLog(@"entering level %@",level_id);
    
	[[OOOSharedLevelmapData get] setCurrentLevelEntryPoint:level_id];
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:[OOOGameViewDecorator sceneWithLevelId:level_id]]];
}

-(void)onLeaveLevel:(NSNotification *)note{
    
    if(isDrawingLevel){
        return;
    }
    
    isDrawingLevel = YES;
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"saveGameData" 
					   object:nil 
					   userInfo:nil]];	
	
	OOOSharedLevelmapData *slm = [OOOSharedLevelmapData get];
	[slm goMenu];
	int ind = [[slm levelProgresInd] intValue];
	
	if (ind < 33) {
		[cutscene setLevelId:@"leveldata/menu"];
	}else if(ind > 65){
        [cutscene setLevelId:@"leveldata/menu3"];
    }else{
		[cutscene setLevelId:@"leveldata/menu2"];
	}
	
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.3 scene:cutscene]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"saveGameData" 
					   object:nil 
					   userInfo:nil]];	
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	[[CCDirector sharedDirector] stopAnimation];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCTextureCache sharedTextureCache] removeUnusedTextures];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"saveGameData" 
					   object:nil 
					   userInfo:nil]];
	
	[[CCDirector sharedDirector] end];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
	//[[CCDirector sharedDirector] release];
	[window release];
	[cutscene release];
	[super dealloc];
}

@end
