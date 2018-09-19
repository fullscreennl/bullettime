
#import "JibberLegLimb.h"


@implementation JibberLegLimb

-(NSString*)controllerType{
    return @"JibberLegHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
