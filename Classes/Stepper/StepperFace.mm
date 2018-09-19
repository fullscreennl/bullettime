//
//  FlunkerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/18/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "StepperFace.h"


@implementation StepperFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"stepper_eye_closed.png",		@"eye_closed",
			@"stepper_eye_open.png",		@"eye_open",
			@"stepper_mouth_open.png",		@"mouth_open",
			@"stepper_mouth_teeth.png",		@"mouth_teeth",
			@"stepper_mouth_neutral.png",	@"mouth_closed",
			@"stepper_mouth_happy.png",		@"mouth_happy",
			@"stepper_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_mumbling", @"alien_dolphin", @"alien_dying1", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 25,200,       125,200,      75,150 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}

@end
