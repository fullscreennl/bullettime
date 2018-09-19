//
//  EventAwakeningVisualSprite.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 11/25/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "OOOBackgroundLayer.h"


@interface EventAwakeningVisualSprite : OOOGameSprite {
	OOOBackgroundLayer *bgLayer;
}
-(void)drawSign:(NSNotification*)note;
-(void)setBGLayer:(OOOBackgroundLayer *)bg;
@end
