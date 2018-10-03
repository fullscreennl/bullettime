//
//  MenuButtonSprite.mm
//  oneonone_stripped
//
//  Created by johan ten broeke on 10/8/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "MenuButtonSprite.h"
#import "OOOSharedLevelmapData.h"

@implementation MenuButtonSprite

-(id)init{
	
	if( (self=[super init])) {
		
		mustSpawnHero = NO;
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onMenuFocusChanged:) 
													 name:@"onMenuFocusChanged" 
												   object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(disableMenuButton:) 
													 name:@"disableMenuButton" 
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(disableMenuButton:) 
													 name:@"goSettings" 
												   object:nil];

		lock = [[CCSprite alloc] initWithSpriteFrameName:@"lock.png"];
		lock.position = ccp(45, 0); 
		lock.scale = 0.5;
		cursor = [[CCSprite alloc] initWithSpriteFrameName:@"clouds0001.png"];
		cursor.position = ccp(0, 0); 
		cursor.visible = NO;
		[self addChild:cursor];
        
        self.opacity = 75;
		
	}
	return self;
	
}

-(void)spawnHero{
	NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x], @"x",
							  [NSNumber numberWithFloat:16.0], @"y",
							  @"Hero",@"name", nil];
	[userinfo retain];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onCreateHero" 
					   object:nil 
					   userInfo:userinfo]];
	
	[userinfo release];
	
	
    [self spawnExtraStuff];
	
}

-(void)spawnExtraStuff{
    NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x+50.0], @"x",
                               [NSNumber numberWithFloat:50.0f], @"y",
                               @"Beam",@"name", nil];
    [userinfo2 retain];
    
    [[NSNotificationCenter defaultCenter]
     postNotification:[NSNotification
                       notificationWithName:@"onCreateMenuBlock"
                       object:nil
                       userInfo:userinfo2]];
    
    [userinfo2 release];
    
    NSNumber *miles = [NSNumber numberWithInt:(100 - (self.position.x-28)/57)];
    NSString *str = [NSString stringWithFormat:@"End of the world party.#%@ miles >>>",[miles stringValue]];
    
    NSDictionary *userinfo3 = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:self.position.x+190.0], @"x",
                               [NSNumber numberWithFloat:25.0], @"y",
                               str,@"msg", nil];
    [userinfo3 retain];
    
    [[NSNotificationCenter defaultCenter]
     postNotification:[NSNotification
                       notificationWithName:@"createMenuSign"
                       object:nil
                       userInfo:userinfo3]];
    
    [userinfo3 release];
}

-(void)setSpriteData:(NSString *)data{
	spriteData = data;
	OOOSharedLevelmapData *lmd = [OOOSharedLevelmapData get];
	NSNumber *score = [lmd levelScoreForIndex:spriteData];
	if (score) {
		if([score intValue] == INITSCORE){
			mustSpawnHero = YES;
		}
		
		locked = NO;
		[[NSNotificationCenter defaultCenter] addObserver:self 
												 selector:@selector(onLevelSelected:) 
													 name:@"onLevelSelected" 
												   object:nil];
	}else{
		locked = YES;
		[self addChild:lock];
	}
	
	self.visible = YES;
}

-(void)update{
	if (mustSpawnHero) {
		[self spawnHero];
	}
	mustSpawnHero = NO;
}

-(void)onMenuFocusChanged:(NSNotification*)note{
		
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	NSString *level_desc;
	
	level_desc = [sprite1 getSpriteData];
	if (!level_desc) {
		level_desc = [sprite2 getSpriteData];
	}
	
	if ([level_desc isEqualToString:spriteData]) {
		self.opacity = 255;
		//cursor.visible = YES;
	}else{
		self.opacity = 75;
		cursor.visible = NO;
	}
}

-(void)disableMenuButton:(NSNotification *)note{
	[[NSNotificationCenter defaultCenter] removeObserver:self]; 
}

-(void)onLevelSelected: (NSNotification *)note{
	
	//NSLog(@"onLevelSelected %@",self);
	
	OOOGameSprite *sprite1 = [[note userInfo] objectForKey:@"sprite1"];
	OOOGameSprite *sprite2 = [[note userInfo] objectForKey:@"sprite2"];
	
	if(sprite1 == self or sprite2 == self){

		NSDictionary *userinfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"gunshot_menu", @"sound",nil];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"onSoundEffect" 
						   object:nil 
						   userInfo:userinfo2]];
		
		[self playFrames:[NSArray arrayWithObjects:@"bullet_ani_0.png",@"bullet_ani_1.png",@"bullet_ani_2.png",
													@"bullet_ani_3.png",@"bullet_ani_4.png",nil] loop:NO target:self callback:@selector(clearSelf:)];
		
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"disableMenuButton" 
						   object:nil 
						   userInfo:nil]];
		
	}
}

-(void)clearSelf:(id)target{
	
	[self unschedule:@selector(clearSelf:)];
	
	OOOSharedLevelmapData *lmd = [OOOSharedLevelmapData get];
	NSString *level_id = [lmd setLevelIDForIndex:spriteData];
	
	NSDictionary *dict = [NSDictionary dictionaryWithObject:level_id forKey:@"level_id"];
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"onDrawLevel" 
					   object:nil
					   userInfo:dict]];
}

-(void)dealloc{
	[lock release];
	[cursor release];
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[super dealloc];
}


@end
