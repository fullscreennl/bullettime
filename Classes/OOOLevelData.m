//
//  OOOLevelData.m
//  oneonone
//
//  Created by johan ten broeke on 2/24/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOLevelData.h"


@implementation OOOLevelData

-(id) initWithLevel:(NSString *)level_id
{
	if( (self=[super init])) {
		NSArray *elems = [level_id componentsSeparatedByString:@"/"];
		NSString *fullpath;
		if ([elems count] > 1 ) {
			fullpath = [[NSBundle mainBundle] pathForResource:[elems objectAtIndex:1] ofType:@"plist" inDirectory:[elems objectAtIndex:0]];
		}else{
			fullpath = [[NSBundle mainBundle] pathForResource:level_id ofType:@"plist"];
		}
		leveldict = [[NSDictionary dictionaryWithContentsOfFile:fullpath]retain];
	}	
	return self;
}

-(id) initWithDict:(NSDictionary *)dict{
	if( (self=[super init])) {
		leveldict = [dict retain];
	}	
	return self;
}

-(NSDictionary *)getdata{
	return leveldict;
}

-(void)dealloc{
	[leveldict release];
	[super dealloc];
}

@end
