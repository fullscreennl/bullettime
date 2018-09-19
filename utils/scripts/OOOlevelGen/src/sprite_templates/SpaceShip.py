'''
Created on Dec 21, 2010

@author: johantenbroeke
'''
from sprites import *

def create(lb,xpos):
    xpos = xpos - 2602
    lb.addObject(Friend.FriendSprite(x=2682 + xpos, y=9,width=73,height=73,angle='0',restitution=0.5,static='false',friction=0.1,density=1 , firstframe ='wheel.png' ,sheet='6').setName('wheel'))
    lb.addObject(Joints.RevoluteJoint(body1='wheel',body2='spaceship',motor_speed='-50',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
    lb.addObject(Friend.FriendSprite(x=2602 + xpos, y=73,width=77,height=77,angle='0',restitution=0.2,static='false',friction=0.1,density=6 , firstframe ='sprocket.png',sheet='6' ).setName('wheel2'))
    lb.addObject(Joints.RevoluteJoint(body1='wheel2',body2='spaceship',motor_speed='-500',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
    lb.addObject(Friend.FriendSprite(x=2762 + xpos, y=73,width=77,height=77,angle='0',restitution=0.2,static='false',friction=0.1,density=6 , firstframe ='sprocket.png',sheet='6' ).setName('wheel3'))
    lb.addObject(Joints.RevoluteJoint(body1='wheel3',body2='spaceship',motor_speed='500',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
    lb.addObject(Beam.BeamSprite(x=2682 + xpos, y=88,width=360,height=159,angle='0' ,restitution=0.1,static='false',friction=0,density=3 , firstframe ='spaceship.png', classname='SpaceshipSprite' ,sheet='6').setName('spaceship'))
    lb.addObject(Contacts.Contact(body1='spaceship',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='spaceship',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Enemy.EnemySprite(x=0, y=0,width=32,height=32,angle='0',restitution=0.5,static='false',friction=0.5,density=20, firstframe='slingerball.png', classname='SpaceshipBombSprite' ,spawnEvent='onSpaceshipShoot',sheet='6'))