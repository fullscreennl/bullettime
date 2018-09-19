'''
Created on Dec 22, 2010

@author: johantenbroeke
'''
from sprites import *

def create(lb,xpos):
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x= xpos + 2324-2324, y=57,width=115,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=7 ,sheet='6').setName('edge_2'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x= xpos + 2462-2324, y=57,width=115,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=7 ,sheet='6').setName('edge_3'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_head.png', x= xpos + 2393-2324, y=166,width=115,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=2 ,classname='MonsterHeadSprite',sheet='6').setName('edge_1'))
    lb.addObject(Joints.DistanceJoint(body1='edge_1',body2='edge_2',damping='0.2',freq='1' ,texture_type='image',texture = 'monster_leg.png', texture_width=128))
    lb.addObject(Joints.DistanceJoint(body1='edge_1',body2='edge_3',damping='0.2',freq='1' ,texture_type='image',texture = 'monster_leg.png', texture_width=128))
    lb.addObject(Joints.DistanceJoint(body1='edge_2',body2='edge_3',damping='0.2',freq='1' ,texture_type='image',texture = 'monster_leg.png', texture_width=128))
