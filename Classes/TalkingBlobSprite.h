//
//  TalkingBlobSprite.h
//  BulletTime
//
//  Created by Johan ten Broeke on 3/21/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlobSprite.h"


@interface TalkingBlobSprite : BlobSprite {
    BOOL talking;
    int pulse_counter;
}

@end
