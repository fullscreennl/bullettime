//
//  FlunkerFace.mm
//  BulletTime
//
//  Created by johan ten broeke on 2/18/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "HeroFace.h"


@implementation HeroFace

-(NSDictionary*)faceDefinition{
	
	return [NSDictionary dictionaryWithObjectsAndKeys:
			
			@"hero_eye_closed.png",		@"eye_closed",
			@"hero_eye_open.png",		@"eye_open",
			@"hero_mouth_happy.png",		@"mouth_open",
			@"hero_mouth_open.png",	@"mouth_teeth",
			@"hero_mouth_neutral.png",	@"mouth_closed",
			@"hero_mouth_happy.png",	@"mouth_happy",
			@"hero_mouth_sad.png",		@"mouth_sad",
			
			nil];
}

-(void)doAngry{

		
	
}


-(NSData*)triangle{
    stateDuration = 40; 
	//				    left-eye     right-eye     mouth
	int triangle[6]	= { 20,35,       35,35,      30,11 };
	return [NSData dataWithBytes:triangle length:sizeof(int)*6];
}

@end
