//
//  SimpleScrollStrategySprite.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/24/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "SimpleScrollStrategySprite.h"
#import "HeroSprite.h"


@implementation SimpleScrollStrategySprite
-(id)init{
	if( (self=[super init])) {
		hero = [HeroSprite getSprite];
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];
	}
	return self;
}

-(OOOGameSprite*)getHero{
	return hero;
}

-(void)update{
	[super update];
	[scrollstr execute];
}

-(void)dealloc{
	[scrollstr release];
	[super dealloc];
}
@end
