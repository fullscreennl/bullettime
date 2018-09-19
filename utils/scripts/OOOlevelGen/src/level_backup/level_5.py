import LevelBuilder
from sprites import *
def render(name,bg):
    # HERO AND SOME PICKUPS
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=16, y=16,width=32,height=32))    
    lb.addObject(Crate.CrateSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Pickup.PickupSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=500,y=200,width=32, height=32, static='false',angle=0))
    #################################################################################################
    lb.addObject(Beam.BeamSprite(x=1172, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Beam.BeamSprite(x=1303, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Beam.BeamSprite(x=1424, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Beam.BeamSprite(x=1041, y=63,width=127,height=14,angle='90' ,restitution=0.2,static='true',friction=0.5,density=20 ).setName('Beam'))
    lb.addObject(Pickup.PickupSprite(x=1075,y=21,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=1075,y=73,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=1121,y=21,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=1121,y=69,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1205,y=21,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1259,y=21,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1259,y=67,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=1205,y=66,width=32, height=32, static='false',angle=0))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=1274,y=-114,width=32, height=32, static='false',angle=0))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=1252,y=-63,width=32, height=32, static='false',angle=0))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=1298,y=-58,width=32, height=32, static='false',angle=0))
    #lb.addObject(Enemy.EnemySprite(x=1719, y=117,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    #lb.addObject(Enemy.EnemySprite(x=1991, y=122,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=1845, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    #lb.addObject(Friend.FriendSprite(x=1237, y=187,width=167,height=167,angle='0',restitution=0.2,static='false',friction=0.5,density=5))
    lb.addObject(EnemyEquipedRotor.EnemyEquipedRotorSprite(x=736,y=140,scaling=1.75,speed=3000,torque=3))

    ##################################################################################################
    #BULLETS WATCHTOWER TELEPORTER#
    #lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300-115-50,y=160,width=100,height=320,zoom_fact=1.0))
    #lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300,y=320-60,width=128,height=100,zoom_fact=0.15))
    #lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300+115+50,y=160,width=100,height=320,zoom_fact=1.0))
    #lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=300, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300-130-100,y=160,width=100,height=320,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300,y=25,width=250,height=50,zoom_fact=3.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300+130+100,y=160,width=100,height=320,zoom_fact=1.0))
    lb.addObject(Visual.VisualSprite(x=300, y=25,width=250,height=50,firstframe='sign.png',msg='End of the World party#67 miles >>>'))
    
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot' ))
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_2'))
    lb.render()