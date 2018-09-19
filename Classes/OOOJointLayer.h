//
//  OOOJointLayer.h
//  oneonone
//
//  Created by Johan ten Broeke on 3/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"


@interface OOOJointLayer :CCLayer
{
	//CCSprite* bgsprite;
	b2World *world;
}



// adds a new sprite at a given coordinate

+(id) layer; 
-(void)setWorld:(b2World *)_world;

@end
