
#import "MotorizedBallLimb.h"


@implementation MotorizedBallLimb

-(NSString*)controllerType{
    return @"MotorizedBallHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
