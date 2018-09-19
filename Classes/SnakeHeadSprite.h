//
//  SnakeHeadSprite.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "HeroVicinityAlerter.h"
#import "OOOScrollStrategy.h"

@interface SnakeHeadSprite : EnemySprite {
	HeroChasingBehaviour *bh;
	PeriodicJumpBehaviour *jbh;
	HeroVicinityAlerter *hvbh;
	HeroVicinityAlerter *hvbhtwo;
	int framecounter;
	BOOL active;
	OOOScrollStrategy *scrollstr;
}

@end
