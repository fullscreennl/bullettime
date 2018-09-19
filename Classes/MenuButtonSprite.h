//
//  MenuButtonSprite.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/8/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface MenuButtonSprite : OOOGameSprite {
	BOOL locked;
	CCSprite *lock;
	BOOL mustSpawnHero;
	CCSprite *cursor;
}

@end
