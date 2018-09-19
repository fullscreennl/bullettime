//
//  OOODebugDrawLayer.h
//  oneonone
//
//  Created by johan ten broeke on 3/10/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"

// bg Layer
@interface OOODebugDrawLayer : CCLayer
{
	//CCSprite* bgsprite;
	b2World *world;
}



// adds a new sprite at a given coordinate

+(id) layer; 
-(void)setWorld:(b2World *)_world;

@end
