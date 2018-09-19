
#import "GooBallsBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "AlienSoundBehaviour.h"

@implementation GooBallsBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        sb = [[AlienSoundBehaviour alloc]initWithSound:@"sfx_droning" andModuloTrigger:47];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
     //   face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"alien_pig_happy5", @"alien_angry7", @"alien_pig_sad", nil ]];
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
    [jbh excecute:framecounter];
    [sb excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [sb release];
    [bh release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return nil;
}


@end
