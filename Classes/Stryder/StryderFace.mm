//
//  FlunkerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/18/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "StryderFace.h"


@implementation StryderFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"Stryder_eye_closed.png",		@"eye_closed",
			@"Stryder_eye_open.png",		@"eye_open",
			@"Stryder_mouth_open.png",		@"mouth_open",
			@"Stryder_mouth_teeth.png",		@"mouth_teeth",
			@"Stryder_mouth_closed.png",	@"mouth_closed",
			@"Stryder_mouth_teeth.png",		@"mouth_happy",
			@"Stryder_mouth_open.png",		@"mouth_sad",
			
			nil];
}


-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_roaring", @"alien_angry3", @"alien_sad1", nil ];
}



-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 35,90,       135,90,      75,50 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}

@end
