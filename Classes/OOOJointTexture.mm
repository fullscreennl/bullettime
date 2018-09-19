//
//  OOOJointTexture.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/11/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#define PTM_RATIO 32

#import "OOOJointTexture.h"
#import "cocos2d.h"


@implementation OOOJointTexture


-(void)setJoint:(b2Joint *)joint withDef:(NSDictionary *)dict{
	myJoint = joint;
	joint->SetUserData(self);

	textureType = [dict objectForKey:@"texture_type"];
	
	if([textureType isEqualToString:@"image"]){
		CCSpriteFrame *frame1 = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[dict objectForKey:@"texture"]];
		[self setDisplayFrame:frame1];
		[self setHeight:[[dict objectForKey:@"texture_width"]floatValue]];
	}
	
}

- (void)setWidth:(float)width
{
	float newScale = width/self.contentSize.width;
	self.scaleX = newScale;
}

- (void)setHeight:(float)height
{
	float newScale = height/self.contentSize.height;
	self.scaleY = newScale;
}


-(void)update{
	
	if([textureType isEqualToString:@"image"]){
		float dx = myJoint->GetAnchorA().x - myJoint->GetAnchorB().x;
		float dy = myJoint->GetAnchorA().y - myJoint->GetAnchorB().y;
		float dist = sqrt(dx*dx + dy*dy)*PTM_RATIO;

		[self setWidth:dist];
		
		float angle = atan2(myJoint->GetAnchorA().y - myJoint->GetAnchorB().y, myJoint->GetAnchorA().x - myJoint->GetAnchorB().x) * 180 / M_PI;
		self.rotation = -angle;

		self.position = ccp((myJoint->GetAnchorA().x - (myJoint->GetAnchorA().x - myJoint->GetAnchorB().x)/2) * PTM_RATIO, 
							(myJoint->GetAnchorA().y - (myJoint->GetAnchorA().y - myJoint->GetAnchorB().y)/2) * PTM_RATIO);
	
	}else if ([textureType isEqualToString:@"line"]) {
		glEnable(GL_LINE_SMOOTH);
		glLineWidth( 2.0f );
		glColor4ub(0,0,0,255);
		ccDrawLine( ccp(myJoint->GetAnchorA().x * PTM_RATIO, myJoint->GetAnchorA().y * PTM_RATIO), 
				    ccp(myJoint->GetAnchorB().x * PTM_RATIO, myJoint->GetAnchorB().y * PTM_RATIO) );
		glDisable(GL_LINE_SMOOTH);
	}
	
}

-(void)destroy{
	[self removeFromParentAndCleanup:YES];
}

@end
