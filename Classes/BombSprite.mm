//
//  BombSprite.mm
//  MonkeySwipe
//
//  Created by Johan ten Broeke on 3/28/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "BombSprite.h"
#import "SimpleAudioEngine.h"

@implementation BombSprite

-(id)init{
	if( (self=[super init])) {
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelLoaded:) 
													 name:@"levelLoaded" 
												   object:nil];
	}
	//[self obeyPhysics:NO];
	return self;
}


-(void) onLevelLoaded:(NSNotification *) note{
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onExplode:) 
												 name:@"onExplode" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onSimpleExplode:) 
												 name:@"onSimpleExplode" 
											   object:nil];
	
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onRemoteExplode:) 
												 name:@"onRemoteExplode" 
											   object:nil];
	
}

-(void)onRemoteExplode:(NSNotification *) note{
	//NSLog(@"explode now !:wq");
	
	NSDictionary *user_info = [NSDictionary dictionaryWithObject:[NSValue valueWithPointer:myBody] forKey:@"body"];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"explodeBody" 
					   object:nil 
					   userInfo:user_info]];
	
	
	//NSLog(@"onDestroy %@",self);
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	//[self gotoAndPlay:@"enemy0001.png" loop:NO];
	//[self destroyPhysics];
	[self destroyPhysics];
	[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
					  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	//[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_bomb_sound.wav"];

	
}

-(void) onSimpleExplode:(NSNotification *) note{
	//NSLog(@"explode now !:wq");

	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		NSDictionary *user_info = [NSDictionary dictionaryWithObject:[NSValue valueWithPointer:myBody] forKey:@"body"];
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"explodeBody" 
						   object:nil 
						   userInfo:user_info]];
		
		//NSLog(@"onDestroy %@",self);
		[[NSNotificationCenter defaultCenter] removeObserver:self];	
		//[self gotoAndPlay:@"enemy0001.png" loop:NO];
		//[self destroyPhysics];
		[self destroyPhysics];
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
		//[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_bomb_sound.wav"];
        NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"explosion_debris", @"sound", nil];
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onSoundEffect" 
                           object:nil 
                           userInfo:userinfo2]];
        
	}
}


-(void) onExplode:(NSNotification *) note{
	//NSLog(@"explode now !:wq");
	
	NSDictionary *user_info = [NSDictionary dictionaryWithObject:[NSValue valueWithPointer:myBody] forKey:@"body"];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"explodeBody" 
					   object:nil 
					   userInfo:user_info]];
	
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){

		//NSLog(@"onDestroy %@",self);
		[[NSNotificationCenter defaultCenter] removeObserver:self];	
		//[self gotoAndPlay:@"enemy0001.png" loop:NO];
		//[self destroyPhysics];
		[self destroyPhysics];
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
		//[[SimpleAudioEngine sharedEngine] playEffect:@"sfx_bomb_sound.wav"];
	}
}

-(void)clear: (id)sel{
	//NSLog(@"callbak!!!");
	[[self parent] removeChild:self cleanup:NO];
}

- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
