
#import "MeatGrinderBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"
#import "AlienSoundBehaviour.h"

@implementation MeatGrinderBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"highref_spinning" andModuloTrigger:120];
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
    [sb excecute:framecounter];
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [face animate];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [face release];
    [bh release];
    [sb release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"MeatGrinderHealthController";
}


@end
