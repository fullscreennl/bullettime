
#import "PistonBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "AlienSoundBehaviour.h"
#import "OOODummyFaceWithSound.h"
@implementation PistonBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"piston_walk_loop" andModuloTrigger:66];
        scrollstr = [[OOOScrollStrategy alloc]init];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"sfx_hero_auch", @"sfx_ricochet2", @"sfx_ricochet", nil ]];
        [scrollstr setEnemySprite:self];
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
    [sb excecute:framecounter];
    [jbh excecute:framecounter];
    [face animate];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [bh release];
    [jbh release];
    [sb release];
    [face release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"PistonHealthController";
}


@end
