//
//  LauncherSprite.mm
//  oneonone
//
//  Created by Johan ten Broeke on 3/14/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "LauncherSprite.h"
#import "Box2D.h"


@implementation LauncherSprite
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
	//NSLog(@"event name launcher + %@",name);
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onTrigger:) 
												 name:name
											   object:nil];
	
}

-(void) onTrigger:(NSNotification *) note{
	NSString *evt = [note name];
	NSArray *chunks = [evt componentsSeparatedByString: @"#"];
	[self executeTrigger:[[chunks objectAtIndex:1] intValue]];
}

-(void) executeTrigger: (int)force{
	b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	b2Vec2 impulse(0,force);
	myBody->ApplyLinearImpulse(impulse,point);
}

- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
