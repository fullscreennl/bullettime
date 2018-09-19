
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, AlienSoundBehaviour,PeriodicJumpBehaviour, OOOScrollStrategy;


@interface MagicWalkerBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    AlienSoundBehaviour *sb;
    int framecounter;
}

@end
