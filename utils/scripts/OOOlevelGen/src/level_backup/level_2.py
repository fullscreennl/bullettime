import LevelBuilder
from sprites import *
def render(name,bg):

	lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
	lb.addObject(Hero.HeroSprite(x=16, y=200,width=32,height=32))
	
	
	lb.addObject(Crate.CrateSprite(x=1325,y=146,width=32, height=32, static='false',angle=0))
	lb.addObject(Crate.CrateSprite(x=1522,y=34,width=32, height=32, static='false',angle=0))
	lb.addObject(Crate.CrateSprite(x=1411,y=19,width=32, height=32, static='false',angle=0))
	lb.addObject(Crate.CrateSprite(x=1586,y=45,width=32, height=32, static='false',angle=0))
	
	lb.addObject(Beam.BeamSprite(x=164, y=150,width=300,height=14,angle='90',restitution=0.2,static='false',friction=0.5,density=20 ).setName('Beam'))
	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=164,y=160,width=50,height=320,zoom_fact=0.2))
	
	lb.addObject(Beam.BeamSprite(x=500, y=7,width=127,height=14,angle='22',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=500,y=160,width=100,height=320,zoom_fact=0.8))
	
	#lb.addObject(Alert.Alert(x=1000,y=160,width=100,height=320,msg='WTF, Look out!!#Robocop is up Next!#Beat him or die!#Good luck ;-('))
	
	
	lb.addObject(Beam.BeamSprite(x=2200, y=7, width=127, height=14,angle='-22',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
	#lb.addObject(Beam.BeamSprite(x=1500, y=60, width=2000, height=34,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('Beam'))
	
	lb.addObject(Enemy.EnemySprite(x=2000, y=127,width=100,height=100,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ))
	lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot' ))
	
	
	
		
	offset=100
	xoffset=1500	
	lb.addObject(Enemy.EnemySprite(x=373+xoffset, y=127+offset,width=84,height=84,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ,firstframe='robocod_body.png').setName('Body'))	lb.addObject(Enemy.EnemySprite(x=373+xoffset, y=190+offset,width=84,height=84,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ).setName('Head'))	lb.addObject(Enemy.EnemySprite(x=404+xoffset, y=62+offset,width=24,height=24,angle='0',restitution=0.2,static='false',friction=0.5,density=2 ,firstframe='robocod_body.png').setName('rightKnee'))	lb.addObject(Enemy.EnemySprite(x=343+xoffset, y=62+offset,width=24,height=24,angle='0',restitution=0.2,static='false',friction=0.5,density=2 ,firstframe='robocod_body.png').setName('leftKnee'))	lb.addObject(Enemy.EnemySprite(x=340+xoffset, y=24+offset,width=48,height=48,angle='0',restitution=0.2,static='false',friction=0.5,density=25 ,firstframe='robocod_foot.png').setName('leftFoot'))	lb.addObject(Enemy.EnemySprite(x=406+xoffset, y=24+offset,width=48,height=48,angle='0',restitution=0.2,static='false',friction=0.5,density=25 ,firstframe='robocod_foot.png').setName('rightFoot'))
		lb.addObject(Friend.FriendSprite(x=373+xoffset, y=170+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('bodyOrbiter'))	lb.addObject(Friend.FriendSprite(x=373+xoffset, y=207+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('headOrbiter'))	lb.addObject(Joints.RevoluteJoint(body1='Head',body2='headOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))	lb.addObject(Friend.FriendSprite(x=404+xoffset, y=76+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('rightKneeOrbiter'))	lb.addObject(Joints.RevoluteJoint(body1='rightKnee',body2='rightKneeOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))	lb.addObject(Friend.FriendSprite(x=343+xoffset, y=76+offset,width=2,height=2,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('leftKneeOrbiter'))	
	lb.addObject(Joints.RevoluteJoint(body1='leftKnee',body2='leftKneeOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
		lb.addObject(Joints.DistanceJoint(body1='Head',body2='Body',damping='0.2',freq='2' , texture_type='image',texture = 'robocod_link.png', texture_width=25))	lb.addObject(Joints.DistanceJoint(body1='leftKnee',body2='Body',damping='0.2',freq='2' , texture_type='image',texture = 'robocod_link.png', texture_width=25))	lb.addObject(Joints.DistanceJoint(body1='rightKnee',body2='Body',damping='0.2',freq='2' , texture_type='image',texture = 'robocod_link.png', texture_width=25))	lb.addObject(Joints.DistanceJoint(body1='leftKnee',body2='leftFoot',damping='0.2',freq='4' , texture_type='image',texture = 'robocod_link.png', texture_width=25))	lb.addObject(Joints.DistanceJoint(body1='rightKnee',body2='rightFoot',damping='0.2',freq='4' , texture_type='image',texture = 'robocod_link.png', texture_width=25))	
	lb.addObject(Joints.RevoluteJoint(body1='Body',body2='bodyOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
		lb.addObject(Contacts.Contact(body1='leftFoot',body2='Hero',event_name='onDamage'))	lb.addObject(Contacts.Contact(body1='rightFoot',body2='Hero',event_name='onDamage'))	lb.addObject(Contacts.Contact(body1='rightKnee',body2='Hero',event_name='onDamage'))	lb.addObject(Contacts.Contact(body1='leftKnee',body2='Hero',event_name='onDamage'))
		lb.addObject(Contacts.Contact(body1='Body',body2='Hero',event_name='onDamage'))	lb.addObject(Contacts.Contact(body1='Head',body2='Hero',event_name='onDamage'))	lb.addObject(Contacts.Contact(body1='leftFoot',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='rightFoot',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='rightKnee',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='leftKnee',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='Body',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='Head',body2='lbullet',event_name='onBulletHit'))
	lb.addObject(Contacts.Contact(body1='leftFoot',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='rightFoot',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='rightKnee',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='leftKnee',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='Body',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='Head',body2='rbullet',event_name='onBulletHit'))
	
	
	#----------------------ball slinger------------------------------------------------	lb.addObject(Beam.BeamSprite(x=1497, y=68,width=49,height=21,angle='0' ,restitution=0.2,static='false',friction=0.5,density=2 , firstframe ='robot_upperarm.png' ).setName('upperarmleft'))	lb.addObject(Beam.BeamSprite(x=1453, y=68,width=61,height=19,angle='0' ,restitution=0.2,static='false',friction=0.5,density=1 , firstframe ='robot_lowerarm.png' ).setName('lowerarmleft'))	lb.addObject(Beam.BeamSprite(x=1616, y=70,width=49,height=23,angle='-180' ,restitution=0.2,static='false',friction=0.5,density=2 , firstframe ='robot_upperarm.png' ).setName('upperarmright'))	lb.addObject(Beam.BeamSprite(x=1658, y=70,width=55,height=16,angle='-180' ,restitution=0.2,static='false',friction=0.5,density=1 , firstframe ='robot_lowerarm.png' ).setName('lowerarmright'))	lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='lowerarmleft',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '18' ))	lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='lowerarmright',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-18' ))	lb.addObject(Beam.BeamSprite(x=1556, y=106,width=84,height=117,angle='0' ,restitution=0.2,static='false',friction=0.5,density=20 , firstframe ='robot_body.png' ,classname='RobotSprite').setName('mainbody'))	lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-27' , b2_Yoffset = '-35' ))	lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '27' , b2_Yoffset = '-35' ))	lb.addObject(Enemy.EnemySprite(x=1412, y=70,width=30,height=30,angle='0',restitution=0.2,static='false',friction=0.5,density=2 , classname='SlingerBallSprite',firstframe='slingerball.png').setName('left_blob'))	lb.addObject(Enemy.EnemySprite(x=1777, y=70,width=30,height=30,angle='0',restitution=0.2,static='false',friction=0.5,density=2 , classname='SlingerBallSprite',firstframe='slingerball.png').setName('right_blob'))	lb.addObject(Joints.DistanceJoint(body1='left_blob',body2='lowerarmleft',damping='0.2',freq='4' , b2_Xoffset = '-18' ))	lb.addObject(Joints.DistanceJoint(body1='right_blob',body2='lowerarmright',damping='0.2',freq='5' , b2_Xoffset = '18' ))	lb.addObject(Friend.FriendSprite(x=1590, y=47,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0,density=20 , firstframe ='roboto_wheel.png' ).setName('rightwheel'))	lb.addObject(Friend.FriendSprite(x=1523, y=47,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 , firstframe ='roboto_wheel.png' ).setName('leftwheel'))	lb.addObject(Joints.RevoluteJoint(body1='rightwheel',body2='mainbody',motor_speed='-5',enable_motor='false',torque='1000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))	lb.addObject(Joints.RevoluteJoint(body1='leftwheel',body2='mainbody',motor_speed='-1',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))	
	

	#---------------events-------------------------
	lb.addObject(Contacts.Contact(body1='left_blob',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='left_blob',body2='rbullet',event_name='onBulletHit'))
	lb.addObject(Contacts.Contact(body1='right_blob',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='right_blob',body2='rbullet',event_name='onBulletHit'))	
		
	lb.addObject(Contacts.Contact(body1='left_blob',body2='Hero',event_name='onDamage'))
	lb.addObject(Contacts.Contact(body1='right_blob',body2='Hero',event_name='onDamage'))
			#----------------end ball slinger-----------------------------------
	lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_3'))
	lb.render()
