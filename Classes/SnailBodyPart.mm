//
//  EndbossGenericBodyPart.mm
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "SnailBodyPart.h"
#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"
#import "OOODummyFaceWithSound.h"
#import "AlienSoundBehaviour.h"

@implementation SnailBodyPart

-(id)init{
	if( (self=[super init])) {
		framecounter = 0;
       // bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:100 andModuloTrigger:120];
       // [bh disableFlipTexture];
		jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:200 andModuloTrigger:120 andDirection:@"hor"];
        sb = [[AlienSoundBehaviour alloc] initWithSound:@"sfx_snail_move" andModuloTrigger:120];
		scrollstr = [[OOOScrollStrategy alloc]init];
		[scrollstr setEnemySprite:self];
        face = [[OOODummyFaceWithSound alloc] initWithSounds:[NSArray arrayWithObjects:@"alien_purring", @"alien_angrygrowl2", @"alien_blaet", nil ]];
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
    [sb excecute:framecounter];
	[jbh excecute:framecounter];
	[scrollstr execute];
    [face animate];
}

-(void)dealloc{
    [face release];
	[scrollstr release];
	//[bh release];
    [sb release];
	[jbh release];
	[super dealloc];
}

-(NSString*)controllerType{
	return @"SnailHealthController";
}

@end
