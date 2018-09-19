//
//  EndbossGenericBodyPart.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "EndbossGenericBodyPart.h"
#import "EndbossHealthControllerManager.h"
#import "EndbossHealthController.h"
#import "OOOFaceWithExpressions.h"


@implementation EndbossGenericBodyPart

-(void)onBulletHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		[self showBulletHit];
		[[man getControllerByKey:key] reportBulletHit];
		if (face != nil) {
			[face angry];
		}
	}
}

-(void)onCannonBallHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		[self showBulletHit];
		[[man getControllerByKey:key] reportCannonBallHit];
        if (face != nil) {
			[face angry];
		}
	}
}


-(void)onDamage:(NSNotification*)note{
    if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
        if (face != nil) {
            [face happy];
        }
    }
}

-(void)update{
	[super update];
	[[man getControllerByKey:key] update];
}

-(NSString*)controllerType{
	return @"EndbossHealthController";
}

-(void)setSpriteData:(NSString *)data{
	if (![self controllerType]) {
		return;
	}
    
    [data retain];
    [key release];
    key = data;
    
	man = [EndbossHealthControllerManager get];
	[man addBodyToControllerForKey:self forKey:key withType:[self controllerType]];
    
	if(face != nil){
		[[man getControllerByKey:key] setFace:face];
	}
}

-(void)dealloc{
    [key release];
	[super dealloc];
}

@end
