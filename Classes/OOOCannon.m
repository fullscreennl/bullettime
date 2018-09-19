//
//  OOOCannon.m
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 8/2/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOCannon.h"


@implementation OOOCannon

-(id) init
{
	if( (self=[super init])) {
		triggers = [[NSMutableDictionary alloc] init];
		triggers_freqs = [[NSMutableArray alloc] init];
	}	
	return self;
}


-(void)addCannonDef: (NSDictionary *)dict{

	NSNumber *freq = [dict objectForKey:@"freq"];
	if ([triggers objectForKey:freq]) {
		[[triggers objectForKey:freq] addObject:dict];
	}else{
		NSMutableArray *freqs_to_trigger = [NSMutableArray array];
		[freqs_to_trigger addObject:dict];
		[triggers setObject:freqs_to_trigger forKey:freq];
	}
		 
	[triggers_freqs addObject:freq];
	
	//NSLog(@"freqs %@",triggers_freqs);
		 
}

-(void)execute:(int)framecounter{
	
	int arrayCount = [triggers_freqs count];
	for (int i = 0; i < arrayCount; i++) {
		
		if (framecounter%[[triggers_freqs objectAtIndex:i]intValue] == 0) {
			
			NSMutableArray *cannon_array = [triggers objectForKey:[triggers_freqs objectAtIndex:i]];
			
			int cannoncount = [cannon_array count];
			
			for (int j = 0; j < cannoncount; j++){
				
				[[NSNotificationCenter defaultCenter] 
				 postNotification:[NSNotification 
								   notificationWithName:[[cannon_array objectAtIndex:j] objectForKey:@"event"] 
								   object:nil 
								   userInfo:nil]];
				
				int max = [[[cannon_array objectAtIndex:j] objectForKey:@"max"]intValue];
				if (max*[[triggers_freqs objectAtIndex:i]intValue] == framecounter) {
					[triggers_freqs removeObjectAtIndex:i];
				}
				
			}
		}
	}
	
	
}

-(void)dealloc{
	[triggers release];
	[triggers_freqs release];
    [super dealloc];
}

@end
