//
//  EndbossGenericBodyPart.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "«FILEBASENAMEASIDENTIFIER».h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation «FILEBASENAMEASIDENTIFIER»

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		//bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:100 andModuloTrigger:120];
		//jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:100 andModuloTrigger:500];
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];
	}
	return self;
}

-(BOOL)mustRotate{
	return YES;
}

-(void)update{
	[super update];
	framecounter ++;
	//[bh excecute:framecounter];
	//[jbh excecute:framecounter];
	[scrollstr execute];
}

-(void)dealloc{
	[scrollstr release];
	//[bh release];
	//[jbh release];
	[super dealloc];
}

-(NSString*)controllerType{
	return @"«FILEBASENAMEASIDENTIFIER»HealthController";
}


@end
