//
//  OOOFaceWithExpressions.h
//  BulletTime
//
//  Created by johan ten broeke on 2/14/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface OOOFaceWithExpressions : CCSprite {
	CCSprite *left_eye_open;
	CCSprite *left_eye_closed;
	CCSprite *right_eye_open;
	CCSprite *right_eye_closed;
	CCSprite *mouth_open;
	CCSprite *mouth_closed;
	CCSprite *mouth_teeth;
	CCSprite *mouth_happy;
	CCSprite *mouth_sad;
    NSArray *soundArr;
	SEL currentStateSelector;
	SEL defaultSelector;
	int myFrameCounter;
	int stateDuration;
	int durationCounter;
    BOOL jitter;
    BOOL sound;
	BOOL isNeutral;
	BOOL isDying;
}
-(void)animate;
-(void)noSound;
-(void)setState:(int [9])arr;
-(void)allowJitter:(BOOL)_allow;
-(void)happy;
-(void)angry;
-(void)neutral;
-(void)sad;
-(void)dying;
-(void)shocked;
-(BOOL)getNeutral;


@end
