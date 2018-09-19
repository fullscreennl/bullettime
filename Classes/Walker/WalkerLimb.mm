
#import "WalkerLimb.h"


@implementation WalkerLimb

-(NSString*)controllerType{
    return @"WalkerHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
