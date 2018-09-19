
#import "WalkingPigTailLimb.h"


@implementation WalkingPigTailLimb

-(NSString*)controllerType{
    return @"WalkingPigTailHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
