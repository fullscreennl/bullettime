
#import "StepperBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "StepperFace.h"


@implementation StepperBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:50 andModuloTrigger:41];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:-100 andModuloTrigger:20];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
		numfires = 0;
		face = [[StepperFace alloc] init];
		[self addChild:face]; 
        [face release];
    }
    return self;
}

-(BOOL)mustRotate{
    return YES;
}

-(void)fire{
	[face happy];
	numfires ++;
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO ], @"x",
							  [NSNumber numberWithFloat:( myBody->GetPosition().y-2.0) * PTM_RATIO ], @"y",
							  @"Enemy",@"name", nil];
	[userinfo retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSpitBlob" 
					   object:nil 
					   userInfo:userinfo]];
	
	[userinfo release];
}

-(void)update{
    [super update];
    framecounter ++;
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [scrollstr execute];
	[face animate];
	if (framecounter %240 == 0 && numfires < 20) {
		[self fire];
	}
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
