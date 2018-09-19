
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy,StepperFace;


@interface StepperBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    int framecounter;
	int numfires;
}
-(void)fire;

@end
