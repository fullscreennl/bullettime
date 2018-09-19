'''
Created on Dec 21, 2010

@author: johantenbroeke
'''
from  sprites import *

def create(lb,xpos):
    xpos = xpos - 1412
    lb.addObject(Beam.BeamSprite(x=1497 + xpos, y=68,width=49,height=21,angle='0' ,restitution=0.2,static='false',friction=0.5,density=2 , firstframe ='robot_upperarm.png' ,sheet='6').setName('upperarmleft'))
    lb.addObject(Beam.BeamSprite(x=1453 + xpos, y=68,width=61,height=19,angle='0' ,restitution=0.2,static='false',friction=0.5,density=1 , firstframe ='robot_lowerarm.png' ,sheet='6').setName('lowerarmleft'))
    lb.addObject(Beam.BeamSprite(x=1616 + xpos, y=70,width=49,height=23,angle='-180' ,restitution=0.2,static='false',friction=0.5,density=2 , firstframe ='robot_upperarm.png' ,sheet='6').setName('upperarmright'))
    lb.addObject(Beam.BeamSprite(x=1658 + xpos, y=70,width=55,height=16,angle='-180' ,restitution=0.2,static='false',friction=0.5,density=1 , firstframe ='robot_lowerarm.png' ,sheet='6').setName('lowerarmright'))
   
    lb.addObject(Beam.BeamSprite(x=1556 + xpos, y=106,width=84,height=117,angle='0' ,restitution=0.2,static='false',friction=0.5,density=20 , firstframe ='robot_body.png' ,classname='RobotSprite',sheet='6').setName('mainbody'))

    lb.addObject(Enemy.EnemySprite(x=1412 + xpos , y=70,width=30,height=30,angle='0',restitution=0.2,static='false',friction=0.5,density=2 , classname='SlingerBallSprite',firstframe='slingerball.png',sheet='6').setName('left_blob'))
    lb.addObject(Enemy.EnemySprite(x=1777 + xpos , y=70,width=30,height=30,angle='0',restitution=0.2,static='false',friction=0.5,density=2 , classname='SlingerBallSprite',firstframe='slingerball.png',sheet='6').setName('right_blob'))

    lb.addObject(Friend.FriendSprite(x=1590 + xpos, y=47,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0,density=20 , firstframe ='roboto_wheel.png',sheet='6' ).setName('rightwheel'))
    lb.addObject(Friend.FriendSprite(x=1523 + xpos, y=47,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 , firstframe ='roboto_wheel.png' ,sheet='6').setName('leftwheel'))
 
 
    lb.addObject(Joints.DistanceJoint(body1='left_blob',body2='lowerarmleft',damping='0.2',freq='4' , b2_Xoffset = '-18' ))
    lb.addObject(Joints.DistanceJoint(body1='right_blob',body2='lowerarmright',damping='0.2',freq='5' , b2_Xoffset = '18' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-27' , b2_Yoffset = '-35' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '27' , b2_Yoffset = '-35' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='lowerarmleft',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '18' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='lowerarmright',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-18' ))   
    lb.addObject(Joints.RevoluteJoint(body1='rightwheel',body2='mainbody',motor_speed='-5',enable_motor='false',torque='1000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
    lb.addObject(Joints.RevoluteJoint(body1='leftwheel',body2='mainbody',motor_speed='-1',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
    
    lb.addObject(Joints.DistanceJoint(body1='left_blob',body2='lowerarmleft',damping='0.2',freq='4' , b2_Xoffset = '-18' ))
    lb.addObject(Joints.DistanceJoint(body1='right_blob',body2='lowerarmright',damping='0.2',freq='5' , b2_Xoffset = '18' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-27' , b2_Yoffset = '-35' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '27' , b2_Yoffset = '-35' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='lowerarmleft',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '18' ))
    lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='lowerarmright',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-18' ))