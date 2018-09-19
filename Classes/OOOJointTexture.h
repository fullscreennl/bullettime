//
//  OOOJointTexture.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/11/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"


@interface OOOJointTexture : CCSprite {
	b2Joint *myJoint;
	NSString *textureType;
}
-(void)setJoint:(b2Joint *)joint withDef:(NSDictionary *)dict;
-(void)update;
-(void)setHeight:(float)height;
-(void)setWidth:(float)width;
-(void)destroy;
@end
