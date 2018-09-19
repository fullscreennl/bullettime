//
//  PeriodicJumpBehaviour.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "PeriodicJumpBehaviour.h"
#import "HeroSprite.h"
#import "EnemySprite.h"

@implementation PeriodicJumpBehaviour

-(id)initWithGameSprite:(OOOGameSprite *)sprite andForce:(float)_force andModuloTrigger:(int)_trigger{
	if( (self=[super init])) {
		mySprite = sprite;
        yforce =  _force;
        xforce = 0;
		trigger = _trigger;
		offset= 0;
        xdir = 10;
        ydir = 10;
	}
	return self;
}

-(id)initWithGameSprite:(OOOGameSprite *)sprite andForce:(float)_force andModuloTrigger:(int)_trigger andDirection:(NSString*)_dir{
	if( (self=[super init])) {
		mySprite = sprite;
		NSLog(@"direction: %@",_dir);
		trigger = _trigger;
		offset= 0;
        if([_dir isEqualToString:@"hor"]){
            xdir = 0;
            ydir = 0;
            xforce = _force;
            yforce=0;
        }
        if([_dir isEqualToString:@"ver"]){
            xdir = 0;
            ydir = 10;
            yforce = _force;
            xforce = 0;
        }
	}
	return self;
}

-(void)setRandom:(int)_randomRange
{
	//returns random value between 0 and 1 in thousand steps
	//int r = abs(arc4random());
	//int rnd  = (r % _randomRange);
	//offset = rnd;
    offset = 13;
}


-(float)getXImpulse:(OOOGameSprite *)hero{
	if (hero.position.x < mySprite.position.x) {
		return -1;
	}else {
		return 1;
	}
	
}

-(void)excecute:(int)framecounter{
	if (framecounter%(trigger+offset) == 0) {
		myBody = [mySprite getB2Body];
		b2Vec2 point(myBody->GetPosition().x+xdir, myBody->GetPosition().y+ydir);
        OOOGameSprite *hero = [(EnemySprite*)mySprite getHero];
        float _xforce = [self getXImpulse:hero] * xforce;

		b2Vec2 impulse(_xforce, yforce);
		myBody->ApplyLinearImpulse(impulse,point);
	}
}

@end
