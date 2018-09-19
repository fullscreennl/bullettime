
#import "StepperLimb.h"


@implementation StepperLimb

-(NSString*)controllerType{
    return @"StepperHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
