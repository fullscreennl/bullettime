
#import "FlunkerBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "AlienSoundBehaviour.h"
#import "OOOScrollStrategy.h"
#import "FlunkerFace.h"


@implementation FlunkerBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
		motorspeed = 5.0;
        //bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:1 andModuloTrigger:1];
        //jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
       // sb = [[AlienSoundBehaviour alloc] initWithSound:@"alien_dolphin" andModuloTrigger:41];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
		[scrollstr setDelegate:self];
		face = [[FlunkerFace alloc] init];
		[self addChild:face]; 
        [face release];
		//[face closeEyes];
    }
    return self;
}

-(BOOL)mustRotate{
    return NO;
}

-(void)scrollRight{
	if (motorspeed == -5.0) {
		return;
	}
	b2RevoluteJoint *j = (b2RevoluteJoint*)[self getJointByName:@"FlunkerMotor"];
	if (j == NULL) {
		return;
	}
	motorspeed = -5.0;
	j->SetMotorSpeed(motorspeed);
	self.scaleX = -1.0;
}

-(void)scrollLeft{
	if(motorspeed == 5.0){
		return;
	}
	b2RevoluteJoint *j = (b2RevoluteJoint*)[self getJointByName:@"FlunkerMotor"];
	if (j == NULL) {
		return;
	}	
	motorspeed = 5.0;
	j->SetMotorSpeed(motorspeed);
	self.scaleX = 1.0;
}

-(void)update{
    [super update];
    framecounter ++;
	//[sb excecute:framecounter];
    //[jbh excecute:framecounter];
	[face animate];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    //[bh release];
    //[jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"FlunkerHealthController";
}


@end
