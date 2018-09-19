import LevelBuilder
from sprites import *
def render(name,bg):
    
    
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    
    
    lb.addObject(Enemy.EnemySprite(firstframe='monster_head.png', x=717, y=269,width=56,height=56,angle='0',restitution=0.2,static='false',friction=0.5,density=5, classname='MonsterHeadSprite' ).setName('bluehead'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x=605, y=84,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('leftknee'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x=828, y=83,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ).setName('rightknee'))
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_7_3'))
   
    lb.addObject(Beam.BeamSprite(x=795, y=13,width=48,height=26,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 ,spritedata = 'BlueMonsterDestructed', firstframe ='monster_foot.png' ,classname='InternalEventBusSprite').setName('rightfoot'))
    lb.addObject(Beam.BeamSprite(x=648, y=13,width=48,height=26,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 ,spritedata = 'BlueMonsterDestructed', firstframe ='monster_foot.png' ,classname='InternalEventBusSprite').setName('leftfoot'))
    
    lb.addObject(Beam.BeamSprite(x=300, y=100,width=200,height=26,angle='90' ,restitution=0.5,static='true',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x=716, y=170,width=148,height=148,angle='0',restitution=0.2,static='false',friction=0.5,density=10 ).setName('bluebody'))
    
    lb.addObject(Joints.DistanceJoint(body1='rightknee',body2='rightfoot',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='leftknee',body2='leftfoot',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='leftknee',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='rightknee',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='bluehead',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    
    lb.addObject(Joints.DistanceJoint(body1='leftfoot',body2='bluebody',damping='0.2',freq='2' ,texture_type='blank'))
    lb.addObject(Joints.DistanceJoint(body1='rightfoot',body2='bluebody',damping='0.2',freq='2' ,texture_type='blank'))
    lb.addObject(Joints.DistanceJoint(body1='rightfoot',body2='leftfoot',damping='0.2',freq='2' ,texture_type='blank'))
    
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    
    lb.render()