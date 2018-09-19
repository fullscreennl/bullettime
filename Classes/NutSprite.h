//
//  NutSprite.h
//  oneonone
//
//  Created by johan ten broeke on 3/10/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface NutSprite : OOOGameSprite {
	
}

-(void) onLevelLoaded:(NSNotification *) note;
-(void) onNutHit:(NSNotification *) note;
@end
