
#import "ElephantBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"

#import "OOODummyFaceWithSound.h"

@implementation ElephantBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:60 andModuloTrigger:35];
		[bh disableFlipTexture];
         face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"elephant_laugh", @"elephant_auch", @"elephant_die", nil ]];
        //jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:60 andModuloTrigger:220];
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
    //[jbh excecute:framecounter];
    [scrollstr execute];
    [face animate];
}

-(void)dealloc{
    [scrollstr release];
    [face release];
    [bh release];
    //[jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"ElephantHealthController";
}


@end
