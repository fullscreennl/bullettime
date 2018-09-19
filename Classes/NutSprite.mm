//
//  NutSprite.m
//  oneonone
//
//  Created by johan ten broeke on 3/10/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "NutSprite.h"
#import "SimpleAudioEngine.h"

@implementation NutSprite



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
											 selector:@selector(onNutHit:) 
												 name:@"onNutHit" 
											   object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onNutHitAll:) 
												 name:@"onNutHitAll" 
											   object:nil];
	
	
}


-(void) onNutHit:(NSNotification *) note{
	//NSLog(@"onNutHit %@",self);
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){

		[[NSNotificationCenter defaultCenter] removeObserver:self];	
		[self destroyPhysics];
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						@"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
		[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_small_explosion.wav"];
	}
}

-(void) onNutHitAll:(NSNotification *) note{
	//NSLog(@"onNutHitAll %@",self);
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	[self destroyPhysics];
	[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_small_explosion.wav"];
	
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
