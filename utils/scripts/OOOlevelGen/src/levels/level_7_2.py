import LevelBuilderfrom sprites import *def render(name,bg):	lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)	lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))	lb.addObject(Hero.HeroSprite(x=34, y=48,width=42,height=74))	lb.addObject(Teleporter.TeleporterSprite( level_id='leveldata/level_7_3'))	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=20,y=250,width=100,height=500,zoom_fact=1.0))	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=185,y=320-60,width=128,height=100,zoom_fact=0.1666))	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=350,y=250,width=100,height=500,zoom_fact=1.0))	lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=185, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))	lb.addObject(Enemy.EnemySprite(x=2168, y=234,width=89,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Beam.BeamSprite(x=2129, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=2213, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Enemy.EnemySprite(x=2376, y=234,width=89,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Beam.BeamSprite(x=2336, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=2420, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=2566, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=2650, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Crate.CrateSprite(x=2165,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=2378,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=2614,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Enemy.EnemySprite(x=1492, y=234,width=89,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Beam.BeamSprite(x=1452, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1536, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Enemy.EnemySprite(x=1700, y=234,width=89,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Beam.BeamSprite(x=1660, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1744, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1890, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1974, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Crate.CrateSprite(x=1489,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1701,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1937,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Enemy.EnemySprite(x=804, y=234,width=89,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Beam.BeamSprite(x=764, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=848, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Enemy.EnemySprite(x=1012, y=234,width=89,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Beam.BeamSprite(x=972, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1056, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1202, y=95,width=192,height=48,angle='75' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Beam.BeamSprite(x=1286, y=95,width=192,height=48,angle='105' ,restitution=0.2,static='true',friction=0.5,density=20  ,classname='Destructable').setName('dBeam'))	lb.addObject(Crate.CrateSprite(x=801,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1013,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1249,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Enemy.EnemySprite(x=1927, y=230,width=88,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='LoveAlienSprite',firstframe='lovable_alien.png'))	lb.addObject(Enemy.EnemySprite(x=1243, y=230,width=88,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='LoveAlienSprite',firstframe='lovable_alien.png'))	lb.addObject(Enemy.EnemySprite(x=2606, y=230,width=88,height=88,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='LoveAlienSprite',firstframe='lovable_alien.png'))	lb.addObject(Pickup.PickupSprite(x=2050,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Pickup.PickupSprite(x=1363,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Pickup.PickupSprite(x=297,y=21,width=32, height=32, static='false',angle=0))	lb.render()