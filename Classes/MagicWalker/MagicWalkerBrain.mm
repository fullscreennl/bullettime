
#import "MagicWalkerBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "AlienSoundBehaviour.h"

@implementation MagicWalkerBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:10 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:5 andModuloTrigger:40];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"diesel_engine" andModuloTrigger:682];
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
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [bh release];
    [sb release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"MagicWalkerHealthController";
}


@end
