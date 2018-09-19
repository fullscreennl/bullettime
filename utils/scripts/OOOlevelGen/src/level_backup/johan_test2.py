import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    
    lb.addObject(Hero.HeroSprite(x=55, y=36,width=42,height=74))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x=2324, y=57,width=115,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=7,classname='MonsterHeadSprite' ).setName('edge_2'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x=2462, y=57,width=115,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=7 ).setName('edge_3'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_head.png', x=2393, y=166,width=115,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=2 ).setName('edge_1'))
    lb.addObject(Joints.DistanceJoint(body1='edge_1',body2='edge_2',damping='0.2',freq='1' ,texture_type='image',texture = 'monster_leg.png', texture_width=128))
    lb.addObject(Joints.DistanceJoint(body1='edge_1',body2='edge_3',damping='0.2',freq='1' ,texture_type='image',texture = 'monster_leg.png', texture_width=128))
    lb.addObject(Joints.DistanceJoint(body1='edge_2',body2='edge_3',damping='0.2',freq='1' ,texture_type='image',texture = 'monster_leg.png', texture_width=128))
    
    lb.addObject(Enemy.EnemySprite(x=2639, y=17,width=33,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 , classname='BlobSprite',firstframe='monsterblob.png').setName('small_blob'))
    lb.addObject(Joints.DistanceJoint(body1='edge_2',body2='small_blob',damping='0.2',freq='5' ))
    
    lb.addObject(Teleporter.TeleporterSprite( level_id='undefined'))
    
    lb.render()