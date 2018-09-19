//
//  LauncherSprite.h
//  oneonone
//
//  Created by Johan ten Broeke on 3/14/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface LauncherSprite : OOOGameSprite {

}
-(void) executeTrigger: (int)force;
-(void) onTrigger:(NSNotification *) note;
-(void) onLevelLoaded:(NSNotification *) note;
@end
