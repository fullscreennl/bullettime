//
//  HeroHead.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/5/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class OOOFaceWithExpressions;

@interface HeroHead : CCSprite {
	NSMutableArray *frames;
	int state;
    CCSprite *face1; 
    CCSprite *face2; 
    CCSprite *face3; 
    OOOFaceWithExpressions *face;
}

-(void)update;
-(void)sideways;
-(void)frontal;
-(void)won;
-(void)shoot;
@end
