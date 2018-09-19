//
//  OOODebugDrawLayer.mm
//  oneonone
//
//  Created by johan ten broeke on 3/10/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOODebugDrawLayer.h"
#import "Box2D.h"


@implementation OOODebugDrawLayer
+(id) layer
{
	OOODebugDrawLayer *layer = [OOODebugDrawLayer node];
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
	// Default GL states: GL_TEXTURE_2D, GL_VERTEX_ARRAY, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	// Needed states:  GL_VERTEX_ARRAY, 
	// Unneeded states: GL_TEXTURE_2D, GL_COLOR_ARRAY, GL_TEXTURE_COORD_ARRAY
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	
	//NSLog(@"debugdraw_here!");
	world->DrawDebugData();
	
	// restore default GL states
	glEnable(GL_TEXTURE_2D);
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	//NSLog(@"OOODebugDrawLayer dealloced!!");
	[super dealloc];
}

@end
