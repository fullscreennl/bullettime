
#import "JibberLegBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"


@implementation JibberLegBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"alien_happy", @"alien_angry", @"alien_sad", nil ]];
    }
    return self;
}

-(BOOL)mustRotate{
    return NO;
}

-(void)update{
    [super update];
    framecounter ++;
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [scrollstr execute];
    [face animate];
}

-(void)dealloc{
    [face release];
    [scrollstr release];
    [bh release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"JibberLegHealthController";
}


@end
