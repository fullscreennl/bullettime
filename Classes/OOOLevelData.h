//
//  OOOLevelData.h
//  oneonone
//
//  Created by johan ten broeke on 2/24/10.
//  Copyright 2010 fullscreen. All rights reserved.
//



@interface OOOLevelData : NSObject {
	NSDictionary *leveldict;
}
-(NSDictionary *)getdata;
-(id) initWithLevel:(NSString *)level_id;
-(id) initWithDict:(NSDictionary *)dict;
@end
