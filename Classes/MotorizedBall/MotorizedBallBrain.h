
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, AlienSoundBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface MotorizedBallBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    PeriodicJumpBehaviour *jbh;
    AlienSoundBehaviour *sb;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
