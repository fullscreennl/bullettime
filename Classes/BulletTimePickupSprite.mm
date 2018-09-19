//
//  BulletTimePickupSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/28/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "BulletTimePickupSprite.h"


@implementation BulletTimePickupSprite

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
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onBulletTimeGained:) 
												 name:@"onBulletTimeGained" 
											   object:nil];
	
	
}


-(void) onBulletTimeGained:(NSNotification *) note{
	
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		[[NSNotificationCenter defaultCenter] removeObserver:self];	
		[self destroyPhysics];
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}
	
}


-(void)clear: (id)sel{
	[[self parent] removeChild:self cleanup:NO];
}

- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}


@end
