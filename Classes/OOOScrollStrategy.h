//
//  OOOScrollStrategy.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/19/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroSprite.h"
#import "HeroVicinityAlerter.h"
#import "OOOGameSprite.h"


@interface OOOScrollStrategy : NSObject {
	int currentScrollMode;
	OOOGameSprite *hero;
	HeroVicinityAlerter *va;
	OOOGameSprite *enemySprite;
	int framecounter;
	BOOL active;
	id delegate;
}
-(void)left;
-(void)right;
-(void)battle;
-(void)normal;
-(void)notify:(int)scroll_type;
-(void)execute;
-(void)setEnemySprite:(OOOGameSprite *)sprite;
-(void)setDelegate:(id)_del;
@end
