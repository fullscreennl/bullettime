//
//  SteppingFuckerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/28/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "SteppingFuckerFace.h"


@implementation SteppingFuckerFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"stepping_fucker_eye_closed.png",		@"eye_closed",
			@"stepping_fucker_eye_open.png",		@"eye_open",
			@"stepping_fucker_mouth_open.png",		@"mouth_open",
			@"stepping_fucker_mouth_teeth.png",		@"mouth_teeth",
			@"stepping_fucker_mouth_neutral.png",	@"mouth_closed",
			@"stepping_fucker_mouth_happy.png",		@"mouth_happy",
			@"stepping_fucker_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_happy3", @"alien_cry2", @"alien_sad2", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 25,60,       75,60,      50,20 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}

@end
