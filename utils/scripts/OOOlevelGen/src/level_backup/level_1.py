import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=16, y=16,width=32,height=32))
    
    #lb.addObject(Beam.BeamSprite(x=164, y=19,width=127,height=14,angle='30',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    #lb.addObject(Enemy.EnemySprite(x=408, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=608, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=880, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=1128, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=1508, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=1700, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=1856, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Teleporter.TeleporterSprite(x=2769, y=120, level_id='leveldata/level_2'))
    #lb.addObject(Enemy.EnemySprite(x=2032, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=2221, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=2413, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=2605, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    #lb.addObject(Enemy.EnemySprite(x=2761, y=28,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 ))
    
    lb.addObject(Crate.CrateSprite(x=660,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Crate.CrateSprite(x=700,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Pickup.PickupSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Pickup.PickupSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Pickup.PickupSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Pickup.PickupSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=500,y=200,width=32, height=32, static='false',angle=0))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=800,y=200,width=32, height=32, static='false',angle=0))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=1500,y=200,width=32, height=32, static='false',angle=0))
    
    lb.addObject(Enemy.EnemySprite(x=500, y=200,width=128,height=128,angle='0',restitution=0.2,static='false',friction=0.5,density=5,classname='BlobSprite',firstframe='monsterblob.png' ))
    
    lb.addObject(Enemy.EnemySprite(x=500, y=200,width=128,height=128,angle='0',shape='rect',restitution=0.2,static='false',friction=0.5,density=5,classname='SquareBlobSprite',firstframe='square_monsterblob.png' ))
    lb.addObject(Enemy.EnemySprite(x=1000, y=200,width=60,height=80,angle='0',shape='rect',restitution=0.2,static='false',friction=0.5,density=20,classname='SquareBlobSprite',firstframe='square_monsterblob.png' ))
    
    
    """
    #lb.addObject(Enemy.EnemySprite(x=1000, y=200,width=140,height=140,angle='0',restitution=0.2,static='false',friction=0.5,density=3,classname='PumpkinBomberSprite',firstframe='pumpkin_bomber.png' ).setName('BomberSprite'))
    lb.addObject(PumpkinBomber.PumpkinBomberSprite(x=1000, y=200))
    lb.addObject(Enemy.EnemySprite(x=800, y=200,width=50,height=50,angle='0',restitution=0.2,static='false',friction=0.5,density=5,classname='BlobSprite',firstframe='monsterblob.png' ))
    #lb.addObject(Beam.BeamSprite(x=1344, y=118,width=546,height=14,angle='34',restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
   
    lb.addObject(Enemy.EnemySprite(x=0, y=0,width=32,height=32,angle='0',restitution=0.7,static='false',friction=0.5,density=1,spawnEvent='onPumpkinBomberShoot', classname='PumpkinSprite', firstframe='pumpkin.png' ))
    lb.addObject(Enemy.EnemySprite(x=1800, y=40,width=80,height=80,angle='0',restitution=0.7,static='false',friction=0.5,density=1, classname='PumpkinSprite', firstframe='pumpkin.png'))
    lb.addObject(Enemy.EnemySprite(x=1800, y=80,width=32,height=32,angle='0',restitution=0.7,static='false',friction=0.5,density=1, classname='PumpkinSprite', firstframe='pumpkin.png'))
    lb.addObject(Enemy.EnemySprite(x=1800, y=120,width=32,height=32,angle='0',restitution=0.7,static='false',friction=0.5,density=1, classname='PumpkinSprite', firstframe='pumpkin.png'))
    
    
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='beamPumpkinBomber',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='beamPumpkinBomber',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Teleporter.TeleporterSprite(x=2834, y=155, level_id='leveldata/level_2'))
    """
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300-115-50,y=160,width=100,height=320,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300,y=320-60,width=128,height=100,zoom_fact=0.15))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300+115+50,y=160,width=100,height=320,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=300, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot' ))
    
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_2'))
   
    lb.render()