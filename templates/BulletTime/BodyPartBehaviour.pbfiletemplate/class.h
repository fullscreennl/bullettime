//
//  EndbossGenericBodyPart.h
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface «FILEBASENAMEASIDENTIFIER» :EndbossGenericBodyPart {
	HeroChasingBehaviour *bh;
	PeriodicJumpBehaviour *jbh;
	OOOScrollStrategy *scrollstr;
	int framecounter;
}

@end
