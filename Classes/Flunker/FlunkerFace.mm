//
//  FlunkerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/18/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "FlunkerFace.h"


@implementation FlunkerFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"flunker_eye_closed.png",		@"eye_closed",
			@"flunker_eye_open.png",		@"eye_open",
			@"flunker_mouth_open.png",		@"mouth_open",
			@"flunker_mouth_teeth.png",		@"mouth_teeth",
			@"flunker_mouth_neutral.png",	@"mouth_closed",
			@"flunker_mouth_happy.png",		@"mouth_happy",
			@"flunker_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_mumbling", @"alien_dolphin", @"alien_dying1", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 25,100,       75,100,      50,50 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}

@end
