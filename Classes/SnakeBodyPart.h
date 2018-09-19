//
//  SnakeBodyPart.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 11/15/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeriodicJumpBehaviour.h"
#import "EnemySprite.h"

@interface SnakeBodyPart : EnemySprite {
	PeriodicJumpBehaviour *jbh;
	int framecounter;

}

@end
