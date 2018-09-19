import LevelBuilderfrom sprites import *def render(name,bg):	lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)	lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))	lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_2'))	lb.addObject(Hero.HeroSprite(x=51, y=260,width=32,height=32))	lb.addObject(Enemy.EnemySprite(x=871, y=107,width=208,height=208,angle='0',restitution=0.2,static='false',friction=0.5,density=20 , spawnframe = 100).setName('Enemy'))	lb.addObject(Friend.FriendSprite(x=532, y=44,width=89,height=89,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1505, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Bomb.BombSprite(x=1304, y=17,width=32,height=32 ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1425, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1465, y=133,width=127,height=14,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1505, y=204,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1425, y=203,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1257, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1463, y=174,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(SpikeyBuddy.SpikeyBuddySprite(x=688, y=21,width=40,height=40,restitution=0.2,static='false',friction=0.5,density=20 ).setName('Spikey'))	lb.addObject(Enemy.EnemySprite(x=348, y=25,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1963, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Bomb.BombSprite(x=1702, y=17,width=32,height=32 ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1753, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1852, y=133,width=301,height=14,angle='0' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1903, y=204,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1823, y=203,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=1655, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1861, y=174,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=57,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=25,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=90,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=125,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=160,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=196,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=231,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=2334, y=275,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=58,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=26,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=91,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=126,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=160,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=196,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=232,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Enemy.EnemySprite(x=1091, y=276,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))	lb.addObject(Beam.BeamSprite(x=185, y=7,width=80,height=60,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))	lb.addObject(Beam.BeamSprite(x=237, y=0,width=80,height=60,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))	lb.addObject(Beam.BeamSprite(x=268, y=72,width=80,height=60,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))	lb.addObject(Beam.BeamSprite(x=425, y=-7,width=80,height=60,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))	lb.addObject(Beam.BeamSprite(x=659, y=313,width=80,height=60,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))	lb.addObject(Beam.BeamSprite(x=2419, y=329,width=80,height=60,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))	lb.addObject(PumpkinBomber.PumpkinBomberSprite(x=2138, y=57))	lb.addObject(Enemy.EnemySprite(x=0, y=0,width=24,height=24,angle='0',restitution=0.5,static='false',friction=0.5,density=2,spawnEvent='onPumpkinBomberShoot',classname='PumpkinSprite',firstframe='pumpkin.png' ))	lb.addObject(Contacts.Contact(body1='beamPumpkinBomber',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='beamPumpkinBomber',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='Hero',event_name='onDamage'))	lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='lbullet',event_name='onBulletHit'))	lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='rbullet',event_name='onBulletHit'))	lb.addObject(Enemy.EnemySprite(x=408, y=61,width=56,height=56,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(Pickup.PickupSprite(x=286,y=39,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1464,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1464,y=55,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1464,y=88,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1788,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1788,y=55,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1788,y=88,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1824,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1824,y=55,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1824,y=88,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1862,y=21,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1862,y=55,width=32, height=32, static='false',angle=0))	lb.addObject(Crate.CrateSprite(x=1862,y=88,width=32, height=32, static='false',angle=0))	lb.addObject(Pickup.PickupSprite(x=1907,y=22,width=32, height=32, static='false',angle=0))	lb.addObject(Pickup.PickupSprite(x=2523,y=24,width=32, height=32, static='false',angle=0))	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=63-115-50,y=160,width=100,height=320,zoom_fact=1.0))	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=63,y=320-60,width=128,height=100,zoom_fact=0.15))	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=63+115+50,y=160,width=100,height=320,zoom_fact=1.0))	lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=63, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))	lb.addObject(Enemy.EnemySprite(x=1614, y=11,width=21,height=21,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))	lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=1043,y=-117,width=32, height=32, static='false',angle=0))	lb.render()