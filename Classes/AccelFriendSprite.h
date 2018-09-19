//
//  NutSprite.h
//  oneonone
//
//  Created by johan ten broeke on 3/10/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface AccelFriendSprite : OOOGameSprite {
}

-(void) onLevelLoaded:(NSNotification *) note;
-(void) onAccel:(NSNotification *) note;
@end
