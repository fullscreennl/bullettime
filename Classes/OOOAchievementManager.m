//
//  OOOAchievementManager.m
//  BulletTime
//
//  Created by johan ten broeke on 8/2/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "OOOAchievementManager.h"
#import "OOOSharedLevelmapData.h"
#import "OOOGameSettingsManager.h"

@implementation OOOAchievementManager

- (id)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(handleGameCenterOptions:) 
													 name:@"CONF_gamecenter.png" 
												   object:nil];
        
    }
    
    return self;
}

+(BOOL) isGameCenterAPIAvailable
{
    // Check for presence of GKLocalPlayer class.
    BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
    
    // The device must be running iOS 4.1 or later.
    NSString *reqSysVer = @"4.1";
    NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currSysVer compare:reqSysVer options:NSNumericSearch] != NSOrderedAscending);
    
    NSMutableDictionary *settings = [[OOOGameSettingsManager sharedManager] getSettings];
    BOOL useGameCenter = [[settings objectForKey:@"useGameCenter"] boolValue];
    
    return (localPlayerClassAvailable && osVersionSupported && useGameCenter);

}


-(void)handleGameCenterOptions:(NSNotification *)note{
    BOOL userWantsGameCenter = [[[note userInfo] objectForKey:@"state"]boolValue];
    if(userWantsGameCenter){
        OOOGameSettingsManager *sm = [OOOGameSettingsManager sharedManager];
        NSMutableDictionary *settings = [sm getSettings];
        [settings setObject:[NSNumber numberWithInt:1] forKey:@"useGameCenter"];
        [sm save];
        [self authenticateLocalPlayer];
    }
}

- (void) authenticateLocalPlayer
{
    
    //OOOGameSettingsManager *sm = [OOOGameSettingsManager sharedManager];
    //NSMutableDictionary *settings = [sm getSettings];
    //NSLog(@"settings : %@",settings);
    
    if(![OOOAchievementManager isGameCenterAPIAvailable]){
        return;
    };
    
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer authenticateWithCompletionHandler:^(NSError *error) {
        if(error != nil){
            //NSLog(@"error! %@",[error localizedDescription]);
            //NSLog(@"error! %@",[error localizedRecoverySuggestion ]);
        }
        if (localPlayer.isAuthenticated)
        {
            //NSLog(@"authenticated");
        }else{
            //NSLog(@"Not authenticated!");
        }
        
        //[[NSNotificationCenter defaultCenter] 
        // postNotification:[NSNotification 
        //                   notificationWithName:@"resumeGame" 
        //                   object:nil 
        //                   userInfo:nil]];
        
    }];
}




- (void) reportAchievementIdentifier: (NSString*) identifier
{
    
    if(![OOOAchievementManager isGameCenterAPIAvailable]){
        return;
    };
    
    GKAchievement *achievement = [[[GKAchievement alloc] initWithIdentifier: identifier] autorelease];
    if (achievement)
    {
        achievement.percentComplete = 100.0f;
        [achievement reportAchievementWithCompletionHandler:^(NSError *error)
         {
             if (error == nil)
             {
                 // Retain the achievement object and try again later (not shown).
                 [[OOOSharedLevelmapData get] setGameCenterSubmittedAchivementForID:identifier];
             }else{
                 //NSLog(@"achievement report failed!");
             }
         }];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end
