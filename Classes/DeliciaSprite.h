//
//  DeliciaSprite.h
//  BulletTime
//
//  Created by johan ten broeke on 8/16/11.
//  Copyright 2011 fullscreen. All rights reserved.
//
#import "OOOGameSprite.h"


@interface DeliciaSprite : OOOGameSprite{

    int mode;
    OOOGameSprite *hero;
    int frame_counter;
    float defaultScaleX;
    float oriDefaultScaleX;
}
@end
