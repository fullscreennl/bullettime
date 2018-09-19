
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface ShoveItBrain :EndbossGenericBodyPart {
    PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
