//
//  OOOBatmanAlert.h
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/1/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface OOOBatmanAlert : CCSprite {
	float t;
}
-(void)clearSelf:(id)target;
-(void)fade;
-(id) initWithPNGName:(NSString*)png;
-(id) initWithPNGName:(NSString*)png andTime:(float)_t;
-(void)setUp:(NSString*)png;
@end
