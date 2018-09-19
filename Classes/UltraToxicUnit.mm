//
//  ToxicUnit.m
//  BulletTime
//
//  Created by johan ten broeke on 5/9/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "UltraToxicUnit.h"
#import "EnemySprite.h"
#import "EndbossGenericBodyPart.h"
#import "OOOGameView.h"


@implementation UltraToxicUnit

-(id)init{
    self = [super init];
    if(self){
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onToxicHit:) 
													 name:@"onToxicHit" 
												   object:nil];
    }
    return self;
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

-(void)onToxicHit:(NSNotification*)note{
    OOOGameSprite *spr1 = [[note userInfo] objectForKey:@"sprite1"];
    OOOGameSprite *spr2 =[[note userInfo] objectForKey:@"sprite2"];
    
    if([spr1 isKindOfClass:[EndbossGenericBodyPart class]]){
        [self normal];
        [(EnemySprite *)spr1 enemyKilled];
        return;
    }else if([spr2 isKindOfClass:[EndbossGenericBodyPart class]]){
        [self normal];
        [(EnemySprite *)spr2 enemyKilled];
        return;
    }
    
    if([spr1 isKindOfClass:[EnemySprite class]]){
        [(EnemySprite *)spr1 enemyKilled];
    }else if([spr2 isKindOfClass:[EnemySprite class]]){
        [(EnemySprite *)spr2 enemyKilled];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end
