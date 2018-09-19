//
//  EndbossHealthControllerManager.m
//  BulletTime
//
//  Created by Johan ten Broeke on 1/2/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "EndbossHealthControllerManager.h"
#import "EndbossHealthController.h"
#import "EndbossGenericBodyPart.h"


@implementation EndbossHealthControllerManager

static EndbossHealthControllerManager *EndbossHealthControllerManager_ = nil;

+ (EndbossHealthControllerManager *)get
{
	if (!EndbossHealthControllerManager_)
		EndbossHealthControllerManager_ = [[EndbossHealthControllerManager alloc] init];
	
	return EndbossHealthControllerManager_;
}

-(EndbossHealthController *)addBodyToControllerForKey:(EndbossGenericBodyPart*)bp forKey:(NSString*)key withType:(NSString*)controllerType{
	
	id controller = [controllers objectForKey:key];
	if (! controller) {
		controller = [[NSClassFromString(controllerType) alloc]init];
		[controller setDelegate:self];
		[controllers setObject:controller forKey:key];
		[controller release];
	}
	[controller addBodyPart:bp andKey:key];
	
	return controller;
}

-(EndbossHealthController *)getControllerByKey:(NSString *)key{
    return [controllers objectForKey:key];
}

-(void)clean:(NSNotification *)note{
	//NSLog(@"clean controllers : %@",controllers);
	[controllers release];
	controllers = [[NSMutableDictionary alloc]init];
	//NSLog(@"clean controllers : %@",controllers);
}

-(void)removeMe:(NSString *)key{
	[controllers removeObjectForKey:key];
}

-(id)init{
	self = [super init];
	if(self){
        
		controllers = [[NSMutableDictionary alloc]init];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(clean:) 
													 name:@"onLeaveLevel" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(clean:) 
													 name:@"onTestLevel" 
												   object:nil];

		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(clean:) 
													 name:@"onDrawLevel" 
												   object:nil];
		
	}
	return self;
}

-(void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[controllers release];
	[super dealloc];
}

@end
