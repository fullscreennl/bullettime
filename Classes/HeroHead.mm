//
//  HeroHead.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/5/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

enum {
	kNeutralMode = 1,
	kWalkingMode = 2,
	kWonMode = 3
};

#import "HeroHead.h"
#import "HeroFace.h"

@implementation HeroHead

-(id)init{
	
	if( (self=[super init])) {
		
		//CCSpriteFrame *frame1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"head_004.png"];
		//CCSpriteFrame *frame2 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"head_003.png"];
		//CCSpriteFrame *frame3 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"head_005.png"];
		
        face1 = [CCSprite spriteWithSpriteFrameName:@"head_004.png"];//frontal
        face2 = [CCSprite spriteWithSpriteFrameName:@"head_003.png"];//sideview
        face3 = [CCSprite spriteWithSpriteFrameName:@"head_005.png"];//laughing
        
        //left_eye_closed.position = ccp(20, 70+offset); 
       

		//frames = [[NSMutableArray alloc] init];
		//[frames addObject:frame1];
		//[frames addObject:frame2];
		//[frames addObject:frame3];
		face = [[HeroFace alloc] init];
        [face noSound];
        [face allowJitter:NO];
        //face.scaleX = face.scaleY =.5;
		//[self setDisplayFrame:frame2];
        [self addChild:face1];
       // [face1 setAnchorPoint:ccp(0,0)];
        [face1 setVisible:YES];
        [face1 addChild:face];
        //[face setAnchorPoint:ccp(-0.5,-0.5)];
        [self addChild:face2];
        [face2 setVisible:NO];
       // [face2 setAnchorPoint:ccp(0,0)];
        [self addChild:face3];
        [face3 setVisible:NO];
   // [face3 setAnchorPoint:ccp(0,0)];        
	}
	return self;
}

-(void)frontal{
	if(state!=kWonMode){
		state = kNeutralMode;
	}
}

-(void)shoot{
   
    [face angry];
    [face1 setVisible:YES];
    [face2 setVisible:NO];
    [face3 setVisible:NO];
}

-(void)sideways{
	if(state!=kWonMode){
		state = kWalkingMode;
	}
}

-(void)won{
	state = kWonMode;
    [face happy];
}



-(void)update{
    [face animate];
   
    if (state == kNeutralMode) {
        [face1 setVisible:YES];
        [face2 setVisible:NO];
        [face3 setVisible:NO];
        //[self setDisplayFrame:[frames objectAtIndex:0]];
       // face.visible = YES;
    }else if (state == kWalkingMode){
        if([face getNeutral]){
            [face2 setVisible:YES];
            [face1 setVisible:NO];
            [face3 setVisible:NO];
        }
        //[self setDisplayFrame:[frames objectAtIndex:1]];
        //face.visible = NO;
    }else {
        [face3 setVisible:YES];
        [face2 setVisible:NO];
        [face1 setVisible:NO];
        //[self setDisplayFrame:[frames objectAtIndex:2]];
        //face.visible = YES;
    }
    

}

-(void)dealloc{
    [face release];
   
    //[frames release];
    [super dealloc];
}

@end
