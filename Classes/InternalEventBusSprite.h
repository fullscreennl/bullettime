//
//  MonsterFootSprite.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/15/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOGameSprite.h"


@interface InternalEventBusSprite : OOOGameSprite {

}
-(void)onDestruct:(NSNotification *)note;
-(void)clear:(id)sel;
@end
