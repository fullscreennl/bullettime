
#import "MotorizedBallBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "AlienSoundBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"

@implementation MotorizedBallBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"sfx_droning" andModuloTrigger:47];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"sfx_hero_auch2", @"sfx_ricochet2", @"sfx_ricochet", nil ]];
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
    [sb excecute:framecounter];
    [scrollstr execute];
    [face animate];
}

-(void)dealloc{
    [scrollstr release];
    [face release];
    [sb release];
    [bh release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"MotorizedBallHealthController";
}


@end
