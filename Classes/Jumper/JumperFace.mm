//
//  JumperFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/21/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "JumperFace.h"


@implementation JumperFace


-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"jumper_eye_closed.png",		@"eye_closed",
			@"jumper_eye_open.png",			@"eye_open",
			@"jumper_mouth_open.png",		@"mouth_open",
			@"jumper_mouth_teeth.png",		@"mouth_teeth",
			@"jumper_mouth_neutral.png",	@"mouth_closed",
			@"jumper_mouth_happy.png",		@"mouth_happy",
			@"jumper_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_mumbling", @"alien_dolphin", @"alien_dying1", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 25,60,       75,60,      50,20 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}


@end
