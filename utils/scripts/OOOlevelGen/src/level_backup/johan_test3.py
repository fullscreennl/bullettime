import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    lb.addObject(Teleporter.TeleporterSprite( level_id='undefined'))
    lb.addObject(Hero.HeroSprite(x=99, y=184,width=42,height=74))
    lb.addObject(Beam.BeamSprite(x=1260, y=107,width=214,height=42,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Enemy.EnemySprite(x=1377, y=262,width=85,height=84,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=636, y=188,width=90,height=89,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=2849, y=133,width=33,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=2543, y=244,width=45,height=45,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=566, y=60,width=117,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Pickup.PickupSprite(x=1299,y=20,width=32, height=32, static='false',angle=0))
    lb.addObject(Beam.BeamSprite(x=1387, y=193,width=214,height=42,angle='0' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Beam.BeamSprite(x=1642, y=107,width=214,height=42,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Pickup.PickupSprite(x=1371,y=20,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1325,y=146,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1522,y=34,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1411,y=19,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1586,y=45,width=32, height=32, static='false',angle=0))
    lb.addObject(Enemy.EnemySprite(x=2474, y=98,width=122,height=121,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=311, y=79,width=34,height=33,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=1788, y=118,width=37,height=37,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=819, y=78,width=117,height=115,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Beam.BeamSprite(x=1845, y=193,width=362,height=42,angle='0' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Beam.BeamSprite(x=2632, y=107,width=214,height=42,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Beam.BeamSprite(x=2399, y=193,width=422,height=42,angle='0' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Crate.CrateSprite(x=1968,y=34,width=32, height=32, static='false',angle=0))
    lb.render()
