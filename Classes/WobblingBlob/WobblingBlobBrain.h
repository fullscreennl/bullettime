
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface WobblingBlobBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
