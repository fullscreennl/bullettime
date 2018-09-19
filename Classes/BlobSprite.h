//
//  BlobSprite.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/24/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"
#import "HeroSprite.h"
#import "cocos2d.h"


@interface BlobSprite : EnemySprite {
	
	int frame_counter;
	float defaultScaleX;
	
	CCSprite *left_eye_open;
	CCSprite *left_eye_closed;
	CCSprite *right_eye_open;
	CCSprite *right_eye_closed;
	CCSprite *mouth_open;
	CCSprite *mouth_closed;
	CCSprite *mouth_teeth;
	NSString *closeEyeName;
	NSMutableArray *bloodDecals;
	
}
-(void)drawElements;
-(float)getXImpulse;
-(void)closeEyes;
-(void)openEyes;
-(void)closeMouth;
-(void)openMouth;
-(void)showTeeth;
@end
