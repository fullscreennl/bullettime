//
//  OOOJointLayer.mm
//  oneonone
//
//  Created by Johan ten Broeke on 3/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#define PTM_RATIO 32

#import "OOOJointLayer.h"
#import "Box2D.h"
#import "OOOJointTexture.h"



@implementation OOOJointLayer

+(id) layer
{
	OOOJointLayer *layer = [OOOJointLayer node];
	return layer;
}

// initialize your instance here
-(id) init
{
	if( (self=[super init])) {
		self.isTouchEnabled = NO;
	}
	return self;
}

-(void)setWorld:(b2World *)_world{
	world = _world;
}

-(void) draw
{
	for (b2Joint* b = world->GetJointList(); b; b = b->GetNext())
	{
		
		if(b->GetUserData() != NULL && b->GetType() == 3){
			OOOJointTexture *joint_texture = (OOOJointTexture *) b->GetUserData();
			[joint_texture update];
		}

	}
	
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	//NSLog(@"OOODebugDrawLayer dealloced!!");
	[super dealloc];
}


@end
