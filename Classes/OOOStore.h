//
//  OOOStore.h
//  oneonone
//
//  Created by johan ten broeke on 3/26/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOStoreView.h"

@interface OOOStore : NSObject {
	NSMutableDictionary *upgrade_settings;
	OOOStoreView *store_view;
}
-(void) upgrade;
-(void) restore;
-(BOOL) hasUpgraded;
@end
