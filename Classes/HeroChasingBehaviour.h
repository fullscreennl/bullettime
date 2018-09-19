//
//  JumpBehaviour.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "Box2D.h"
#import "cocos2d.h"
#import "HeroSprite.h"

@interface HeroChasingBehaviour : NSObject {
	b2Body *myBody;
	OOOGameSprite *mySprite;
	float force;
	int trigger;
	float oriXscale;
	BOOL _flipTexture;
}
-(void)excecute:(int)framecounter;
-(id)initWithGameSprite:(OOOGameSprite *)sprite andForce:(float)_force andModuloTrigger:(int)_trigger;
-(float)getXImpulse:(OOOGameSprite *)hero;
-(void)disableFlipTexture;
@end
