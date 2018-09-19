
#import "GooBallsLimb.h"


@implementation GooBallsLimb

-(void)onBulletHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
		[self showBulletHit];
		
		impact_count ++;
		if(impact_count >= kill_level){
			[self enemyKilled];
		}
	}
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

-(NSString*)controllerType{
    return nil;
}

-(BOOL)mustRotate{
    return YES;
}

@end
