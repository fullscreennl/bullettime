
#import "JanssenWalkerBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "AlienSoundBehaviour.h"
#import "OOODummyFaceWithSound.h"

@implementation JanssenWalkerBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"sfx_droning" andModuloTrigger:47];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"sfx_hero_auch3", @"sfx_ricochet2", @"sfx_ricochet", nil ]];
    }
    return self;
}

-(BOOL)mustRotate{
    return YES;
}

-(void)update{
    [super update];
    framecounter ++;
    [face animate];
    [sb excecute:framecounter];
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [bh release];
    [sb release];
    [face release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"JanssenWalkerHealthController";
}


@end
