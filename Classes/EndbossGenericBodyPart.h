//
//  EndbossGenericBodyPart.h
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnemySprite.h"

@class EndbossHealthControllerManager, EndbossHealthController,OOOFaceWithExpressions;

@interface EndbossGenericBodyPart : EnemySprite {
	EndbossHealthControllerManager *man;
	//EndbossHealthController *controller;
	id face;
    NSString *key;
}

-(NSString*)controllerType;

@end
