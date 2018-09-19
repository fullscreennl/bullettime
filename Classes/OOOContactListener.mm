//
//  ContactListener.mm
//  MyGame
//
//  Created by Johan ten Broeke on 2/22/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOContactListener.h"
#import "OOOGameSprite.h"
#import "Box2D.h"
#import "cocos2d.h"
#import "b2Contact.h"
#import <Foundation/Foundation.h>
//#import "SimpleAudioEngine.h"

// Implement contact listener.
OOOContactListener::OOOContactListener(){
	active = 1;
};

void OOOContactListener::BeginContact(b2Contact* contact)
{
	b2Fixture* fixtureA = contact->GetFixtureA();
	OOOGameSprite* sprite = (OOOGameSprite*)fixtureA->GetBody()->GetUserData();

	b2Fixture* fixtureB = contact->GetFixtureB();
	OOOGameSprite* sprite2 = (OOOGameSprite*)fixtureB->GetBody()->GetUserData();
	
	NSString *subShape = nil;
	NSString *subShape_evt = nil;
	
	if (fixtureB->GetUserData() != NULL){
		NSString *shape_userdata = [[NSString stringWithString:@":" ] stringByAppendingString:(NSString *)fixtureB->GetUserData()];
		subShape = [[sprite getName] stringByAppendingString:shape_userdata];
		subShape_evt = [contact_table objectForKey:subShape];
	}
	
	if (fixtureA->GetUserData() != NULL){
		NSString *shape_userdata = [[NSString stringWithString:@":" ] stringByAppendingString:(NSString *)fixtureA->GetUserData()];
		subShape = [[sprite2 getName] stringByAppendingString:shape_userdata];
		subShape_evt = [contact_table objectForKey:subShape];
	}

	NSString *key = [[sprite getName] stringByAppendingString:[sprite2 getName]];
	NSString *evt = [contact_table objectForKey:key];
	
	NSString *class_evt = [contact_table objectForKey:[sprite getClassName]];
	NSString *class_evt2 = [contact_table objectForKey:[sprite2 getClassName]];
	
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:sprite, @"sprite1",sprite2,@"sprite2",nil];
	
	//float xvel_a = fixtureA->GetBody()->GetLinearVelocity().x;
	//float yvel_a = fixtureA->GetBody()->GetLinearVelocity().y;
	//float xvel_b = fixtureB->GetBody()->GetLinearVelocity().x;
	//float yvel_b = fixtureB->GetBody()->GetLinearVelocity().y;
	//float rel_vel_x = xvel_a - xvel_b;
	//float rel_vel_y = yvel_a - yvel_b;
	//float rel_vel = (rel_vel_x*rel_vel_x)+(rel_vel_y*rel_vel_y);
	
	if (class_evt && active) {
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:class_evt 
						   object:nil
						   userInfo:userInfo]];
	}
	
	if (class_evt2 && active) {
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:class_evt2 
						   object:nil
						   userInfo:userInfo]];
	}

	if (subShape_evt && active) {
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:subShape_evt 
						   object:nil
						   userInfo:userInfo]];
	}
	
	if (evt && active) {
		[[NSNotificationCenter defaultCenter] 
			postNotification:[NSNotification 
							  notificationWithName:evt 
							  object:nil
							  userInfo:userInfo]];
	}

}

void OOOContactListener::deactivate(){
	active = 0;
}

void OOOContactListener::activate(){
	active = 1;
}

void OOOContactListener::SetContacts(NSDictionary *ct)
{
	contact_table = ct;
}

// Implement contact listener.
void OOOContactListener::EndContact(b2Contact* contact)
{
	//NSLog(@"endcontact");

}
