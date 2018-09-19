//
//  Destructable.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/19/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "Destructable.h"


@implementation Destructable

-(id)init{
	if( (self=[super init])) {
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletHit:) 
													 name:@"onBulletHit" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onCannonBallHit:) 
													 name:@"onCannonBallHit" 
												   object:nil];
		
		
		
		impact_count = 0;
		kill_level = 5;
		
	}
	
	return self;
}

-(void)onCannonBallHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
        
		NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
								  [NSNumber numberWithFloat:self.position.y], @"y",
								  @"KA-BOOM!",@"msg",nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"miniAlert" 
						   object:nil
						   userInfo:userInfo]];

		
		impact_count += 2;
		if(impact_count >= kill_level){
			[[NSNotificationCenter defaultCenter] removeObserver:self]; 
			[self destroyPhysics];
			[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
							  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
		}
	}
}

-(void)onBulletHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		int remaining_shots = kill_level-impact_count-1;
		NSString *alert_msg = [[NSNumber numberWithInt:remaining_shots] stringValue];

		NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
								  [NSNumber numberWithFloat:self.position.y], @"y",
								  alert_msg,@"msg",nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"miniAlert" 
						   object:nil
						   userInfo:userInfo]];
		
		impact_count ++;
		if(impact_count >= kill_level){
			[[NSNotificationCenter defaultCenter] removeObserver:self]; 
			[self destroyPhysics];
			[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
							  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
		}
	}
}

-(void)clear: (id)sel{
	[[self parent] removeChild:self cleanup:YES];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}

@end
