
#import "MeatGrinderLimb.h"


@implementation MeatGrinderLimb

-(NSString*)controllerType{
    return @"MeatGrinderHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
