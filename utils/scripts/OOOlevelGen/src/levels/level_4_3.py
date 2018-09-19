import LevelBuilder
from sprites import *
from sprite_templates import *

def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=43, y=55,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    
    PumpkinBomber.create(lb,500)
    
    lb.addObject(Crate.CrateSprite(x=359,y=106,width=32, height=32, static='false',angle=0))
    lb.addObject(Beam.BeamSprite(x=618, y=144,width=276,height=128,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable', firstframe ='brittle_brick.png' ))
    lb.addObject(Beam.BeamSprite(x=1555, y=144,width=276,height=128,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable', firstframe ='brittle_brick.png' ))
    lb.addObject(Beam.BeamSprite(x=820, y=216,width=276,height=128,angle='0' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable', firstframe ='brittle_brick.png' ).setName('dBeam'))
    lb.addObject(Beam.BeamSprite(x=1022, y=144,width=276,height=128,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable', firstframe ='brittle_brick.png' ))
    lb.addObject(Beam.BeamSprite(x=1158, y=144,width=276,height=128,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable', firstframe ='brittle_brick.png' ))
    lb.addObject(Crate.CrateSprite(x=279,y=136,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=387,y=168,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=375,y=90,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1357,y=74,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1439,y=124,width=32, height=32, static='false',angle=0))
    lb.addObject(Enemy.EnemySprite(x=2170, y=33,width=33,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Crate.CrateSprite(x=1315,y=136,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2842,y=204,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2842,y=148,width=32, height=32, static='false',angle=0))
    
    lb.addObject(Teleporter.TeleporterSprite( level_id='leveldata/menu'))
    
    lb.render()