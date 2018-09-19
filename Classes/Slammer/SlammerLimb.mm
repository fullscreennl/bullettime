
#import "SlammerRotor.h"


@implementation SlammerRotor

-(NSString*)controllerType{
    return @"SlammerHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
