//
//  ExitDoor.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/6/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "ExitDoor.h"


@implementation ExitDoor

-(id)init{
	if( (self=[super init])) {
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(open:) 
													 name:@"onLevelCleared" 
												   object:nil];
	}
	return self;
}

-(void)open:(NSNotification *)note{
	//NSLog(@"is it going off!!!!! %@",[note userInfo]);
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[self destroyPhysics];
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}


@end
