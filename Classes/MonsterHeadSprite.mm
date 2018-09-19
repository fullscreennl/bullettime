//
//  MonsterHeadSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/12/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "MonsterHeadSprite.h"
#import "HeroChasingBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation MonsterHeadSprite

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		kill_level = 30;
		bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:100 andModuloTrigger:120];
		jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:100 andModuloTrigger:500];
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];
	}
	return self;
}

-(void)willDestruct{
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"BlueMonsterDestructed" 
					   object:nil 
					   userInfo:nil]];
}

-(void)update{
	[super update];
	framecounter ++;
	[bh excecute:framecounter];
	[jbh excecute:framecounter];
	[scrollstr execute];
}

-(void)dealloc{
	[scrollstr release];
	[bh release];
	[jbh release];
	[super dealloc];
}

@end
