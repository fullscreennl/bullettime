//
//  PumpkinBomberSprite.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 9/26/10.
//  Copyright 2010 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "HeroSprite.h"
#import "cocos2d.h"

@interface PumpkinBomberSprite : EnemySprite {
	int frame_counter;
	float canonSoundFallofDistance;
	//int impact_count;
	//int kill_level;
	CCSprite *fireburstSrpite;
	
}

-(float)getXImpulse;
-(float)distanceToHero;

@end
