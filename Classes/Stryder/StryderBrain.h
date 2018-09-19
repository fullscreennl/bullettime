
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface StryderBrain :EndbossGenericBodyPart {
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
