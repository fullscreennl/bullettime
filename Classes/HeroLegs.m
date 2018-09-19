//
//  HeroLegs.m
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/4/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

enum {
	kNeutralMode = 1,
	kWalkingMode = 2,
	kRunningMode= 3,
	kJumpingMode = 4,
	kFallingMode = 5
};


#import "HeroLegs.h"


@implementation HeroLegs

-(id)init{
	
	if( (self=[super init])) {
		
		CCSpriteFrame *legsframe0 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_neutral.png"];
		CCSpriteFrame *legsframe1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_jumping.png"];//later jumping mode
		CCSpriteFrame *legsframe2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_walking1.png"];
		CCSpriteFrame *legsframe3 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_walking2.png"];
		CCSpriteFrame *legsframe4 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_walking3.png"];
		CCSpriteFrame *legsframe5 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_walking4.png"];
		CCSpriteFrame *legsframe6 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_walking5.png"];
		CCSpriteFrame *legsframe7 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"hero_legs_walking6.png"];
		
		frames = [[NSMutableArray alloc] init];
		[frames addObject:legsframe0];
		[frames addObject:legsframe1];
		[frames addObject:legsframe2];
		[frames addObject:legsframe3];
		[frames addObject:legsframe4];
		[frames addObject:legsframe5];
		[frames addObject:legsframe6];
		[frames addObject:legsframe7];
		
		[self setDisplayFrame:legsframe1];
		
		framecounter = 0;
	}
	return self;
}

-(void)walk{
	if(state!=kWalkingMode){
		state = kWalkingMode;
		cursor = 2;
	}
}

-(void)stand{
	state = kNeutralMode;
}

-(void)jump{
	state = kJumpingMode;
}

-(void)update:(float)walkspeed{
	//NSLog(@"walkspeed %f",walkspeed);
	//int animation_interval = round((7 - 7*walkspeed/12 )/1)*1;
	int animation_interval;
	if(walkspeed>10.0){
		animation_interval = 1;
	}else if (walkspeed > 3.0) {
		animation_interval = 2;
	}else{
		animation_interval = 4;
	}
	//NSLog(@"animation_interval %i",animation_interval);
	framecounter ++;
	int numframes = [frames count];
	if(state == kWalkingMode){
		if (framecounter%animation_interval == 0) {
			[self setDisplayFrame:[frames objectAtIndex:cursor]];
			cursor ++;
			if(cursor >= numframes){
				cursor = 2;
			}
		}
	}else if (state == kJumpingMode) {
		[self setDisplayFrame:[frames objectAtIndex:1]];
	}else{
		[self setDisplayFrame:[frames objectAtIndex:0]];
	}
}

-(void)dealloc{
	[super dealloc];
	[frames release];
}

@end
