import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background="NO")
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    lb.addObject(Enemy.EnemySprite(x=1500, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    
    watchtower_xpos = 200
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=watchtower_xpos,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=165+watchtower_xpos,y=320-60,width=128,height=100,zoom_fact=0.1666))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=330+watchtower_xpos,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=165+watchtower_xpos, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/menu'))
    
    lb.addObject(Crate.CrateSprite(x=2798-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2759-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2717-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2674-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2638-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2599-50,y=223,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2570-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2609-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2647-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2684-50,y=260,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=2720-50,y=260,width=32, height=32, static='false',angle=0))
    
    #----------------------ball slinger------------------------------------------------
    
    #---------------events-------------------------
    lb.addObject(Contacts.Contact(body1='left_blob',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='right_blob',body2='lbullet',event_name='onBulletHit'))
        
    lb.addObject(Contacts.Contact(body1='left_blob',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='right_blob',body2='Hero',event_name='onDamage'))
    lb.render()