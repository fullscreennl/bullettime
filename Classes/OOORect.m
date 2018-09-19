//
//  OOORect.m
//  oneonone_stripped
//
//  Created by johan ten broeke on 9/24/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOORect.h"
#import "cocos2d.h"

@implementation OOORect

-(void)draw{
	
	CGPoint floorVertices[] = { ccp(0,0), ccp(480,0), ccp(0,320), ccp(480,320)};
	//const GLfloat floorColorArray[] = {1,1,1,0.5, 1,1,1,0.5,   1,1,1,0.5, 1,1,1,0.5 };
	
	glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	glDisableClientState(GL_COLOR_ARRAY);
	
	glColor4ub(0,0,0,100);
	//glEnableClientState(GL_COLOR_ARRAY);
	//glColorPointer(4, GL_FLOAT, 0, floorColorArray);
	glVertexPointer(2 ,GL_FLOAT, 0, floorVertices);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);

	// restore default state
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glEnable(GL_TEXTURE_2D);	
	
}

@end
