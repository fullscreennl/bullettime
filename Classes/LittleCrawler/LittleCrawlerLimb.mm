
#import "LittleCrawlerLimb.h"


@implementation LittleCrawlerLimb

-(NSString*)controllerType{
    return @"LittleCrawlerHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
