
#import "BuggerBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation BuggerBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:20];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:40 andModuloTrigger:40];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
		numfires = 0;
    }
    return self;
}

-(BOOL)mustRotate{
    return YES;
}

-(void)fire{
	numfires ++;
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO ], @"x",
							  [NSNumber numberWithFloat:( myBody->GetPosition().y+2.0) * PTM_RATIO ], @"y",
							  @"EnemyBullet",@"name", nil];
	[userinfo retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onPumpkinBomberShoot" 
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
	if (framecounter %60 == 0 && numfires < 100) {
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
    return @"BuggerBrainController";
}


@end
