
#import "DefenseTowerBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation DefenseTowerBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:5 andModuloTrigger:120];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
    }
    return self;
}

-(void)onCannonBallHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		[self showBulletHit];
		
		impact_count += 5;
		if(impact_count >= kill_level){
			[self enemyKilled];
		}
	}
}

-(void)onBulletHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		[self showBulletHit];
		
		impact_count ++;
		if(impact_count >= kill_level){
			[self enemyKilled];
		}
	}
}


-(BOOL)mustRotate{
    return NO;
}

-(void)update{
    [super update];
    framecounter ++;
    [bh excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [bh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"DefenseTowerHealthController";
}


@end
