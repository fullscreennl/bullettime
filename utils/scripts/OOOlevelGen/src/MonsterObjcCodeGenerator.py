LIMB_h = """
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@interface %(name)sLimb :EndbossGenericBodyPart {

}

@end
"""

LIMB_m = """
#import "%(name)sLimb.h"


@implementation %(name)sLimb

-(NSString*)controllerType{
    return @"%(name)sHealthController";
}

-(BOOL)mustRotate{
    return YES;
}

@end
"""

BRAIN_h = """
#import <Foundation/Foundation.h>
#import "EndbossGenericBodyPart.h"

@class HeroChasingBehaviour, PeriodicJumpBehaviour, OOOScrollStrategy;


@interface %(name)sBrain :EndbossGenericBodyPart {
    HeroChasingBehaviour *bh;
    PeriodicJumpBehaviour *jbh;
    OOOScrollStrategy *scrollstr;
    int framecounter;
}

@end
"""

BRAIN_m = """
#import "%(name)sBrain.h"

#import "HeroChasingBehaviour.h"
#import "PeriodicJumpBehaviour.h"
#import "OOOScrollStrategy.h"


@implementation %(name)sBrain

-(id)init{
    if( (self=[super init])) {
        framecounter = 0;
        bh = [[HeroChasingBehaviour alloc]initWithGameSprite:self andForce:30 andModuloTrigger:40];
        jbh = [[PeriodicJumpBehaviour alloc]initWithGameSprite:self andForce:20 andModuloTrigger:40];
        scrollstr = [[OOOScrollStrategy alloc]init];
        [scrollstr setEnemySprite:self];
    }
    return self;
}

-(BOOL)mustRotate{
    return NO;
}

-(void)update{
    [super update];
    framecounter ++;
    [bh excecute:framecounter];
    [jbh excecute:framecounter];
    [scrollstr execute];
}

-(void)dealloc{
    [scrollstr release];
    [bh release];
    [jbh release];
    [super dealloc];
}

-(NSString*)controllerType{
    return @"%(name)sHealthController";
}


@end
"""

CONTROLLER_h = """
#import <Foundation/Foundation.h>
#import "EndbossHealthController.h"

@interface %(name)sHealthController : EndbossHealthController {
    
}

@end
"""

CONTROLLER_m = """
#import "%(name)sHealthController.h"

@implementation %(name)sHealthController

-(int)killLevel{
    return 20;
}

@end
"""

import os
import config

def generateWithName(name):
    
    filetemplates = [(LIMB_h,"Limb.h"),(LIMB_m,"Limb.mm"),
                     (BRAIN_h,"Brain.h"),(BRAIN_m,"Brain.mm"),
                     (CONTROLLER_h,"HealthController.h"),(CONTROLLER_m,"HealthController.mm")]
    
    if name == "ID":
    	return False
    
    try:
        os.makedirs(config.OBJC_CLASS_PATH+name)
    except:
    	return False
    
    for f in filetemplates:
        objc_file = open(config.OBJC_CLASS_PATH+name+"/"+name+f[1],'w')
        objc_file.write(f[0]%{'name':name})
        objc_file.close()
        
    return True
        
        
if __name__ == "__main__":
    print generateWithName("KingofBlobs")
    
    
    
    
    
    
