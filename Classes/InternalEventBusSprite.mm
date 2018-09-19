//
//  MonsterFootSprite.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/15/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "InternalEventBusSprite.h"


@implementation InternalEventBusSprite


-(void)setSpriteData:(NSString *)data{
	spriteData = data;
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onDestruct:) 
												 name:spriteData
											   object:nil];
}

-(void) onDestruct:(NSNotification *) note{

	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	[self destroyPhysics];
	
	if(self.parent.tag == 5){
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
						  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}else{
		[self playFrames:[NSArray arrayWithObjects:@"ms_clouds0001.png",@"ms_clouds0001.png",@"ms_clouds0001.png",
						  @"ms_clouds0001.png",nil] loop:NO target:self callback:@selector(clear:)];
	}
	
}



-(void)clear: (id)sel{
	[[self parent] removeChild:self cleanup:NO];
}

-(void)dealloc{
	[super dealloc];
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
}


@end
