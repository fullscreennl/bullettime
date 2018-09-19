//
//  OOOContactListener.h
//  MyGame
//
//  Created by Johan ten Broeke on 2/22/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "Box2D.h"
#import "b2Contact.h"

class OOOContactListener : public b2ContactListener
{
public:
	OOOContactListener();
	
	void* userData; /// Use this to store application specific body data.
	NSDictionary* contact_table;
	void BeginContact(b2Contact* contact);
	void EndContact(b2Contact* contact);
	void activate();
	void deactivate();
	void SetContacts(NSDictionary * contact_table);
	int active;
};