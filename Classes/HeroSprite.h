//
//  SuperHeroSprite.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/2/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "cocos2d.h"
#import "HeroLegs.h"
#import "HeroHead.h"
#import "HeroBody.h"
#import "OOOGameSprite.h"

@interface HeroSprite : OOOGameSprite {
	int world_orientation;
	BOOL _canJump;
	BOOL canShoot;
	int state;
	float forceDirection;
	CCSprite *gun1;
	CCSprite *gun2;
	CCSprite *arm;
	CCSprite *skull;
	BOOL immune;
	NSMutableArray *samples;
	HeroLegs *legs;
	HeroHead *head;
	HeroBody *body;
    BOOL gold;
}

+(OOOGameSprite *)getSprite;
+(void)setSprite:(OOOGameSprite *)spr;
-(void) onSwipe:(NSNotification *) note;
-(void) onFire:(NSNotification *) note;
-(BOOL) canJump;
-(void) switchAnimation: (int)_state;
-(void) setState: (int)_state;
-(BOOL)canJump;
-(void)blam;
-(void)pow;
-(float)calcAverage:(float)input;
-(float)absolute:(float)input;
-(void)stopJump:(NSNotification *)note;
-(void)createGraphics;
-(void)showdust;
@end