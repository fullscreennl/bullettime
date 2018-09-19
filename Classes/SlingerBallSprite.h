//
//  SlingerBallSprite.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/1/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "HeroSprite.h"
#import "cocos2d.h"

@interface SlingerBallSprite : EnemySprite {
	int frame_counter;
	int magicnumber;
	CCParticleSystem *emitter;
	float SoundFallofDistance;
	int soundplaycount;
}
-(int)getRandomNr;
-(float)getXImpulse;
-(float)distanceToHero;
@end
