
#import "PistonLimb.h"


@implementation PistonLimb

-(NSString*)controllerType{
    return @"PistonHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
