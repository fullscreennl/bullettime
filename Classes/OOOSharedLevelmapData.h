//
//  OOOSharedLevelmapData.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/8/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOAchievementManager.h"

#define INITSCORE 1000123

@interface OOOSharedLevelmapData : NSObject {
	NSMutableDictionary *level_dict;
	NSString *datafile_name;
	NSMutableDictionary *gameprogress;
	NSString *currentLevelIndex;
	NSDate *startTime;
	BOOL currentlyInMenu;
	NSString *nextLevelIndex;
	NSString *curLevelEntryPoint;
	BOOL tutorialsdone;
	NSString *levelProgress;
    BOOL _hasUpgraded;
    NSArray *menuBGFormat;
    NSArray *defaultBGFormat;
    
    NSMutableDictionary *achievements;
    OOOAchievementManager *achievementManager;
    
    int numEscapes;
    
}
+(OOOSharedLevelmapData *)get;
-(NSString *)setLevelIDForIndex:(NSString*)ind;
-(void)setCurrentLevelEntryPoint:(NSString*)curLevelId;
-(NSArray *)levelDataForIndex:(NSString*)ind;
-(void)loadData;
-(void)save:(NSNotification*)note;
-(NSString*)currentLevelEntryPoint;
-(NSNumber*)levelScoreForIndex:(NSString *)str;
-(int)levelStarsForIndex:(NSString *)str;
-(void)unlockNextLevel;
-(void)commitScore:(NSNotification*)note;
-(void)goMenu;
-(NSString*)currentLevelInd;
-(NSArray*)currentLevelBG;
-(NSArray*)defaultBG;
-(BOOL)tutorialsDone;
-(NSString *)levelProgresInd;
-(void)setAchivementForID:(NSString *)ach_id;
-(BOOL)hasAchivementForID:(NSString *)ach_id;
-(void)setGameCenterSubmittedAchivementForID:(NSString *)ach_id;
-(void)setPendingAchivements;
-(int)getNumEsacapes;
-(BOOL)isCurrentlyInMenu;
-(BOOL)hasUpgraded;
@end
