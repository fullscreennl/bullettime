//
//  ABCannon.m
//  BulletTime
//
//  Created by Johan ten Broeke on 6/1/11.
//  Copyright 2011 fullscreen.nl. All rights reserved.
//

#import "ABCannon.h"
#import "cocos2d.h"
#import "OOOGameViewDecorator.h"
#import "BigBulletSprite.h"
#import "OOOSharedResourceManager.h"


@implementation ABCannon

static float xforce = 0.0;
static float yforce = 0.0;
static ABCannon *instance = nil;

+(void)setInstance:(ABCannon*)cann{
    instance = cann;
}

+(ABCannon*)get{
    return instance;
}

+(void)setForceX:(float)x andY:(float)y{
    xforce = x;
    yforce = y;
}

+(float)getXForce{
    return xforce;
}

+(float)getYForce{
    return yforce;
}


-(id) init{
    self = [super init];
    if(self){
        
        [BigBulletSprite setTrailHolder:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(move:) 
													 name:@"onCannonMove" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(shoot:) 
													 name:@"onCannonShoot" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(activate:) 
													 name:@"onCannonActivated" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(exitCannon:) 
													 name:@"onLevelCleared" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(resumeGame:) 
													 name:@"resumeGame" 
												   object:nil];
        
        NSDictionary *zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.7f] ,@"zoomfact",nil];
        
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"zoom" 
                           object:nil 
                           userInfo:zoominfo]];
        
        NSDictionary *mode = [NSDictionary dictionaryWithObjectsAndKeys:@"cannon" ,@"mode",nil];
        
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"touchControlMode" 
                           object:nil 
                           userInfo:mode]];
        
        activated = NO;
        scollfocus = NO;
        scrollfocus_counter = 100000;
        done = NO;
        
        
        [ABCannon setInstance:self];
        [self draw];
        
        trigger.visible = NO;
        canTrigger = NO;
    
    }
    return self;
}

-(void)exitCannon:(NSNotification*)note{
    [self _exitCannon];
}

-(void)_exitCannon{
        
    NSDictionary *mode = [NSDictionary dictionaryWithObjectsAndKeys:@"gun" ,@"mode",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"touchControlMode" 
                       object:nil 
                       userInfo:mode]];
    
    if(scollfocus){
        [self _spawnHero];
    }else{
        mustSpawnHero = YES;
    }
    
    scollfocus = NO;
    done = YES;
}

-(void)_spawnHero{
    
    [[OOOSharedResourceManager get] clearBullets];
    
    if([BigBulletSprite getPrevTrailHolder] != nil){
        [[OOOGameViewDecorator getBatmanLayer] removeChild:[BigBulletSprite getPrevTrailHolder] cleanup:YES];
        [BigBulletSprite setTrailHolder:nil];
    }

    
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:myBody->GetPosition().x * PTM_RATIO + 200], @"x",
                              [NSNumber numberWithFloat:myBody->GetPosition().y * PTM_RATIO ], @"y",
                              @"Hero",@"name", nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"createHero" 
                       object:nil 
                       userInfo:userinfo]];
    head.visible = NO;
    head2.visible = NO;
    
    NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"sfx_tankdoor", @"sound", nil];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:userinfo2]];

}

-(void)setScrollFocus:(BOOL)hasFocus{
    [self zoomIn];
    if(mustSpawnHero){
        [self _spawnHero];
        scollfocus = NO;
        return;
    }
    scrollfocus_counter = 0;
    scollfocus = hasFocus;
    // canTrigger = YES;
    //trigger.visible = YES;
    //barrel.rotation = 0;
}

-(void)move:(NSNotification*)note{
    if(! activated){
        
        endSwipeX = [[[note userInfo] objectForKey:@"x"] floatValue];
        
        float swipedist = startSwipeX - endSwipeX;
        
        NSDictionary *swipeinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:swipedist], @"swipedist",nil];
        
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"onGameViewMoveBy" 
                           object:nil 
                           userInfo:swipeinfo]];
        
        startSwipeX = endSwipeX;
        
        return;
    }
    float touchx = [[[note userInfo] objectForKey:@"x"] floatValue];
    float touchy = [[[note userInfo] objectForKey:@"y"] floatValue];

    //float selfx = [self convertToWorldSpace:barrel.position].x;
    //float selfy = [self convertToWorldSpace:barrel.position].y;
    
    CGAffineTransform tr = [self nodeToWorldTransform];
    float selfx = barrel.position.x * tr.a + barrel.position.y * tr.c + tr.tx;
    float selfy = barrel.position.x * tr.b + barrel.position.y * tr.d + tr.ty;
    
    //NSLog(@" == ? %f == %f",selfx,[self convertToWorldSpace:barrel.position].x);

    angle = atan2(selfy - touchy, selfx - touchx) * 180 / 3.14;
    barrel.rotation = -angle - self.rotation;

    float xf = touchx - selfx;
    float yf = touchy - selfy;
    
    power = sqrt(xf*xf + yf*yf)/250;
    if(power > 1.0){
        power = 1.0;
    }

    [self notify];

    //[self logTransform:[self nodeToWorldTransform]];

    //float x = 313/2 * cos(angle*0.0174532925) + self.position.x;// + cos(-self.rotation*0.0174532925)*80;
    //float y = 313/2 * sin(angle*0.0174532925) + self.position.y;// + sin(-self.rotation*0.0174532925)*50;
    
   // CCSprite *trail = [[CCSprite alloc] initWithSpriteFrameName:@"trail.png"];
    //trail.position = ccp(x,y);

    //[[OOOGameViewDecorator getBatmanLayer] addChild:trail];
    
}

-(void)logTransform:(CGAffineTransform) tr{
    NSLog(@"- - - - - - ");
    NSLog(@"a %f",tr.a);
    NSLog(@"b %f",tr.b);
    NSLog(@"c %f",tr.c);
    NSLog(@"d %f",tr.d);
    NSLog(@"tx %f",tr.tx);
    NSLog(@"ty %f",tr.ty);
    NSLog(@"- - - - - - ");
    NSLog(@" ");
}

-(void)draw{
    
    int w = 263;
    int h = 263;
    
    dashboard = [[CCSprite alloc] initWithSpriteFrameName:@"tank_dashboard.png"];
    dashboard.position = ccp(w/2,h-50); 
	[self addChild:dashboard];
    [dashboard release];
    
    head = [[CCSprite alloc] initWithSpriteFrameName:@"head_005.png"];
	head.position = ccp(w/2,h-40); 
    head.scale = 0.5;
	[self addChild:head];
    [head release];
    
    head2 = [[CCSprite alloc] initWithSpriteFrameName:@"head_003.png"];
	head2.position = ccp(w/2,h-40); 
    head2.scale = 0.5;
	[self addChild:head2];
    [head2 release];
    head2.visible = NO;
    
    chasis = [[CCSprite alloc] initWithSpriteFrameName:@"tank_chassis.png"];
    chasis.position = ccp(w/2,h/2); 
	[self addChild:chasis];
    [chasis release];

    barrel = [[CCSprite alloc] initWithSpriteFrameName:@"tank_barrel.png"];
    barrel.position = ccp(w/2,h/2); 
	[self addChild:barrel];
    [barrel release];
    
    trigger = [[CCSprite alloc] initWithSpriteFrameName:@"tank_trigger.png"];
    trigger.position = ccp(w/2,h/2); 
	[self addChild:trigger];
    [trigger release];
    
}

-(void)update{
    
    [[OOOGameViewDecorator getBatmanLayer] sync];
    self.visible = YES;
    self.position = CGPointMake( myBody->GetPosition().x * PTM_RATIO, myBody->GetPosition().y * PTM_RATIO);
    self.rotation = -1 * CC_RADIANS_TO_DEGREES(myBody->GetAngle());
 
    if(done){
        return;
    }
    
    scrollfocus_counter ++;
    
    if(!scollfocus || scrollfocus_counter < 10){
        return;
    }
    
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:(myBody->GetPosition().x * PTM_RATIO)],@"xposition",
                              [NSNumber numberWithFloat:(myBody->GetPosition().y * PTM_RATIO)],@"yposition",
                              [NSNumber numberWithFloat:myBody->GetLinearVelocity().x] ,@"xspeed",
                              @"cannon",@"id",nil];
    
    [userInfo retain];
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onScroll" 
                       object:nil
                       userInfo:userInfo]];
    
    [userInfo release];
    
    if(scrollfocus_counter > 100 && !activated){
        trigger.visible = YES;
        canTrigger = YES;
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"showManualScrollIndicator" 
                           object:nil 
                           userInfo:nil]];
    }
    
}

-(void)setSpriteData:(NSString *)data{
    numCannonballs = [data intValue];
    totalCannonBalls = numCannonballs;
}

-(void)shoot:(NSNotification*)note{
    
    if(! activated){
        return;
    }
    
    if(done){
        return;
    }
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"resumeGameScrolling" 
                       object:nil 
                       userInfo:nil]];
    
    NSDictionary *soundinfo = [NSDictionary dictionaryWithObjectsAndKeys:@"canon_shot", @"sound",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onSoundEffect" 
                       object:nil 
                       userInfo:soundinfo]];
    
    numCannonballs --;
    
    float touchx = [[[note userInfo] objectForKey:@"x"] floatValue];
    float touchy = [[[note userInfo] objectForKey:@"y"] floatValue];
    
    float selfx = [self convertToWorldSpace:barrel.position].x;
    float selfy = [self convertToWorldSpace:barrel.position].y;

    float xf = touchx - selfx;
    float yf = touchy - selfy;
    
    [ABCannon setForceX:xf andY:yf];
    
    b2Vec2 point(myBody->GetPosition().x, myBody->GetPosition().y);
	b2Vec2 impulse(xf*10,yf*10);
	myBody->ApplyLinearImpulse(impulse,point);
    
    float _x = 313/2 * cos(angle*0.0174532925) + self.position.x;// + 80;
    float _y = 313/2 * sin(angle*0.0174532925) + self.position.y;// + 50;
    
    //NSLog(@"old pos: %fx%f",_x,_y);
    //[self logTransform:[self nodeToWorldTransform]];
    
    //CGAffineTransform tr = [self nodeToWorldTransform];
    //float x = _x * tr.a + _y * tr.c + tr.tx;
    //float y = _x * tr.b + _y * tr.d + tr.ty;
    
    //NSLog(@"new pos: %fx%f",x,y);
    //NSLog(@"self rotation %f",self.rotation);

    
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat:_x], @"x",
                              [NSNumber numberWithFloat:_y], @"y",
                              @"cannonBall",@"name", nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"onCanonballReleased" 
                       object:nil 
                       userInfo:userinfo]];
    
    canTrigger = NO;
    
    [self zoomOut];
    
    activated = NO;
    scollfocus = NO;
    scrollfocus_counter = 0;
    head.visible = YES;
    head2.visible = NO;
    trigger.visible = NO;
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"hideManualScrollIndicator" 
                       object:nil 
                       userInfo:nil]];
    
    [self notify];
    
    if(numCannonballs == 0){
        [self _exitCannon];
    }
    
}

-(void)notify{
    
    float ammo = numCannonballs/totalCannonBalls;
    
    NSDictionary *stateinfo = [NSDictionary dictionaryWithObjectsAndKeys:
                               [NSNumber numberWithFloat:ammo], @"numBullets",
                               [NSNumber numberWithFloat:power], @"power",
                               nil];

    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"ABCannonStateChanged" 
                       object:nil 
                       userInfo:stateinfo]];

}

-(void)zoomOut{
    NSDictionary *zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.3f] ,@"zoomfact",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"zoom" 
                       object:nil 
                       userInfo:zoominfo]];
}

-(void)zoomIn{
    NSDictionary *zoominfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.7f] ,@"zoomfact",nil];
    
    [[NSNotificationCenter defaultCenter] 
     postNotification:[NSNotification 
                       notificationWithName:@"zoom" 
                       object:nil 
                       userInfo:zoominfo]];
}

-(void)resumeGame:(NSNotification*)note{
    //trigger.visible = YES;
}

-(void)activate:(NSNotification*)note{
    
    if(!canTrigger){
        return;
    }
    
    if(done){
        return;
    }
    
    float touchx = [[[note userInfo] objectForKey:@"x"] floatValue];
    float touchy = [[[note userInfo] objectForKey:@"y"] floatValue];
    float selfx = [self convertToWorldSpace:trigger.position].x;
    float selfy = [self convertToWorldSpace:trigger.position].y;
       
    if(abs(selfx - touchx) < 60 && abs(selfy - touchy) < 60){
        activated = YES;
        trigger.visible = NO;
        head.visible = NO;
        head2.visible = YES;
        
    }else{
        startSwipeX = touchx;
        
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"stopGameScrolling" 
                           object:nil 
                           userInfo:nil]];
        
    }
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [super dealloc];
}

@end
