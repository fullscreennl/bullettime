//
//  OOOGameView.h
//  oneonone
//
//  Created by Johan ten Broeke on 2/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#define WORLD_ORIENTATION_UP 1.0
#define WORLD_ORIENTATION_UPSIDE_DOWN -1.0

#define SCROLLMODE_STANDARD 1
#define SCROLLMODE_BATTLE 2
#define SCROLLMODE_LEFT 3
#define SCROLLMODE_RIGHT 4

#define SCROLLPOS_SWITCH_FAST 20.0f
#define SCROLLPOS_SWITCH_NORMAL 40.0f
#define SCROLLPOS_SWITCH_SLOW 60.0f

#define TOUCH_CONTROL_MODE_NORMAL 1
#define TOUCH_CONTROL_MODE_AB 2

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "OOOGameSprite.h"
#import "OOOGameModel.h"
#import "GLES-Render.h"
#import "OOOLevelData.h"
#import "OOOBackgroundLayer.h"
#import "OOODebugDrawLayer.h"
#import "OOOJointLayer.h"
#import "OOOCannon.h"
#import "OOOFrontLayer.h"
#import "OOOSharedInputRecorder.h"
#import "OOORecordedFrameData.h"

@interface OOOGameView : CCLayer {
	OOOGameModel *gameModel;
	UITouch *currentTouch;
	CGPoint currentLocation;
	NSDictionary *level_data; 
	OOOBackgroundLayer *bgLayer;
	OOOFrontLayer *fgLayer;
	OOODebugDrawLayer *dbDrawLayer;
	OOOJointLayer *jointLayer;
	OOOLevelData *level_data_loader;
	NSMutableDictionary *spawnque;
	NSMutableDictionary *eventSpawnTable;
	NSMutableArray *nonVisibleSprites;
	int framecounter;
	NSMutableArray *newSpriteList;
	OOOCannon *cannon;
	int world_orientation;
	float targetScaling;
	float worldScaling;
	float scaleStep;
	float numTransitionFrames;
	BOOL alertShown;
	NSNumber *calibrationOffset;
	BOOL flipControls;
	float targetPos;
	float actualPos;
	CCWaves *waveAction;
	ccVertex3F myVert;
	float accelY;
	int scrollMode;
	int scollPosSwitchSpeed;
	
	BOOL controllsEnabled;
    OOOSharedInputRecorder *uir;
    OOORecordedFrameData *currentRecordingFrame;
    
    float timestep_accumulator;
    int touchControlMode;
    
    NSString *scrollID;
    float prevScrollX;
    float prevScrollY;
    float heroposX;
    float heroposY;
    float scrollDistX;
    float scrollDistY;
    
    int viewportW;
    int viewportH;
    int viewportHW;
    int viewportHH;
    
    float ipadZoomCompensation;
    
    BOOL scrolling;
}
+(id) sceneWithLevelId:(NSString *)level_id;
+(id) sceneWithDictionary:(NSDictionary *)dict;
+(void) removeInstance;
+(int) getNumInstances;
-(void) buildLevel:(NSString *)level_id;
-(void) drawCompounds;
-(void) buildSpriteSheets;
-(void) buildJoints;
-(void) drawBackground;
-(void) drawCompoundWithDict: (NSDictionary *)dict;
-(void) _drawCompoundWithDict: (NSDictionary *)dict;
-(void) registerContacts;
-(void) createDebugDraw;
-(void) drawJointLayer;
-(void) drawLevel;
-(void) buildLevelWithDictionary:(NSDictionary *)dict;
-(void) spawn;
-(void) prepSpriteForCreation: (NSDictionary *)dict;
-(void) onEventSpawnSprite: (NSNotification *)note;
-(void) createNewEventSprites;
-(void) createCanons;
-(void) setTargetScaling:(float)scaleFact;
-(void) drawBG:(NSArray*)arr;
-(void) drawFG:(NSArray*)arr;
-(void) _ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void) _ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void) sniffDeviceEnv;
@end
