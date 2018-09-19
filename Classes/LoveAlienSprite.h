//
//  LoveAlienSprite.h
//  oneonone_stripped
//
//  Created by Jeroen van Goor on nov 2010
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "HeroSprite.h"
#import "cocos2d.h"


@interface LoveAlienSprite : EnemySprite {
	BOOL notRunning;
	int frame_counter;
	float defaultScaleX;
	
	NSMutableArray *bloodDecals;
	
}
-(void)drawElements;
-(float)getXImpulse;
/*
-(void)closeEyes;
-(void)openEyes;
-(void)closeMouth;
-(void)openMouth;
-(void)showTeeth;
*/
@end
