//
//  OOOScrollStrategy.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/19/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOScrollStrategy.h"
#import "OOOGameView.h"
#import "HeroSprite.h"
#import "EnemySprite.h"


@implementation OOOScrollStrategy

-(id)init{
	if((self = [super init])){
		hero = [HeroSprite getSprite];
		framecounter = 0;
		active = NO;
		delegate = nil;
	}
	return self;
}

-(void)setEnemySprite:(OOOGameSprite *)sprite{
	enemySprite = sprite;
	va = [[HeroVicinityAlerter alloc] initWithGameSprite:sprite andTarget:self andTriggerDistance:500.0 andAction:@selector(alertMe:)];
}

-(void)alertMe:(id)_inVicinity{
	int inVicinity = [_inVicinity intValue];
	if (inVicinity) {
		active = YES;
	}else{
		[self battle];
		active  = NO;
	}
}

-(void)setDelegate:(id)_del{
	delegate = _del;
}

-(void)execute{
	framecounter ++;
	[va excecute:framecounter];
	if (!active) {
		return;
	}
	if(hero.position.x > enemySprite.position.x){
		[self right];
		if(delegate){
			[delegate performSelector:@selector(scrollRight)];
		}
	}else{
		[self left];
		if(delegate){
			[delegate performSelector:@selector(scrollLeft)];
		}
	}
}

-(void)left{
	[self notify:SCROLLMODE_LEFT];
}

-(void)right{
	[self notify:SCROLLMODE_RIGHT];
}

-(void)battle{
	[self notify:SCROLLMODE_BATTLE];
}

-(void)normal{
	[self notify:SCROLLMODE_STANDARD];
}

-(void)notify:(int)scroll_type{
	
	if (scroll_type == currentScrollMode) {
		return;
	}
	
	NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:scroll_type] ,@"type",nil];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"scrollStrategy" 
					   object:nil 
					   userInfo:userInfo]];
	
	currentScrollMode = scroll_type;
}
	
			  
-(void)dealloc{
	[self normal];
	[va release];
	[super dealloc];
}

@end
