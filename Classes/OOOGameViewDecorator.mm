//
//  OOOGameViewDecorator.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 7/23/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOGameViewDecorator.h"
#import "OOOGameView.h"
#import "OOOQuitLevelLayer.h"
#import "OOOAlertLayer.h"
#import "OOOBatmanLayer.h"
#import "OOOSharedResourceManager.h"
#import "OOOSharedLevelmapData.h"
#import "OOOConfig.h"
#import "OOORemoteLevelLoader.h"
#import "ABCannon.h"
#import "OOOSpritePresenceTable.h"

@implementation OOOGameViewDecorator

static OOOGameView *gamelayer=nil;
static OOOBatmanLayer *batmanlayer=nil;

+(id) sceneWithLevelId:(NSString *)level_id
{
    
	[ABCannon setInstance:nil];
    [[OOOSharedResourceManager get] reset];
	
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	gamelayer = [OOOGameView node];
	
	//NSArray *deafaultBGFormat = [NSArray arrayWithObjects:@"background_tile3.png",@"moon.png",@"tree_%@.png",@"flat_%@.png",@"cloud_2.png",nil];

	OOOSharedLevelmapData *slmd = [OOOSharedLevelmapData get];

	[gamelayer drawBG:[slmd currentLevelBG]];
    [OOOSpritePresenceTable clear];
	[gamelayer buildLevel:level_id];
	[gamelayer drawFG:[slmd currentLevelBG]];
	
	// add layer as a child to scene
	[scene addChild: gamelayer];
	
	batmanlayer = [OOOBatmanLayer layer];
	[scene addChild: batmanlayer z:0 tag:122];
	
	OOOQuitLevelLayer *quitLayer = [OOOQuitLevelLayer layer];
	//NSRange textRange;
	//textRange = [level_id rangeOfString:@"level_0_0"];
	//if(textRange.location != NSNotFound && ![slmd tutorialsDone]){
    if(![slmd tutorialsDone]){
		[quitLayer hideMenuButton];	
	}
	[scene addChild: quitLayer z:1 tag:123];
	
	OOOAlertLayer *alertLayer = [OOOAlertLayer layer];
	[scene addChild: alertLayer z:2 tag:124];
	
	// return the scene
	return scene;
}


////////////////////////////////////////////
// for testing levels without recompiling //
////////////////////////////////////////////

+(id)buildTestLevel:(NSDictionary*)dict{
    [ABCannon setInstance:nil];
	[[OOOSharedResourceManager get]resetButKeepBulletTimes];
    
    [[OOOSharedResourceManager get]printState];
	
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	gamelayer = [OOOGameView node];
	
	//TEST_LEVEL_URL
	
	OOOSharedLevelmapData *slmd = [OOOSharedLevelmapData get];
	[gamelayer drawBG:[slmd defaultBG]];
	[gamelayer buildLevelWithDictionary:dict];
	[gamelayer drawFG:[slmd defaultBG]];
	
	// add layer as a child to scene
	[scene addChild: gamelayer];
	
	batmanlayer = [OOOBatmanLayer layer];
	[scene addChild: batmanlayer z:0 tag:122];
	
	OOOQuitLevelLayer *quitLayer = [OOOQuitLevelLayer layer];
	[scene addChild: quitLayer z:1 tag:123];
	
	OOOAlertLayer *alertLayer = [OOOAlertLayer layer];
	[scene addChild: alertLayer z:2 tag:124];
	
	// return the scene
	return scene;
}

+(OOOGameView *)getGameView{
	return gamelayer;
}

+(OOOBatmanLayer *)getBatmanLayer{
	return batmanlayer;
}

@end
