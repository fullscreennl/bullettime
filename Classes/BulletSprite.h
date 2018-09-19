//
//  Bullet.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/12/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"

@interface BulletSprite : OOOGameSprite {
	int frames_lived;
	CCParticleSystem* emitter;
}

@end
