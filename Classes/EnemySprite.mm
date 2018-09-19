//
//  EnemySprite.m
//  oneonone
//
//  Created by Johan ten Broeke on 3/5/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "EnemySprite.h"
#import "OOOSharedResourceManager.h"


@implementation EnemySprite

-(id)init{
	if( (self=[super init])) {
		hero = [HeroSprite getSprite];
		[self createKeyFrames];
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelLoaded:) 
													 name:@"levelLoaded" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLose:) 
													 name:@"onLose" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onBulletHit:) 
													 name:@"onBulletHit" 
												   object:nil];

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onCannonBallHit:) 
													 name:@"onCannonBallHit" 
												   object:nil];

        
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onDamage:) 
													 name:@"onDamage" 
												   object:nil];
		
				
		impact_count = 0;
		kill_level = 5;
		
		[[OOOSharedResourceManager get] registerEnemy];
		
	}
	//[self obeyPhysics:NO];
	
	return self;
}


-(void) onLevelLoaded:(NSNotification *) note{
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onWin:) 
												 name:@"onWin" 
											   object:nil];
	/**
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onLose:) 
												 name:@"onLose" 
											   object:nil];
	*/
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onReleaseStar:) 
												 name:@"onReleaseStar" 
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(onDestroy:) 
												 name:@"onDestroy" 
											   object:nil];

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

-(void)onCannonBallHit:(NSNotification *)note{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		
        //NSLog(@"cannon ball hit %@",self);
        
		[self showBulletHit];
		
		impact_count += 2;
		if(impact_count >= kill_level){
			[self enemyKilled];
		}
	}
}

-(void)showBulletHit{
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
							  [NSNumber numberWithFloat:self.position.y], @"y",
							  @"POW!",@"msg",nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"miniAlert" 
					   object:nil
					   userInfo:userInfo]];
}

-(void)enemyKilled{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[self destroyPhysics];
	[self clearDecals];
	[self willDestruct];
	[self playClouds];
}

-(void) createKeyFrames{
	NSMutableArray *animFrames = [NSMutableArray array];
	for(int i = 1; i <= 8; i++) {
		[animFrames addObject:[NSString stringWithFormat:@"enemy%04d.png",i]];
	}
	[self setKeyFrames:animFrames];
}

-(void) onReleaseStar:(NSNotification *) note{
	[self destroyJointByName:@"star_joint"];	
}


-(void) onDestroy:(NSNotification *) note
{
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		[[NSNotificationCenter defaultCenter] removeObserver:self];	
		[self destroyPhysics];
		[self playClouds];
	}
	
}

//////////////////////////////
// subclass implementations //
//////////////////////////////
-(void)willDestruct{}
-(void)onDamage:(NSNotification*)note{}
-(void)clearDecals{}


-(void)clear: (id)sel{
	//NSLog(@"dieing enemy -> %@",self);
	[[OOOSharedResourceManager get] unRegisterEnemy];
	[[self parent] removeChild:self cleanup:YES];
}

-(BOOL)mustRotate{
	return NO;
}

-(void)update{
	
	if (_obeyPhysics) {
		self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
		if([self mustRotate]){
			self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
		}
	}
	self.visible = YES;
}

-(void) onLose:(NSNotification *) note{
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];	
	if([[note userInfo] objectForKey:@"sprite1"]==self or [[note userInfo] objectForKey:@"sprite2"]==self){
		//NSLog(@"onLose! %@",self);
	}
}

-(void) onWin:(NSNotification *) note{

	//NSLog(@"onWin %@",self);
	[[NSNotificationCenter defaultCenter] removeObserver:self];	

	[self destroyPhysics];
	[self playClouds];
	
	
}

-(void)playClouds{
	if(self.parent.tag == 5){
		[self playFrames:[NSArray arrayWithObjects:@"clouds0001.png",@"clouds0002.png",@"clouds0003.png",
					  @"clouds0004.png",nil] loop:NO target:self callback:@selector(clear:)];
	}else{
		[self playFrames:[NSArray arrayWithObjects:@"ms_clouds0001.png",@"ms_clouds0001.png",@"ms_clouds0001.png",
						  @"ms_clouds0001.png",nil] loop:NO target:self callback:@selector(clear:)];
	}
}

-(void) setB2Body: (b2Body *)body{
	int bullet_dir;
	
	[super setB2Body:body];
	if ([name isEqualToString:@"EnemyBullet"]) {
		bullet_dir = 8;
		b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
		b2Vec2 impulse(0,bullet_dir);
		myBody->ApplyLinearImpulse(impulse,point);
	}
}

-(OOOGameSprite*)getHero{
	return hero;
}

-(float)distanceToHero
{
	if (!hero) {
		return 1000.0f;
	}
	float xDiff = hero.position.x - self.position.x;
	float yDiff = hero.position.y - self.position.y;
	//NSLog(@"xdiif %f",xDiff);
	//NSLog(@"ydiif %f",yDiff);
	//xDiff = 5.0;
	//yDiff= 12.0;
	float prod =  sqrtf((xDiff*xDiff) + (yDiff*yDiff));
	//NSLog(@"prod %f",prod);
	return prod;
}


- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	[super dealloc];
}



@end
