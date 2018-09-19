//
//  EnemyRotor.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/2/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "EnemyRotor.h"


@implementation EnemyRotor

-(void)update{
	[super update];
	self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
}

@end
