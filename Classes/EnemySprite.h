//
//  EnemySprite.h
//  oneonone
//
//  Created by Johan ten Broeke on 3/5/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "cocos2d.h"
#import "HeroSprite.h"

@interface EnemySprite :OOOGameSprite {
	CCAnimation *myKeyFrames;
	int impact_count;
	int kill_level;
	OOOGameSprite *hero;
}
-(void) createKeyFrames;
-(void) onDestroy:(NSNotification *) note;
-(void) onBulletHit:(NSNotification *)note;
-(void)clear: (id)sel;
-(float)distanceToHero;
-(OOOGameSprite*)getHero;
-(void)willDestruct;
-(void)onDamage:(NSNotification*)note;
-(void)clearDecals;
-(void)playClouds;
-(void)enemyKilled;
-(void)showBulletHit;
-(BOOL)mustRotate;
@end
