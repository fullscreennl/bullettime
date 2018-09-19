//
//  JumpBehaviour.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "HeroChasingBehaviour.h"
#import "EnemySprite.h"
#import "OOOGameSprite.h"


@implementation HeroChasingBehaviour

-(id)initWithGameSprite:(OOOGameSprite *)sprite andForce:(float)_force andModuloTrigger:(int)_trigger{
	if( (self=[super init])) {
		mySprite = sprite;
		force = _force;
		trigger = _trigger;
		oriXscale = 0.0;
		_flipTexture = YES;
	}
	return self;
}

-(void)disableFlipTexture{
	_flipTexture = NO;
}

-(void)excecute:(int)framecounter{
	if (framecounter%trigger == 0) {
		if(!oriXscale){
			oriXscale = mySprite.scaleX;
		}
		myBody = [mySprite getB2Body];
		OOOGameSprite *hero = [(EnemySprite*)mySprite getHero];
		b2Vec2 point(myBody->GetPosition().x+10, myBody->GetPosition().y+10);
		b2Vec2 impulse([self getXImpulse:hero] * force,0);
		if (_flipTexture) {
			if([self getXImpulse:hero]==1){
				mySprite.scaleX = oriXscale * -1.0;
			}else{
				mySprite.scaleX = oriXscale;
			}
		}
		myBody->ApplyLinearImpulse(impulse,point);
	}
}

-(float)getXImpulse:(OOOGameSprite *)hero{
	if (hero.position.x < mySprite.position.x) {
		return -1;
	}else {
		return 1;
	}
	
}

@end
