//
//  OOODummyFaceWithSound.h
//  BulletTime
//
//  Created by Johan ten Broeke on 8/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOODummyFaceWithSound : NSObject {
    NSArray *soundArr;
	int myFrameCounter;
	int stateDuration;
	int durationCounter;
	BOOL isNeutral;
	BOOL isDying;
}

-(id)initWithSounds:(NSArray *)sounds;
-(void)animate;

-(void)happy;
-(void)angry;
-(void)neutral;
-(void)sad;
-(void)dying;
-(void)shocked;

@end

