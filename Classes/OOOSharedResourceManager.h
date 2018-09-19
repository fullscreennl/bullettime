//
//  OOOSharedResourceManager.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/23/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOOSharedResourceManager : NSObject {
	int numBullets;
	int jumpPower;
	int health;
	int bulletTimes;
	int immunity;
	int numEnemies;
	int numCrates;
    int numMK;
    int scoreAcumulator;
    int UPGRADEDBULLETS;
    BOOL ipad;
    NSDate *start_time;
}

-(void)addBullets:(int)num;
-(void)useBullet;
-(void)clearBullets;
-(void)addHealth:(int)hp;
-(void)useHealth:(int)hp;
-(int)bulletsLeft;
-(void)printState;
+(OOOSharedResourceManager *)get;
-(void)reset;
-(void)notify;
-(int)bulletTimesLeft;
+(BOOL)hasBulletTime;
-(void)registerEnemy;
-(void)unRegisterEnemy;
-(void)registerCrate;
-(void)unRegisterCrate;
-(void)registerMedicKit;
-(void)unRegisterMedicKit;
-(void)resetButKeepBulletTimes;
-(int)scoreForLevel;
-(void)resetScore;
-(void)sniffDeviceEnv;
-(void)startTime;
@end
