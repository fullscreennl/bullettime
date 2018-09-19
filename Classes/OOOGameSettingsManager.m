//
//  OOOGameSettingsManager.m
//  MonkeySwipe
//
//  Created by Jeroen Goor van on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OOOGameSettingsManager.h"


@implementation OOOGameSettingsManager

static OOOGameSettingsManager *_sharedManager = nil;

+ (OOOGameSettingsManager *)sharedManager
{
	if (!_sharedManager) {
		_sharedManager = [[self alloc] init];
	}
	return _sharedManager;
}

+(id)alloc
{
	NSAssert(_sharedManager == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}

-(id) init
{
	if( (self=[super init])) {
		//settings = [NSMutableArray initialize];
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *file = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"];
		
		settings = [[NSMutableDictionary dictionaryWithContentsOfFile:file] retain];
		//NSLog(@"settings: %@",settings);
		if(settings == nil){
			NSString *file = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"];
			settings = [[NSMutableDictionary dictionaryWithContentsOfFile:file] retain];
		}
		//soundFXMuted = [[settings objectForKey:@"soundFXMuted"] boolValue];
		//flipControls =[[settings objectForKey:@"flipControls"] boolValue];
		//calibrationOffset = [settings objectForKey:@"calibrationOffset"];
	}
	return self;
}


-(void)save
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *appSettingsPath = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"];
	[settings writeToFile:appSettingsPath atomically:YES];	
}

-(void)setSettings:(NSMutableDictionary *) _settings
{
	[settings release];
	settings = [[NSMutableDictionary dictionaryWithDictionary: _settings] retain]; 
	//NSLog(@"settings dict: %p",settings);
}

-(void)dealloc{
	[settings release];
	[super dealloc];
}


-(NSMutableDictionary *)getSettings
{
	/**
    BOOL soundFXMuted = [[settings objectForKey:@"soundFXMuted"] boolValue];
	BOOL flipControls =[[settings objectForKey:@"flipControls"] boolValue];
	NSNumber *calibrationOffset =[settings objectForKey:@"calibrationOffset"];
	NSLog(@"object for key soundFXMuted %i",soundFXMuted );
	NSLog(@"object for key flipControls %i",flipControls );
	NSLog(@"object for key calibrationOffset %@",calibrationOffset );
     */
	return settings; 
}



		
@end
