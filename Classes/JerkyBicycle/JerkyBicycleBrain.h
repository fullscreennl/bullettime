
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, AlienSoundBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface JerkyBicycleBrain :EndbossGenericBodyPart {
    AlienSoundBehaviour *sb;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
