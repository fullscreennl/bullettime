//
//  OOOFrontLayer.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/20/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface OOOFrontLayer:CCLayer
{
	CCSprite *bg;
	NSArray *arr;
	NSMutableArray *flatXposses;
}
+(id)layer;
-(void)tile;
-(void)drawWithImages:(NSArray *)_arr;
-(void)placeDecal;
@end
