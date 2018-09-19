
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface DefenseTowerBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
