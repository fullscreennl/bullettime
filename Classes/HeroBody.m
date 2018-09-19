//
//  HeroBody.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/5/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

enum {
	kNeutralMode = 1,
	kWalkingMode = 2,
	kRunningMode = 3
};

#import "HeroBody.h"


@implementation HeroBody

-(id)init{
	
	if( (self=[super init])) {
		
		CCSpriteFrame *frame1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body_004.png"];
		CCSpriteFrame *frame2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body_003.png"];
		//CCSpriteFrame *frame3 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body_004_running1.png"];
		//CCSpriteFrame *frame4 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body_005_running1.png"];
		//CCSpriteFrame *frame5 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body_006_running1.png"];
		//CCSpriteFrame *frame6 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"body_005_running1.png"];
		frames = [[NSMutableArray alloc] init];
		[frames addObject:frame1];
		[frames addObject:frame2];
		//[frames addObject:frame3];
		//[frames addObject:frame4];
		//[frames addObject:frame5];
		//[frames addObject:frame6];
		framecounter = 0;
		slowframecounter = 0;
		[self setDisplayFrame:frame1];
	}
	return self;
}

-(void)frontal{
	state = kNeutralMode;
}

-(void)sideways{
	state = kWalkingMode;
}

-(void)running{
	state = kRunningMode;
}

-(void)update{
	framecounter++;
	if(framecounter%3==0){
		slowframecounter++;
	}
	if (state == kNeutralMode) {
		[self setDisplayFrame:[frames objectAtIndex:0]];
	}else if(state==kRunningMode){
		//int offset = (slowframecounter % 4)+2;
		//NSLog(@"framcounter walk animation: %i",offset);
		//[self setDisplayFrame:[frames objectAtIndex:offset]];
		[self setDisplayFrame:[frames objectAtIndex:1]];
	}else{
		[self setDisplayFrame:[frames objectAtIndex:1]];
	}
	
}

-(void)dealloc{
    [frames release];
    [super dealloc];
}
@end
