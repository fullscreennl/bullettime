//
//  OOOAchievementManager.h
//  BulletTime
//
//  Created by johan ten broeke on 8/2/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface OOOAchievementManager : NSObject{

}

- (void) authenticateLocalPlayer;
- (void) reportAchievementIdentifier: (NSString*) identifier;
+ (BOOL) isGameCenterAPIAvailable;
@end
