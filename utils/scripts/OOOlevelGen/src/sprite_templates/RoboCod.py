'''
Created on Dec 21, 2010

@author: johantenbroeke
'''
from sprites import *

def create(lb,xpos):
    offset=100
    xoffset= xpos - 340
    lb.addObject(Enemy.EnemySprite(x=373+xoffset, y=127+offset,width=84,height=84,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ,firstframe='robocod_body.png',sheet='6').setName('Body'))
    lb.addObject(Enemy.EnemySprite(x=373+xoffset, y=190+offset,width=84,height=84,angle='0',restitution=0.2,static='false',friction=0.5,density=1,classname='RoboCodHead',firstframe='enemy0001.png' ,sheet='6').setName('Head'))
    lb.addObject(Enemy.EnemySprite(x=404+xoffset, y=62+offset,width=24,height=24,angle='0',restitution=0.2,static='false',friction=0.5,density=2 ,firstframe='robocod_body.png',sheet='6').setName('rightKnee'))
    lb.addObject(Enemy.EnemySprite(x=343+xoffset, y=62+offset,width=24,height=24,angle='0',restitution=0.2,static='false',friction=0.5,density=2 ,firstframe='robocod_body.png',sheet='6').setName('leftKnee'))
    lb.addObject(Enemy.EnemySprite(x=340+xoffset, y=24+offset,width=48,height=48,angle='0',restitution=0.2,static='false',friction=0.5,density=25 ,firstframe='robocod_foot.png',sheet='6').setName('leftFoot'))
    lb.addObject(Enemy.EnemySprite(x=406+xoffset, y=24+offset,width=48,height=48,angle='0',restitution=0.2,static='false',friction=0.5,density=25 ,firstframe='robocod_foot.png',sheet='6').setName('rightFoot'))
    
    lb.addObject(Friend.FriendSprite(x=373+xoffset, y=170+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('bodyOrbiter'))
    lb.addObject(Friend.FriendSprite(x=373+xoffset, y=207+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('headOrbiter'))
    lb.addObject(Joints.RevoluteJoint(body1='Head',body2='headOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
    lb.addObject(Friend.FriendSprite(x=404+xoffset, y=76+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('rightKneeOrbiter'))
    lb.addObject(Joints.RevoluteJoint(body1='rightKnee',body2='rightKneeOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
    lb.addObject(Friend.FriendSprite(x=343+xoffset, y=76+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('leftKneeOrbiter'))
    
    lb.addObject(Joints.RevoluteJoint(body1='leftKnee',body2='leftKneeOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
    
    lb.addObject(Joints.DistanceJoint(body1='Head',body2='Body',damping='0.2',freq='2' , texture_type='image',texture = 'robocod_link.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='leftKnee',body2='Body',damping='0.2',freq='2' , texture_type='image',texture = 'robocod_link.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='rightKnee',body2='Body',damping='0.2',freq='2' , texture_type='image',texture = 'robocod_link.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='leftKnee',body2='leftFoot',damping='0.2',freq='4' , texture_type='image',texture = 'robocod_link.png', texture_width=25))
    lb.addObject(Joints.DistanceJoint(body1='rightKnee',body2='rightFoot',damping='0.2',freq='4' , texture_type='image',texture = 'robocod_link.png', texture_width=25))
    
    lb.addObject(Joints.RevoluteJoint(body1='Body',body2='bodyOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
    
    lb.addObject(Contacts.Contact(body1='leftFoot',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='rightFoot',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='rightKnee',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='leftKnee',body2='Hero',event_name='onDamage'))
    
    lb.addObject(Contacts.Contact(body1='Body',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='Head',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='leftFoot',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='rightFoot',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='rightKnee',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='leftKnee',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='Body',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='Head',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='leftFoot',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='rightFoot',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='rightKnee',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='leftKnee',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='Body',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='Head',body2='rbullet',event_name='onBulletHit'))