import LevelBuilder
from sprites import *
def render(name,bg):
    # HERO AND SOME PICKUPS
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=16, y=16,width=32,height=32))      
    lb.addObject(Crate.CrateSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Crate.CrateSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(Pickup.PickupSprite(x=500,y=100,width=32, height=32, static='false',angle=45))
    lb.addObject(BulletTimePickup.BulletTimePickupSprite(x=500,y=200,width=32, height=32, static='false',angle=0))
    #################################################################################################
    lb.addObject(Enemy.EnemySprite(x=1500, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Enemy.EnemySprite(x=1845, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    ##################################################################################################
    #BULLETS WATCHTOWER TELEPORTER#
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300-115-50,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300,y=320-60,width=128,height=100,zoom_fact=0.16666))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300+115+50,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=300, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot' ))
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_4_3'))
    lb.render()