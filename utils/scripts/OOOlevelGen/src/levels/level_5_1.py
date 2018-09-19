import LevelBuilder
from sprites import *
def render(name,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background="NO")
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300-130-100,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300,y=25,width=250,height=50,zoom_fact=3.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=300+130+100,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(Visual.VisualSprite(x=300, y=25,width=250,height=50,firstframe='sign.png',msg='Psst! Remember,#aim for the fireballs. >>'))
    
    lb.addObject(Enemy.EnemySprite(x=1500, y=150,width=199,height=199,angle='0',restitution=0.2,static='false',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_5_2'))
    lb.render()