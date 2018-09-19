
#import "MuppetMotionLimb.h"


@implementation MuppetMotionLimb

-(NSString*)controllerType{
    return @"MuppetMotionHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
