//
//  OOOGameSettingsManager.h
//  MonkeySwipe
//
//  Created by Jeroen Goor van on 3/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOOGameSettingsManager : NSObject {
	NSMutableDictionary *settings;
}

+(OOOGameSettingsManager *)sharedManager;
-(void)setSettings:(NSMutableDictionary *) _settings;
-(NSMutableDictionary *)getSettings;
-(void)save;
@end
