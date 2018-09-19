//
//  EndbossHealthController.m
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "EndbossHealthController.h"
#import "EndbossHealthControllerManager.h"
#import "OOOFaceWithExpressions.h"


@implementation EndbossHealthController

-(id)init{
	self = [super init];
	if (self) {
		bodyparts = [[NSMutableArray alloc]init];
		hits = 0;
		counter = 0;
		destructed = NO;
		jointsDestructed = NO;
	}
	return self;
}

-(void)setFace:(id)_face{
	[_face retain];
	[face release];
	face = _face;
}

-(void)update{
	if (!destructed) {
		return;
	}
	if(!jointsDestructed){
		[bodyparts makeObjectsPerformSelector:@selector(destroyAllConnectedJoints)];
		jointsDestructed = YES;
	}
	counter ++;
	if(counter%60 == 0 && counter > 121){
		if([bodyparts count] > 0){
			id bp = [bodyparts objectAtIndex:0];
			[bp performSelector:@selector(enemyKilled)];
			[bodyparts removeObjectAtIndex:0];
		}else{
			[self remove];		 
		}
	}
}

-(int)killLevel{
	return 100;
}

-(void)reportCannonBallHit{
	hits += 5;
	if (hits > [self killLevel]) {
		destructed = YES;
	}
	if (face != nil && hits > [self killLevel]-7) {
		[face dying];
	}
}

-(void)reportBulletHit{
	hits ++;
	if (hits > [self killLevel]) {
		destructed = YES;
	}
	if (face != nil && hits > [self killLevel]-7) {
		[face dying];
	}
}

-(void)setDelegate:(EndbossHealthControllerManager *)del{
	delegate = del;
}

-(void)remove{
	[delegate removeMe:key];
}

-(void)addBodyPart:(EndbossGenericBodyPart *)bp andKey:(NSString*)_key{
	[bodyparts addObject:bp];
	[_key retain];
	[key release];
	key = _key;
	//NSLog(@"bp : %@",bodyparts);
}

-(void)dealloc{
	[face release];
	[bodyparts release];
	[key release];
	[super dealloc];
}
@end
