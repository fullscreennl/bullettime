//
//  LittleFloaterFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/21/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "LittleFloaterFace.h"


@implementation LittleFloaterFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"floater_eye_closed.png",		@"eye_closed",
			@"floater_eye_open.png",			@"eye_open",
			@"floater_mouth_open.png",		@"mouth_open",
			@"floater_mouth_teeth.png",		@"mouth_teeth",
			@"floater_mouth_neutral.png",	@"mouth_closed",
			@"floater_mouth_happy.png",		@"mouth_happy",
			@"floater_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"sfx_hero_auch3", @"alien_crying", @"alien_dying1", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 25,60,       75,60,      50,20 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}


@end
