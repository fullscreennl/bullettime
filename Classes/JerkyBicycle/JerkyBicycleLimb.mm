
#import "JerkyBicycleLimb.h"


@implementation JerkyBicycleLimb

-(NSString*)controllerType{
    return @"JerkyBicycleHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
