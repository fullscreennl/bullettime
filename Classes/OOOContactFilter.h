//
//  OOOContactFilter.h
//  BulletTime
//
//  Created by Johan ten Broeke on 2/3/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "Box2D.h"

class OOOContactFilter : public b2ContactFilter
{
public:
	OOOContactFilter();
	bool ShouldCollide(b2Fixture* fixtureA, b2Fixture* fixtureB); 
	int active;
};
