//
//  OOORemoteLevelLoader.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOORemoteLevelLoader : NSObject {
	NSMutableData *receivedData;
	NSDictionary *level_dict;
	id delegate;
    NSURLConnection *theConnection;
}

-(void)loadRemoteTestLevel;

@end
