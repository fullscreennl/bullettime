//
//  OOOCannon.h
//  oneonone_stripped
//
//  Created by Johan ten Broeke on 8/2/10.
//  Copyright 2010 fullscreen.nl. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OOOCannon : NSObject {
	NSMutableDictionary *triggers;
	NSMutableArray *triggers_freqs;
}

-(void)addCannonDef: (NSDictionary *)dict;
-(void)execute:(int)framecounter;

@end
