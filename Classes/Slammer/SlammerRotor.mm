
#import "SlammerLimb.h"


@implementation SlammerLimb

-(NSString*)controllerType{
    return @"SlammerHealthController";
}

-(BOOL)mustRotate{
    return NO;
}

@end
