//
//  HeroBody.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/5/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface HeroBody : CCSprite {
	NSMutableArray *frames;
	int state;
	int framecounter;
	int slowframecounter;
}

-(void)update;
-(void)sideways;
-(void)frontal;
-(void)running;
@end