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
	lb.addObject(Enemy.EnemySprite(x=373+xoffset, y=127+offset,width=84,height=84,angle='0',restitution=0.2,static='false',friction=0.5,density=1 ,firstframe='robocod_body.png').setName('Body'))
	
	lb.addObject(Joints.RevoluteJoint(body1='leftKnee',body2='leftKneeOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
	
	lb.addObject(Joints.RevoluteJoint(body1='Body',body2='bodyOrbiter',motor_speed='5000',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',enable_limit='false',collide_connected='false'))
	
	
	lb.addObject(Contacts.Contact(body1='leftFoot',body2='rbullet',event_name='onBulletHit'))
	
	
	#----------------------ball slinger------------------------------------------------
	

	#---------------events-------------------------
	lb.addObject(Contacts.Contact(body1='left_blob',body2='lbullet',event_name='onBulletHit'))
	lb.addObject(Contacts.Contact(body1='right_blob',body2='lbullet',event_name='onBulletHit'))
		
	lb.addObject(Contacts.Contact(body1='left_blob',body2='Hero',event_name='onDamage'))
	lb.addObject(Contacts.Contact(body1='right_blob',body2='Hero',event_name='onDamage'))
	
	lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_3'))
	lb.render()