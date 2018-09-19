
#import "caterpillarBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"

@implementation caterpillarBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"alien_pig_happy5", @"alien_angry7", @"alien_pig_sad", nil ]];
    }
    return self;
}

-(BOOL)mustRotate{
    return NO;
}

-(void)update{
    [super update];
    framecounter ++;
    [scrollstr execute];
    [face animate];
}

-(void)dealloc{
    [face release];
    [scrollstr release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"caterpillarHealthController";
}


@end
