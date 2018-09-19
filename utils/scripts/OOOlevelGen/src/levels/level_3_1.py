import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background="NO",scrollmode=2)
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    
    lb.addObject(Beam.BeamSprite(x=1682, y=109,width=64,height=218,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable'))
    lb.addObject(Beam.BeamSprite(x=1816, y=250,width=64,height=348,angle='-90' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable'))
    lb.addObject(Friend.FriendSprite(x=1945, y=298,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Friend.FriendSprite(x=1725, y=298,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Friend.FriendSprite(x=1760, y=298,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Friend.FriendSprite(x=1801, y=298,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Friend.FriendSprite(x=1851, y=299,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Friend.FriendSprite(x=1487, y=34,width=62,height=62,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Beam.BeamSprite(x=1467, y=77,width=360,height=22,angle='0' ,restitution=0.2,static='false',friction=0.5,density=1 ).setName('Beam'))
    lb.addObject(Enemy.EnemySprite(x=1748, y=22,width=33,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=1783, y=71,width=33,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=1861, y=128,width=33,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Beam.BeamSprite(x=1956, y=109,width=64,height=218,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable'))
    lb.addObject(Beam.BeamSprite(x=1247, y=101,width=64,height=204,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable'))
    lb.addObject(Beam.BeamSprite(x=1180, y=101,width=64,height=204,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable'))
    lb.addObject(Beam.BeamSprite(x=1112, y=101,width=64,height=204,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5  ,classname='Destructable'))
    lb.addObject(Crate.CrateSprite(x=1891,y=302,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1340,y=20,width=32, height=32, static='false',angle=0))
    lb.addObject(Enemy.EnemySprite(x=2461, y=106,width=59,height=58,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Friend.FriendSprite(x=1246, y=241,width=62,height=62,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , firstframe ='boulder.png'))
    lb.addObject(Beam.BeamSprite(x=1600, y=1,width=44,height=50,angle='-45' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Crate.CrateSprite(x=2801,y=288,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2801,y=232,width=32, height=32, static='false',angle=0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=361,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=526,y=320-60,width=128,height=100,zoom_fact=0.16666))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=691,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=526, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_3_2'))
    lb.render()