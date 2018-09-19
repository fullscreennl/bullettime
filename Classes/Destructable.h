//
//  Destructable.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/19/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface Destructable :OOOGameSprite {
	int impact_count;
	int kill_level;
}

-(void)onBulletHit:(NSNotification *)note;

@end
