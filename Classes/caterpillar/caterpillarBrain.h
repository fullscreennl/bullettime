
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface caterpillarBrain :EndbossGenericBodyPart {
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
