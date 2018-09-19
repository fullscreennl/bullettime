
#import "CatapultLimb.h"


@implementation CatapultLimb

-(NSString*)controllerType{
    return @"CatapultHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
