//
//  OOODestructionListener.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/11/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOODestructionListener.h"
#import "Box2D.h"
#import "OOOJointTexture.h"


// Implement contact listener.
OOODestructionListener::OOODestructionListener(){
	active = 1;
};

void OOODestructionListener::SayGoodbye(b2Joint* joint)
{
	if (joint->GetUserData() != NULL && joint->GetType() == 3){
		OOOJointTexture *jt = (OOOJointTexture *)joint->GetUserData();
		//NSLog(@"texture %p:",jt);
		[jt destroy];
	}
}

void OOODestructionListener::SayGoodbye(b2Fixture* fix){
	//no reaction to shapes needed
}
