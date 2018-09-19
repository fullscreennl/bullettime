
#import "caterpillarLimb.h"


@implementation caterpillarLimb

-(NSString*)controllerType{
    return @"caterpillarHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
