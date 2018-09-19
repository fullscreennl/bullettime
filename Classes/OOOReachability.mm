//
//  OOOReachability.m
//  MonkeySwipe
//
//  Created by Johan ten Broeke on 4/19/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOReachability.h"
#import <UIKit/UIKit.h>


@implementation OOOReachability

-(id)init{
	if( (self=[super init])) {
        NSString *deviceUDID =@"myDummyID";
		NSString *script_url = @"http://www.fullscreen.nl/monkeyswipe_app/check.php?devid=";
		NSString *url_str = [script_url stringByAppendingString:deviceUDID];
		NSURL *url = [NSURL URLWithString:url_str];
		ping = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
	}
	return self;
}

-(int) isOnline{
	NSLog(@"response %@",ping);
	if (ping == nil) {
		return 0;
	}else if([ping isEqualToString:@"1"]){
		return 1;
	}else if ([ping isEqualToString:@"2"]) {
		return 2;
	}else if ([ping isEqualToString:@"4"]) {
		return 4;
	}
	return 1;
}

@end
