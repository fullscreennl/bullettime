//
//  FlunkerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/18/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "KingofBlobsFace.h"


@implementation KingofBlobsFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"KingofBlobs_eye_closed.png",		@"eye_closed",
			@"KingofBlobs_eye_open.png",		@"eye_open",
			@"KingofBlobs_mouth_open.png",		@"mouth_open",
			@"KingofBlobs_mouth_teeth.png",		@"mouth_teeth",
			@"KingofBlobs_mouth_neutral.png",	@"mouth_closed",
			@"KingofBlobs_mouth_happy.png",		@"mouth_happy",
			@"KingofBlobs_mouth_sad.png",		@"mouth_sad",
			nil];
}


-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_pig_happy4", @"alien_angry5", @"alien_cry", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 15,90,       85,90,      55,20 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}

@end
