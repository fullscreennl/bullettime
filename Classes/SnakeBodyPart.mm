//
//  SnakeBodyPart.mm
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 11/15/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "SnakeBodyPart.h"
#import "PeriodicJumpBehaviour.h"

@implementation SnakeBodyPart

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		kill_level = 20;
		jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:50 andModuloTrigger:333];
		[jbh setRandom:150];
	}
	return self;
}

-(void)willDestruct{
	/*
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"BlueMonsterHeadDestructed" 
					   object:nil 
					   userInfo:nil]];
	 */
}

-(void)update{
	[super update];
	framecounter ++;
	[jbh excecute:framecounter];
}


- (void) dealloc{
	[jbh release];
	[super dealloc];
}
@end




