//
//  LittleCrawlerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/21/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "LittleCrawlerFace.h"


@implementation LittleCrawlerFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"crawler_eye_closed.png",		@"eye_closed",
			@"crawler_eye_open.png",			@"eye_open",
			@"crawler_mouth_open.png",		@"mouth_open",
			@"crawler_mouth_teeth.png",		@"mouth_teeth",
			@"crawler_mouth_neutral.png",	@"mouth_closed",
			@"crawler_mouth_happy.png",		@"mouth_happy",
			@"crawler_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(NSArray*)soundDefinition{	
	return [NSArray arrayWithObjects:@"alien_mumbling", @"alien_dolphin", @"alien_dying2", nil ];
}

-(NSData*)triangle{
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 25,60,       75,60,      50,20 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}


@end
