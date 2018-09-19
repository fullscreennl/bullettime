//
//  StarSprite.mm
//  oneonone
//
//  Created by johan ten broeke on 3/5/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "StarSprite.h"


@implementation StarSprite

-(id)init{
	if( (self=[super init])) {
		[self createKeyFrames];
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelLoaded:) 
													 name:@"levelLoaded" 
												   object:nil];
	}
	return self;
	
}


-(void) onLevelLoaded:(NSNotification *) note{
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onWin:) 
												 name:@"onWin" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onLose:) 
												 name:@"onLose" 
											   object:nil];
	
	
}


-(void) createKeyFrames{
	//NSLog(@"createKeyFrames called : %@",self);
	NSMutableArray *animFrames = [NSMutableArray array];
	for(int i = 1; i < 10; i++) {
		//NSLog(@">>> %@ : ",[NSString stringWithFormat:@"star%04d.png",i]);
	
		CCSpriteFrame *frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"star%04d.png",i]];
		if (frame!=nil) {
			[animFrames addObject:frame];
			//NSLog(@"frames : %@",self);
		}else {
			//NSLog(@" Error frame : %@",[NSString stringWithFormat:@"star%04d.png",i]);
			
		}
		
	}
	
	myKeyFrames = [[CCAnimation animationWithFrames:animFrames delay:0.05f] retain];
	[self play];
	//CCaction *action = [CCAction action];

	
	
}

-(void) onLose:(NSNotification *) note{
	//[(CPPProxy*)[note object] getObject]->deactivate();
	//NSLog(@"onLose %@",self);
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	//[self play];
	//[self destroy];
}

-(void) onWin:(NSNotification *) note{
	//[(CPPProxy*)[note object] getObject]->deactivate();
	//NSLog(@"onWin %@",self);
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	//[self play];
}


-(void)play{
	[self runAction:[CCRepeatForever actionWithAction: [CCAnimate actionWithAnimation:myKeyFrames restoreOriginalFrame:NO] ]];
	//[self runAction:[CCAnimate actionWithAnimation:myKeyFrames restoreOriginalFrame:NO]];
}

- (void) dealloc
{
	[self stopAllActions];
	[myKeyFrames release];
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}

@end
