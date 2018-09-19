//
//  RobotSprite.h
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/6/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "OOOScrollStrategy.h"
#import "HeroSprite.h"


@interface RobotSprite : OOOGameSprite {
	//OOOGameSprite *hero;
	OOOGameSprite *hero;
	int frame_counter;
	float soundFallofDistance;
	CCSprite *left_eye_open;
	CCSprite *left_eye_closed;
	CCSprite *right_eye_open;
	CCSprite *right_eye_closed;
	CCSprite *mouth_open;
	CCSprite *mouth_closed;
	CCSprite *mouth_teeth;
	OOOScrollStrategy *scrollstr;
}
-(void)buildCockpit;
-(OOOGameSprite*)getHero;
@end
