//
//  HeroVicinityAlerter.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 11/17/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "HeroVicinityAlerter.h"
#import "HeroSprite.h"
#import "EnemySprite.h"

@implementation HeroVicinityAlerter

-(id)initWithGameSprite:(OOOGameSprite *)sprite andTriggerDistance:(float)_distance andAction:(SEL)_sel
{
	if( (self=[super init])) {
		target = sprite;
		selector = _sel;
		mySprite = sprite;
		distance = _distance;
		hero = [(EnemySprite*)mySprite getHero];
		//NSLog(@"is the hero known in vicinity checker? %@",hero);
		inside = NO;
	}
	return self;
}

-(id)initWithGameSprite:(OOOGameSprite *)sprite andTarget:(id)_target andTriggerDistance:(float)_distance andAction:(SEL)_sel
{
	if( (self=[super init])) {
		selector = _sel;
		mySprite = sprite;
		distance = _distance;
		hero = [(EnemySprite*)mySprite getHero];
		inside = NO;
		target = _target; 
	}
	return self;
}



-(float)distanceToHero
{
	if (!hero) {
		return 3000.0f;
	}
	float xDiff = hero.position.x - mySprite.position.x;
	float yDiff = hero.position.y - mySprite.position.y;
	//NSLog(@"xdiif %f",xDiff);
	//NSLog(@"ydiif %f",yDiff);
	//xDiff = 5.0;
	//yDiff= 12.0;
	float prod =  sqrtf((xDiff*xDiff) + (yDiff*yDiff));
	//NSLog(@"checking ditance: %f",prod);
	//NSLog(@"prod %f",prod);
	return prod;
}


-(void)excecute:(int)framecounter{
	if (framecounter%4 == 0) {
		
		if ([self distanceToHero]< distance && inside == NO) {
			//NSLog(@">>>>>>>>>>>>>>>>>hero IN vicinity of snakehead >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			inside = YES;
			[target performSelector:selector withObject:[NSNumber numberWithInt:inside]];
		}
		if ([self distanceToHero]> distance && inside == YES) {
			//NSLog(@">>>>>>>>>>>>>>>>>hero OUT vicinity of snakehead >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
			inside = NO;
			[target performSelector:selector withObject:[NSNumber numberWithInt:inside]];
		}
		
	}
}


@end
