'''
Created on Dec 21, 2010

@author: johantenbroeke
'''
from sprites import *

def create(lb,xpos):
    lb.addObject(Enemy.EnemySprite(firstframe='pumpkin.png', x=346, y=158,width=98,height=98,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ).setName('beast_body'))
    lb.addObject(Enemy.EnemySprite(firstframe='pumpkin.png', x=448, y=158,width=98,height=98,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ).setName('beast_rear'))
    lb.addObject(Enemy.EnemySprite(firstframe='pumpkin.png', x=341, y=66,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ).setName('beast_knee_1'))
    lb.addObject(Enemy.EnemySprite(firstframe='pumpkin.png', x=458, y=66,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ).setName('beast_knee_2'))
    lb.addObject(Beam.BeamSprite(x=310, y=19,width=101,height=26,angle='0' ,restitution=0.2,static='false',friction=0.5,density=20 ).setName('beast_left_foot'))
    lb.addObject(Beam.BeamSprite(x=469, y=19,width=101,height=26,angle='0' ,restitution=0.2,static='false',friction=0.5,density=20 ).setName('beast_right_foot'))
    lb.addObject(Beam.BeamSprite(x=147, y=196,width=148,height=67,angle='15' ,restitution=0.2,static='false',friction=0.5,density=1 ).setName('beast_head'))
    
    lb.addObject(Joints.DistanceJoint(body1='beast_body',body2='beast_rear',damping='0.2',freq='5' ,texture_type='image',texture = 'pumpkin.png', texture_width=90))
    lb.addObject(Joints.DistanceJoint(body1='beast_body',body2='beast_knee_1',damping='0.2',freq='5' ,texture_type='image',texture = 'pumpkin.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='beast_rear',body2='beast_knee_2',damping='0.2',freq='5' ,texture_type='image',texture = 'pumpkin.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='beast_left_foot',body2='beast_knee_1',damping='0.2',freq='5',texture_type='image',texture = 'pumpkin.png', texture_width=25 ))
    lb.addObject(Joints.DistanceJoint(body1='beast_right_foot',body2='beast_knee_2',damping='0.2',freq='5',texture_type='image',texture = 'pumpkin.png', texture_width=25 ))
    lb.addObject(Joints.DistanceJoint(body1='beast_body',body2='beast_head',damping='0.2',freq='5' ,texture_type='image',texture = 'pumpkin.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='beast_left_foot',body2='beast_head',damping='0.2',freq='5' ,texture_type='none'))
    lb.addObject(Joints.DistanceJoint(body1='beast_left_foot',body2='beast_rear',damping='0.2',freq='5' ,texture_type='none'))
    lb.addObject(Joints.DistanceJoint(body1='beast_right_foot',body2='beast_body',damping='0.2',freq='5',texture_type='none' ))
    lb.addObject(Joints.DistanceJoint(body1='beast_left_foot',body2='beast_knee_2',damping='0.2',freq='5' ,texture_type='none'))
    lb.addObject(Joints.DistanceJoint(body1='beast_right_foot',body2='beast_knee_1',damping='0.2',freq='5' ,texture_type='none'))
    