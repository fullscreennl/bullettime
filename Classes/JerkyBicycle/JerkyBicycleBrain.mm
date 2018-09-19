
#import "JerkyBicycleBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "AlienSoundBehaviour.h"

@implementation JerkyBicycleBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"squeak" andModuloTrigger:841];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
    }
    return self;
}

-(BOOL)mustRotate{
    return YES;
}

-(void)update{
    [super update];
    framecounter ++;
    [sb excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [sb release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"JerkyBicycleHealthController";
}


@end
