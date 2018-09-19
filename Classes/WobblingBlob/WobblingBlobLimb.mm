
#import "WobblingBlobLimb.h"


@implementation WobblingBlobLimb

-(NSString*)controllerType{
    return @"WobblingBlobHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
