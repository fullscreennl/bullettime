//
//  EndbossGenericBodyPart.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "JumperLimb.h"


@implementation JumperLimb

-(NSString*)controllerType{
	return @"JumperHealthController";
}

-(BOOL)mustRotate{
	return YES;
}

@end
