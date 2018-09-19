
#import "StepperBrain_2.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation StepperBrain_2

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:50 andModuloTrigger:81];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:81];
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
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [bh release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"StepperHealthController";
}


@end
