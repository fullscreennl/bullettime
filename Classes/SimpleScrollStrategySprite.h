//
//  SimpleScrollStrategySprite.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/24/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "OOOScrollStrategy.h"
#import "HeroSprite.h"
#import "OOOGameSprite.h"

@interface SimpleScrollStrategySprite : OOOGameSprite {
	OOOScrollStrategy *scrollstr;
	OOOGameSprite *hero;
}

@end
