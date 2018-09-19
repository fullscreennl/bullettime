//
//  EndbossGenericBodyPart.h
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour,AlienSoundBehaviour, OOODummyFaceWithSound, PeriodicJumpBehaviour, OOOScrollStrategy;

@interface SnailBodyPart :EndbossGenericBodyPart {
	//HeroChasingBehaviour *bh;
	PeriodicJumpBehaviour *jbh;
	OOOScrollStrategy *scrollstr;
	int framecounter;
    AlienSoundBehaviour *sb;
    //OOODummyFaceWithSound *face;
}

@end
