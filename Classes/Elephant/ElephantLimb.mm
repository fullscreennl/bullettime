
#import "ElephantLimb.h"


@implementation ElephantLimb

-(NSString*)controllerType{
    return @"ElephantHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
