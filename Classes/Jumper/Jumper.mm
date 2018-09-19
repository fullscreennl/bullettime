//
//  EndbossGenericBodyPart.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "Jumper.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "JumperFace.h"


@implementation Jumper

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
		bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
		jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];
		
		face = [[JumperFace alloc] init];
		[self addChild:face];
        [face release];
		
	}
	return self;
}

-(BOOL)mustRotate{
	return NO;
}

-(void)update{
	[super update];
	framecounter ++;
	[bh excecute:framecounter];
	[jbh excecute:framecounter];
	[scrollstr execute];
	[face animate];
}

-(void)dealloc{
	[scrollstr release];
	[bh release];
	[jbh release];
	[super dealloc];
}

-(NSString*)controllerType{
	return @"JumperHealthController";
}


@end
