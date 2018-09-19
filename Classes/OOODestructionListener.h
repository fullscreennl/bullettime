//
//  OOODestructionListener.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/11/10.
//  Copyright 2010 fullscreen. All rights reserved.


#import "Box2D.h"
#import "b2Contact.h"

class OOODestructionListener : public b2DestructionListener
{
public:
	OOODestructionListener();
	void SayGoodbye(b2Joint* joint);
	void SayGoodbye(b2Fixture* fix);
	int active;
};
