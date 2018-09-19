//
//  OOOReachability.h
//  MonkeySwipe
//
//  Created by Johan ten Broeke on 4/19/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOOReachability : NSObject {
	NSString *ping;
}
-(int) isOnline;

@end
