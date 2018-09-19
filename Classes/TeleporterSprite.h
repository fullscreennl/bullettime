//
//  TeleporterSprite.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 7/27/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOGameSprite.h"
#import "cocos2d.h"


@interface TeleporterSprite : OOOGameSprite {
	CCParticleSystem* emitter;
	BOOL cleared;
}
-(void)onHit: (NSNotification *)note;
-(void)onSemiHit: (NSNotification *)note;
@end
