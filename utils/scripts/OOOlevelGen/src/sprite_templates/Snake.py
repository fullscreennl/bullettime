'''
Created on Dec 21, 2010

@author: johantenbroeke
'''
from sprites import *

def create(lb,xpos):
    
    xpos = xpos - 2399;
    
    lb.addObject(Enemy.EnemySprite(firstframe='snake_head.png', x=2399 + xpos, y=29,width=57,height=57,angle='0',restitution=0.2,static='false',friction=0.2,density=20, classname='SnakeHeadSprite', sheet='6').setName('snake_head'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2467 + xpos, y=23,width=47,height=47,angle='0',restitution=0.2,static='false',friction=0.2,density=20 , classname='SnakeBodyPart', sheet='6').setName('snake_body_1'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2520 + xpos, y=19,width=38,height=38,angle='0',restitution=0.2,static='false',friction=0.2,density=20 , classname='SnakeBodyPart', sheet='6').setName('snake_body_2'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2571 + xpos, y=17,width=34,height=34,angle='0',restitution=0.2,static='false',friction=0.2,density=20 , classname='SnakeBodyPart', sheet='6').setName('snake_body_3'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2623 + xpos, y=14,width=28,height=28,angle='0',restitution=0.2,static='false',friction=0.2,density=20 , classname='SnakeBodyPart', sheet='6').setName('snake_body_4'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2668 + xpos, y=12,width=24,height=24,angle='0',restitution=0.2,static='false',friction=0.2,density=20, classname='SnakeBodyPart' , sheet='6').setName('snake_body_5'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2709 + xpos, y=10,width=20,height=20,angle='0',restitution=0.2,static='false',friction=0.2,density=20 , classname='SnakeBodyPart', sheet='6').setName('snake_body_6'))
    lb.addObject(Enemy.EnemySprite(firstframe='snake_body.png', x=2747 + xpos, y=8,width=16,height=16,angle='0',restitution=0.2,static='false',friction=0.5,density=20 , classname='SnakeBodyPart',  sheet='6').setName('snake_body_7'))
    
    lb.addObject(Joints.DistanceJoint(body1='snake_head',body2='snake_body_1',damping='0.2',freq='5',texture_type='image',texture = 'snake_body.png',texture_width=52))
    lb.addObject(Joints.DistanceJoint(body1='snake_body_2',body2='snake_body_1',damping='0.2',freq='5' ,texture_type='image',texture = 'snake_body.png',texture_width=42))
    lb.addObject(Joints.DistanceJoint(body1='snake_body_2',body2='snake_body_3',damping='0.2',freq='5' ,texture_type='image',texture = 'snake_body.png',texture_width=36))
    lb.addObject(Joints.DistanceJoint(body1='snake_body_4',body2='snake_body_3',damping='0.2',freq='5' ,texture_type='image',texture = 'snake_body.png',texture_width=30))
    lb.addObject(Joints.DistanceJoint(body1='snake_body_4',body2='snake_body_5',damping='0.2',freq='5' ,texture_type='image',texture = 'snake_body.png',texture_width=26))
    lb.addObject(Joints.DistanceJoint(body1='snake_body_6',body2='snake_body_5',damping='0.2',freq='5',texture_type='image',texture = 'snake_body.png',texture_width=22))
    lb.addObject(Joints.DistanceJoint(body1='snake_body_6',body2='snake_body_7',damping='0.2',freq='5' ,texture_type='image',texture = 'snake_body.png',texture_width=18))