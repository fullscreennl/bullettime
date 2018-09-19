//
//  NutSprite.m
//  oneonone
//
//  Created by johan ten broeke on 3/10/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "FriendSprite.h"
#import "b2Body.h"

@implementation FriendSprite



-(id)init{
	if( (self=[super init])) {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelLoaded:) 
													 name:@"levelLoaded" 
												   object:nil];
	}
	return self;
	
}

-(void) onLevelLoaded:(NSNotification *) note{
	
}



- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
