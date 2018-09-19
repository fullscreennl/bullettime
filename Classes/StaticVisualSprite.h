//
//  StaticVisualSprite.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 10/3/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "OOOBackgroundLayer.h"

@interface StaticVisualSprite : OOOGameSprite {
	OOOBackgroundLayer *bgLayer;
}
-(void)drawSign;
-(void)setBGLayer:(OOOBackgroundLayer *)bg;
@end
