//
//  OOODummyFaceWithSound.m
//  BulletTime
//
//  Created by Johan ten Broeke on 8/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "OOODummyFaceWithSound.h"


@implementation OOODummyFaceWithSound

-(id)initWithSounds:(NSArray *)sounds{
    self = [super init];
    if(self){
        soundArr = sounds;
		[soundArr retain];
        myFrameCounter = 1;
		stateDuration = 120; //approx 1 sec

    }
    return self;
}

-(NSArray*)soundDefinition{	
	return soundArr;
}

-(void)playSound:(NSString*)_sound
{
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:_sound, @"sound", nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:userinfo]];
    isNeutral = NO;
}


#pragma mark EXPRESSION STATES
#pragma mark -

#pragma mark dying
-(void)dying{
    if(!isDying){
        [self playSound:[soundArr objectAtIndex:2]];
    }
    isDying = YES;
}

-(void)doDying{
	//NSLog(@"dying!!!!");
}

#pragma mark neutral
-(void)neutral{
	durationCounter = 0;
}

#pragma mark happy
-(void)happy{
    if(isNeutral){
        [self playSound:[soundArr objectAtIndex:0]];
    }
	durationCounter = 0;
}

#pragma mark happy
-(void)shocked{
	durationCounter = 0;
}

#pragma mark angry
-(void)angry{
    if(isNeutral){
        [self playSound:[soundArr objectAtIndex:1]];
    }
	durationCounter = 0;
}

#pragma mark angry
-(void)sad{
	durationCounter = 0;
}

-(void)animate{
	
	myFrameCounter++;
	if (myFrameCounter > 1000) {
		myFrameCounter = 1;
	}
	
	durationCounter ++;
	if (durationCounter > stateDuration && isDying == NO) {
        isNeutral = YES;
	}
    
}

-(void)dealloc{
    [soundArr release];
	[super dealloc];
}


@end
