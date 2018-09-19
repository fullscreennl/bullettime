//
//  SlingerBallSprite.m
//  oneonone_stripped
//
//  Created by Jeroen Goor van on 10/1/10.
//  Copyright 2010 Fullscreen. All rights reserved.
//

#import "SlingerBallSprite.h"
#import "Box2D.h"
#import "HeroSprite.h"
#import "OOOGameViewDecorator.h"

@implementation SlingerBallSprite

-(id)init{
	if( (self=[super init])) {
		frame_counter = 0;
		hero = [HeroSprite getSprite];
		kill_level = 5;
		magicnumber = [self getRandomNr];
		SoundFallofDistance = 200.0f;
		soundplaycount = 0;
	}
		
	return self;
}

-(int)getRandomNr
{
	//returns random value between 0 and 1 in thousand steps
	//int r = abs(arc4random());
    //int r = abs(random());
	//int rnd  = (r % 40);
    return 13;
	//return rnd;
	//return 1;
}

-(void)clear: (id)sel{
	[[OOOGameViewDecorator getBatmanLayer] removeChild:emitter cleanup:YES];
	//NSLog(@"callbak!!!");
	[super clear:sel];

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
		float distance = [self distanceToHero];
		float volume = MAX(0, - distance/400.0f + 1);
		//NSLog(@"volume: %f ",volume);
		soundplaycount++;
		if(soundplaycount%25==0){
			NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"fire_torch", @"sound", [NSNumber numberWithFloat:volume], @"volume",nil];
			//NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"fire_torch", @"sound",nil];
			[[NSNotificationCenter defaultCenter] 
							   postNotification:[NSNotification 
							   notificationWithName:@"onSoundEffect" 
							   object:nil 
							   userInfo:userinfo]];
		}
	}
	
	
	
}	

-(float)distanceToHero
{
	if (!hero) {
		return 1000.0f;
	}
	float xDiff = hero.position.x - self.position.x;
	float yDiff = hero.position.y - self.position.y;
	//NSLog(@"xdiif %f",xDiff);
	//NSLog(@"ydiif %f",yDiff);
	//xDiff = 5.0;
	//yDiff= 12.0;
	float prod =  sqrtf((xDiff*xDiff) + (yDiff*yDiff));
	//NSLog(@"prod %f",prod);
	return prod;
}

-(float)getXImpulse{
	if (!hero) {
		return 0.0f;
	}
	if (hero.position.x < self.position.x) {
		return -20.0f;
	}else {
		return 20.0f;
	}
	
}

@end
