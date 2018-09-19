//
//  SnakeHeadSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "SnakeHeadSprite.h"
#import "HeroChasingBehaviour.h"
#import "DieSoundBehaviour.h"
#import "HeroVicinityAlerter.h"

@implementation SnakeHeadSprite

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		kill_level = 30;
		bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:500 andModuloTrigger:120];
		jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:1000 andModuloTrigger:500];
		hvbhtwo = [[HeroVicinityAlerter alloc]initWithGameSprite:self andTriggerDistance:400 andAction:@selector(activate:)];
		hvbh = [[HeroVicinityAlerter alloc]initWithGameSprite:self andTriggerDistance:80 andAction:@selector(playHissing:)];
		active = NO;
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];

	}
	return self;
}


-(void)activate:(id)inVicinity
{
	active=YES;
}

-(void)playHissing:(id)inVicinity
{
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"snake_hiss", @"sound", nil];
	[[NSNotificationCenter defaultCenter] 
						postNotification:[NSNotification 
										  notificationWithName:@"onSoundEffect" 
														object:nil 
														userInfo:userinfo2]];
}

-(void)willDestruct{
	DieSoundBehaviour *dsbh = [[DieSoundBehaviour alloc] initWithSound:@"alien_dying"];
	[dsbh release];
}

-(void)update{
	[super update];
	framecounter ++;
	[hvbhtwo excecute:framecounter];
	if(active){
		[bh excecute:framecounter];
		[jbh excecute:framecounter];
		[hvbh excecute:framecounter];
		[scrollstr execute];
	}
	
}

- (void) dealloc{
	[scrollstr release];
	[bh release];
	[jbh release];
	[hvbh release];
	[hvbhtwo release];
	[super dealloc];
}

@end
