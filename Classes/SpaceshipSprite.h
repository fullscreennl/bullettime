//
//  SpaceshipSprite.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/4/10.
//  Copyright 2010 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "cocos2d.h"

@interface SpaceshipSprite : EnemySprite {
	float soundFallofDistance;
	int frame_counter;
	int nrBullets;
	CCSprite *left_eye_open;
	CCSprite *left_eye_closed;
	CCSprite *right_eye_open;
	CCSprite *right_eye_closed;
	CCSprite *mouth_open;
	CCSprite *mouth_closed;
	CCSprite *mouth_teeth;
	CCSprite *flameLeft;
	CCSprite *flameRight;
	
}
-(float)getXImpulse;
-(float)distanceToHero;
-(void)buildCockpit;
@end
