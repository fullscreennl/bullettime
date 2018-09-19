//
//  HeroReplacementSprite.m
//  BulletTime
//
//  Created by johan ten broeke on 6/17/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "HeroReplacementSprite.h"
#import "HeroSprite.h"


@implementation HeroReplacementSprite

-(id)init{
    self = [super init];
    if(self){
        [HeroSprite setSprite:(OOOGameSprite*)self];
    }
    return self;
}

@end
