import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background="NO")
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    lb.addObject(Enemy.EnemySprite(x=1500, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    
    watchtower_xpos = 200
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=watchtower_xpos,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=165+watchtower_xpos,y=320-60,width=128,height=100,zoom_fact=0.1666))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=330+watchtower_xpos,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=165+watchtower_xpos, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/menu'))
    
    lb.addObject(Crate.CrateSprite(x=2798-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2759-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2717-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2674-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2638-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2599-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2570-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2609-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2647-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2684-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2720-50,y=260,width=32, height=32, static='false',angle=0))
    
    #----------------------ball slinger------------------------------------------------    lb.addObject(Beam.BeamSprite(x=1497, y=68,width=49,height=21,angle='0' ,restitution=0.2,static='false',friction=0.5,density=2 , firstframe ='robot_upperarm.png' ).setName('upperarmleft'))    lb.addObject(Beam.BeamSprite(x=1453, y=68,width=61,height=19,angle='0' ,restitution=0.2,static='false',friction=0.5,density=1 , firstframe ='robot_lowerarm.png' ).setName('lowerarmleft'))    lb.addObject(Beam.BeamSprite(x=1616, y=70,width=49,height=23,angle='-180' ,restitution=0.2,static='false',friction=0.5,density=2 , firstframe ='robot_upperarm.png' ).setName('upperarmright'))    lb.addObject(Beam.BeamSprite(x=1658, y=70,width=55,height=16,angle='-180' ,restitution=0.2,static='false',friction=0.5,density=1 , firstframe ='robot_lowerarm.png' ).setName('lowerarmright'))    lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='lowerarmleft',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '18' ))    lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='lowerarmright',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-18' ))    lb.addObject(Beam.BeamSprite(x=1556, y=106,width=84,height=117,angle='0' ,restitution=0.2,static='false',friction=0.5,density=20 , firstframe ='robot_body.png' ,classname='RobotSprite').setName('mainbody'))    lb.addObject(Joints.DistanceJoint(body1='upperarmleft',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '18' , b2_Xoffset = '-27' , b2_Yoffset = '-35' ))    lb.addObject(Joints.DistanceJoint(body1='upperarmright',body2='mainbody',damping='0.2',freq='25' , b1_Xoffset = '-18' , b2_Xoffset = '27' , b2_Yoffset = '-35' ))    lb.addObject(Enemy.EnemySprite(x=1412, y=70,width=30,height=30,angle='0',restitution=0.2,static='false',friction=0.5,density=2 , classname='SlingerBallSprite',firstframe='slingerball.png').setName('left_blob'))    lb.addObject(Enemy.EnemySprite(x=1777, y=70,width=30,height=30,angle='0',restitution=0.2,static='false',friction=0.5,density=2 , classname='SlingerBallSprite',firstframe='slingerball.png').setName('right_blob'))    lb.addObject(Joints.DistanceJoint(body1='left_blob',body2='lowerarmleft',damping='0.2',freq='4' , b2_Xoffset = '-18' ))    lb.addObject(Joints.DistanceJoint(body1='right_blob',body2='lowerarmright',damping='0.2',freq='5' , b2_Xoffset = '18' ))    lb.addObject(Friend.FriendSprite(x=1590, y=47,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0,density=20 , firstframe ='roboto_wheel.png' ).setName('rightwheel'))    lb.addObject(Friend.FriendSprite(x=1523, y=47,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 , firstframe ='roboto_wheel.png' ).setName('leftwheel'))    lb.addObject(Joints.RevoluteJoint(body1='rightwheel',body2='mainbody',motor_speed='-5',enable_motor='false',torque='1000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))    lb.addObject(Joints.RevoluteJoint(body1='leftwheel',body2='mainbody',motor_speed='-1',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
    
    #---------------events-------------------------
    lb.addObject(Contacts.Contact(body1='left_blob',body2='lbullet',event_name='onBulletHit'))    lb.addObject(Contacts.Contact(body1='left_blob',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='right_blob',body2='lbullet',event_name='onBulletHit'))    lb.addObject(Contacts.Contact(body1='right_blob',body2='rbullet',event_name='onBulletHit'))    
        
    lb.addObject(Contacts.Contact(body1='left_blob',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='right_blob',body2='Hero',event_name='onDamage'))
    lb.render()