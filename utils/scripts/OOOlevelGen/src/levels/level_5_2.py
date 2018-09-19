import LevelBuilder
from sprite_templates import SlingerBall
from sprites import *

def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background="NO")
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    lb.addObject(Crate.CrateSprite(x=2192,y=86,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=479,y=28,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2284,y=162,width=32, height=32, static='false',angle=0))
    lb.addObject(Crate.CrateSprite(x=2364,y=106,width=32, height=32, static='false',angle=0))
    #----------------------ball slinger------------------------------------------------
    SlingerBall.create(lb,500)
    
    lb.addObject(Pickup.PickupSprite(x=1285,y=37,width=32, height=32, static='false',angle=0))
    lb.addObject(Pickup.PickupSprite(x=355,y=33,width=32, height=32, static='false',angle=0))
    
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_5_3'))
    lb.render()