import LevelBuilder
from sprites import *
from sprite_templates import *

def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background="NO")
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    lb.addObject(Enemy.EnemySprite(x=1500, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/menu'))
    #----robocod--------------------------------------------------
    RoboCod.create(lb,0)
    
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
        
    lb.render()