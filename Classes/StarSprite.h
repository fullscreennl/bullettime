//
//  StarSprite.h
//  oneonone
//
//  Created by johan ten broeke on 3/5/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"
#import "cocos2d.h"


@interface StarSprite : OOOGameSprite {
		CCAnimation *myKeyFrames;
}
-(void) createKeyFrames;
-(void) play;

@end
