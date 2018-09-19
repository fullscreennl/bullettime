//
//  PeriodicJumpBehaviour.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box2D.h"
#import "OOOGameSprite.h"


@interface PeriodicJumpBehaviour : NSObject {
	b2Body *myBody;
	OOOGameSprite *mySprite;
	float xforce;
    float yforce;
	int trigger;
	int offset;
    int xdir;
    int ydir;
}
-(void)excecute:(int)framecounter;
-(id)initWithGameSprite:(OOOGameSprite *)sprite andForce:(float)_force andModuloTrigger:(int)_trigger;
-(id)initWithGameSprite:(OOOGameSprite *)sprite andForce:(float)_force andModuloTrigger:(int)_trigger andDirection:(NSString*)_dir;
-(void)setRandom:(int)_randomRange;
-(float)getXImpulse:(OOOGameSprite *)hero;
@end
