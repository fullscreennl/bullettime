//
//  SquareBlobSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/1/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "SquareBlobSprite.h"
#import "Box2D.h"


@implementation SquareBlobSprite


-(id)init
{
	if((self=[super init])){
		closeEyeName = @"squareblob_eye_closed2.png";
	}
	return self;
}


-(void)update{
	[super update];
	self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
	if (!defaultScaleX) {
		defaultScaleX = self.scaleX;
		[self drawElements];
	}
	
	frame_counter ++;
	if (frame_counter%120 == 0) {
		b2Vec2 point(myBody->GetPosition().x+10, myBody->GetPosition().y+10);
		b2Vec2 impulse([self getXImpulse],100);
		myBody->ApplyLinearImpulse(impulse,point);
		[self openEyes];
		[self openMouth];
	}
	
	if (frame_counter%45 == 0) {
		self.scaleX = defaultScaleX*1.05;
		[self closeMouth];
	}
	
	if (frame_counter%91 == 0) {
		self.scaleX = defaultScaleX*1.0;
		[self closeEyes];
	}
	
	
}

@end
