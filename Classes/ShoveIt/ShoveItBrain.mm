
#import "ShoveItBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"

@implementation ShoveItBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:-10 andModuloTrigger:40];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"sfx_hero_auch3", @"sfx_ricochet2", @"sfx_ricochet", nil ]];
    }
    return self;
}

-(BOOL)mustRotate{
    return NO;
}

-(void)update{
    [super update];
    framecounter ++;
    [jbh excecute:framecounter];
    [scrollstr execute];
    [face animate];
}

-(void)dealloc{
    [face release];
    [scrollstr release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"ShoveItHealthController";
}


@end
