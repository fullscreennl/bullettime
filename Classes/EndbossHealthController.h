//
//  EndbossHealthController.h
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class EndbossGenericBodyPart, EndbossHealthControllerManager,OOOFaceWithExpressions;

@interface EndbossHealthController : NSObject {
	NSMutableArray *bodyparts;
	int hits;
	EndbossHealthControllerManager *delegate;
	NSString *key;
	int counter;
	BOOL destructed;
	BOOL jointsDestructed;
	id face;
}
-(void)addBodyPart:(EndbossGenericBodyPart *)bp andKey:(NSString*)_key;
-(void)reportBulletHit;
-(void)reportCannonBallHit;
-(void)setDelegate:(id)del;
-(void)remove;
-(int)killLevel;
-(void)update;
-(void)setFace:(id)_face;
@end
