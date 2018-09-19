
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, AlienSoundBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy, OOOFaceWithExpressions;


@interface FlunkerBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    AlienSoundBehaviour *sb;
    int framecounter;
	float motorspeed;
}

@end
