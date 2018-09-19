//
//  OOOSettingsReader.m
//  MonkeySwipe
//
//  Created by Johan ten Broeke on 3/31/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOOSettingsReader.h"


@implementation OOOSettingsReader

-(id)init{
	if( (self=[super init])) {
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *appSettingsPath = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"];
		settings = [[NSMutableDictionary dictionaryWithContentsOfFile:appSettingsPath]retain];
	}
	return self;
}

-(BOOL)doodleStyle{
	return [[settings objectForKey:@"doodleStyle"] boolValue];
}

-(void)dealloc{
	[super dealloc];
	[settings release];
}

@end
