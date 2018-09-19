//
//  ToxicUnit.h
//  BulletTime
//
//  Created by johan ten broeke on 5/9/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface UltraToxicUnit:OOOGameSprite {
    int currentScrollMode;
}
-(void)normal;
-(void)notify:(int)scroll_type;

@end
