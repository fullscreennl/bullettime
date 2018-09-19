
#import "WalkerBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"

@implementation WalkerBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:100 andModuloTrigger:500];
        [bh disableFlipTexture];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"hippo_laugh", @"hippo_auch", @"hippo_die", nil ]];

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
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [face release];
    [bh release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"WalkerHealthController";
}


@end
