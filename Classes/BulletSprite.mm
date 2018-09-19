//
//  Bullet.mm
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/12/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "BulletSprite.h"
#import "b2Body.h"
#import "cocos2d.h"
#import "OOOGameViewDecorator.h"


@implementation BulletSprite


-(id)init{
    self = [super init];
	if( self) {
		frames_lived = 0;

        emitter = [CCParticleSun node];
        emitter.life = 1.0f;
        emitter.visible = NO;
        emitter.duration = 1.0f;
        emitter.lifeVar = 0.1f;
        emitter.totalParticles = 50;
        emitter.emissionRate = 50;
        
        [[OOOGameViewDecorator getBatmanLayer] addChild:emitter];
        //NSLog(@"bullet emittor attached to batmalayer: %@",emitter);
        
    }
	return self;
	
}

-(void)update{
	[super update];
	frames_lived ++;
	[[OOOGameViewDecorator getBatmanLayer] sync];
	emitter.visible = YES;
	emitter.position = self.position;
	if(frames_lived > 100){
		//NSLog(@"is bullet ? %i",myBody->IsBullet());
		[[OOOGameViewDecorator getBatmanLayer] removeChild:emitter cleanup:YES];
		[self destroy];
	}

}

-(void) setB2Body: (b2Body *)body{
	int bullet_dir;
	if ([name isEqualToString:@"rbullet"]) {
		bullet_dir = 8;
	}else{
		bullet_dir = -8;
	}
	body->SetBullet(TRUE);
	[super setB2Body:body];
	b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	b2Vec2 impulse(bullet_dir,0);
	myBody->ApplyLinearImpulse(impulse,point);
}

- (void) dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
	//[emitter release];
	[super dealloc];
}

@end
