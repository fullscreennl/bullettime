//
//  OOORemoteLevelLoader.m
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 11/21/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import "OOORemoteLevelLoader.h"
#import "OOOConfig.h"


@implementation OOORemoteLevelLoader

-(void)loadRemoteTestLevel{
	NSURL *url = [NSURL URLWithString:TEST_LEVEL_URL];
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	
	if (theConnection) {
		//NSLog(@"loading started !");
		receivedData = [[NSMutableData data] retain];
	} else {
		//NSLog(@"no data !");
	}
	
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[receivedData appendData:data];	
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
	
    [connection release];
    theConnection = nil;
	[receivedData release];
	
    NSLog(@"Connection failed! test level not loaded !");
	
}

-(void)setDelegate:(id)_delegate{
	delegate = _delegate;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	
	
	NSString *level_loading_error = @"error loading level";
	NSPropertyListFormat format = NSPropertyListXMLFormat_v1_0;  
	
	//[level_dict release];
	level_dict = [NSPropertyListSerialization propertyListFromData:receivedData 
														mutabilityOption:NSPropertyListImmutable 
																  format:&format 
														errorDescription:&level_loading_error];
	
	//NSLog(@"level loaded! :%@ ",level_dict);
	
	//[level_dict retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onTestLevelLoaded" 
					   object:nil 
					   userInfo:level_dict]];
	
	if(!level_dict){
		NSLog(@"error loading remote level!");
	}
	[receivedData release];
    [connection release];
    theConnection = nil;
}

-(void)dealloc{
    [theConnection release];
	[super dealloc];
}

@end
