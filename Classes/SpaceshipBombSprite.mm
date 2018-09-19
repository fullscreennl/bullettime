//
//  SpaceshipBombSprite.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/5/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "SpaceshipBombSprite.h"
#import "OOOGameViewDecorator.h"

@implementation SpaceshipBombSprite




-(void) setB2Body: (b2Body *)body{
	int bullet_dir;	
	[super setB2Body:body];
	bullet_dir = -8;
	b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	b2Vec2 impulse(0,bullet_dir);
	myBody->ApplyLinearImpulse(impulse,point);
}


-(void)update{
	[super update];
	
	frame_counter ++;
	[[OOOGameViewDecorator getBatmanLayer] sync];
	if(emitter==nil){
		emitter = [CCParticleSun node];
		emitter.life = 0.3f;
		//emitter.visible = NO;
		emitter.duration = 100.0f;
		emitter.lifeVar = 0.3f;
		//emitter.totalParticles = 50;
		emitter.emissionRate = 150;
		//[[OOOGameViewDecorator getBatmanLayer] sync];
		[[OOOGameViewDecorator getBatmanLayer] addChild:emitter];
		//NSLog(@"emittor attached to batmalayer: %@",emitter);
	}
	
	
	//emitter.visible = YES;
	emitter.position = self.position;
	
	
	if (frame_counter%magicnumber == 0) {
		b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
		float tempie = [self getXImpulse];
		b2Vec2 impulse(tempie,10.0f);
		myBody->ApplyLinearImpulse(impulse,point);
		magicnumber = [self getRandomNr];

	}
	
	
	
}

-(void)clear: (id)sel{
	//NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys: [NSNumber numberWithFloat:volume], @"volume", nil];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onSpaceshipBombDestroyed" 
					   object:nil 
					   userInfo:nil]];
	//NSLog(@"callbak!!!");
	[super clear:sel];
	
}



@end
