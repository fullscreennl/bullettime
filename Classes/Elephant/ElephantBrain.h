
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface ElephantBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    //PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
