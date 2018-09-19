//
//  OOORatingRequest.m
//  BulletTime
//
//  Created by johan ten broeke on 9/5/11.
//  Copyright 2011 fullscreen. All rights reserved.
//

#import "OOORatingRequest.h"
#import "OOOGameSettingsManager.h"

@implementation OOORatingRequest

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(rate:) 
													 name:@"CONF_rating_request.png" 
												   object:nil];
    }
    
    return self;
}

-(void)rate:(NSNotification*)note{
    BOOL userWantsToRate = [[[note userInfo] objectForKey:@"state"]boolValue];
    if(userWantsToRate){
        // only bother once
        [[[OOOGameSettingsManager sharedManager] getSettings] setObject:[NSNumber numberWithBool:YES] forKey:@"userHasRated"];
        [[OOOGameSettingsManager sharedManager] save];
        
        NSLog(@"settings %@",[[OOOGameSettingsManager sharedManager] getSettings]);
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=428499308&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"]];
        
       
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end
