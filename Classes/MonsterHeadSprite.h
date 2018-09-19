//
//  MonsterHeadSprite.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@interface MonsterHeadSprite : EnemySprite {
	HeroChasingBehaviour *bh;
	PeriodicJumpBehaviour *jbh;
	int framecounter;
	OOOScrollStrategy *scrollstr;
}

@end
