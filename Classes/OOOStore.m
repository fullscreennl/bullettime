//
//  OOOStore.m
//  oneonone
//
//  Created by johan ten broeke on 3/26/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOStore.h"
#import "OOOStoreView.h"


@implementation OOOStore

-(id) init
{
	if( (self=[super init])) {
		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		NSString *file = [documentsDirectory stringByAppendingPathComponent:@"upgrade.plist"];
		
		upgrade_settings = [[NSMutableDictionary dictionaryWithContentsOfFile:file] retain];
		
		if(upgrade_settings == nil){
			upgrade_settings = [[NSMutableDictionary dictionary] retain];
		}
		
		//NSLog(@"upgrade_settings %@",upgrade_settings);
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(inAppPurchaseTransactionFailed:) 
													 name:@"inAppPurchaseTransactionFailed" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(inAppPurchaseTransactionSuccess:) 
													 name:@"inAppPurchaseTransactionSuccess" 
												   object:nil];
	}
	return self;
}

-(BOOL)hasUpgraded{
	return [[upgrade_settings objectForKey:@"upgraded"] boolValue];
}

-(void)inAppPurchaseTransactionFailed: (NSNotification *)note{
	NSLog(@"inAppPurchaseTransactionFailed failed %@ , %@",[note name],[note object]);
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"upgradeFailed" 
					   object:self
					   userInfo:nil]];
	
}

-(void)inAppPurchaseTransactionSuccess: (NSNotification *)note{
	
	[upgrade_settings setObject:[NSNumber numberWithBool:YES] forKey:@"upgraded"];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *appSettingsPath = [documentsDirectory stringByAppendingPathComponent:@"upgrade.plist"];
	[upgrade_settings writeToFile:appSettingsPath atomically:YES];
	
	//NSLog(@"upgrade_settings written: %@",upgrade_settings);
	
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"upgradeSuccess" 
					   object:self
					   userInfo:nil]];
}


-(void)upgrade{
	if(store_view == nil){
		store_view = [[OOOStoreView alloc]initWithFrame:CGRectMake(0, 0, 480, 320)];
		NSLog(@"--> store view %@",store_view);
	}else {
        
		[store_view requestProductData];
	}
    [store_view setMode:@"purchase"];
}

-(void)restore{
	[self upgrade];
    [store_view setMode:@"restore"];
    
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[store_view release];
	[upgrade_settings release];
    NSLog(@"deallocing store!!");
	[super dealloc];
}

@end
