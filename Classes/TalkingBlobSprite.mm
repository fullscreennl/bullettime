//
//  TalkingBlobSprite.m
//  BulletTime
//
//  Created by Johan ten Broeke on 3/21/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "TalkingBlobSprite.h"


@implementation TalkingBlobSprite

-(id)init{
	if( (self=[super init])) {
		frame_counter = 0;
        pulse_counter = 0;
		hero = [HeroSprite getSprite];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(switchTextMode:) 
													 name:@"switchTextMode" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(pulse) 
													 name:@"talkingPulse" 
												   object:nil];
      
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(enemyKilled) 
													 name:@"speachCompleted" 
												   object:nil];
        
		closeEyeName =  @"blob_eye_closed2.png";
        
       
		
	}
	return self;
}

-(void)drawElements{
    [super drawElements];

    CCSprite *nose = [[CCSprite alloc] initWithSpriteFrameName:@"blob_nose.png"];
    nose.position = ccp(65, 75); 
    [self addChild:nose];
    [nose release];
    
}

-(void)switchTextMode:(NSNotification*)note{
    if([[[note userInfo] objectForKey:@"enemyIsTalking"]intValue] == 0){
        talking = NO;
    }else{
        talking = YES;
    }
}

-(void)pulse{
    pulse_counter++;
    if(!talking){
        //[self closeEyes];
        [self closeMouth];
        return;
    }
    if (pulse_counter%2 == 0) {
        [self closeMouth];
    }else{
        [self openMouth];
    }
    if (pulse_counter%9 == 0) {
        [self closeEyes];
    }else{
        [self openEyes];
    }

    
}

-(void)update{
	[super update];
	
	if (!defaultScaleX) {
		defaultScaleX = self.scaleX;
		[self drawElements];
	}
    
    frame_counter ++;
	
	if (frame_counter%45 == 0) {
		self.scaleX = defaultScaleX*1.05;
	}
	
	if (frame_counter%91 == 0) {
		self.scaleX = defaultScaleX*1.0;
	}
	
	
}

@end
