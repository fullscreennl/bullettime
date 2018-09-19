//
//  OOOMiniAlert.m
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 9/22/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOMiniAlert.h"


@implementation OOOMiniAlert

-(void)fade{
	[self schedule:@selector(clearSelf:) interval:0.5f];
}

-(void)clearSelf:(id)target{
	[self unschedule:@selector(clearSelf:)];
	[self.parent removeChild:self cleanup:YES];
}

@end
