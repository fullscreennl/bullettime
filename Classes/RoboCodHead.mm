//
//  RoboCodHead.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/24/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "RoboCodHead.h"
#import "DieSoundBehaviour.h"
#import "OOODummyFaceWithSound.h"

@implementation RoboCodHead

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		kill_level = 30;
		hvbhtwo = [[HeroVicinityAlerter alloc]initWithGameSprite:self andTriggerDistance:400 andAction:@selector(activate:)];
		hvbh = [[HeroVicinityAlerter alloc]initWithGameSprite:self andTriggerDistance:80 andAction:@selector(playHissing:)];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"alien_pig_happy5", @"alien_angry7", @"alien_pig_sad", nil ]];

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
	/**
	NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"snake_hiss", @"sound", nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSoundEffect" 
					   object:nil 
					   userInfo:userinfo2]];
	 */
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
        [face animate];
		[hvbh excecute:framecounter];
		[scrollstr execute];
	}
	
}

- (void) dealloc{
    [face release];
	[scrollstr release];
	[hvbh release];
	[hvbhtwo release];
	[super dealloc];
}


@end
