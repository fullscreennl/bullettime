//
//  HeroVicinityAlerter.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 11/17/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OOOGameSprite.h"
#import "HeroSprite.h"
#import "Box2D.h"
#import "cocos2d.h"

@interface HeroVicinityAlerter : NSObject {
	OOOGameSprite *mySprite;
	float distance;
	OOOGameSprite *hero;
	SEL selector;
	BOOL inside;
	id target;
}
-(void)excecute:(int)framecounter;
-(id)initWithGameSprite:(OOOGameSprite *)sprite andTriggerDistance:(float)_distance andAction:(SEL)_sel;
-(id)initWithGameSprite:(OOOGameSprite *)sprite andTarget:(id)_target andTriggerDistance:(float)_distance andAction:(SEL)_sel;

@end
