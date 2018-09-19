
#import "StryderBrain.h"
#import "StryderFace.h"
#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation StryderBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
		face = [[StryderFace alloc] init];
		[self addChild:face]; 
        [face release];
    }
    return self;
}

-(BOOL)mustRotate{
    return NO;
}

-(void)update{
    [super update];
    framecounter ++;
	[face animate];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"StryderHealthController";
}


@end
