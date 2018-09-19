//
//  BombSprite.h
//  MonkeySwipe
//
//  Created by Johan ten Broeke on 3/28/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface BombSprite :OOOGameSprite {
	
}

-(void) onLevelLoaded:(NSNotification *) note;
-(void) onRemoteExplode:(NSNotification *) note;
-(void) onSimpleExplode:(NSNotification *) note;
-(void) onExplode:(NSNotification *) note;

@end
