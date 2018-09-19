import LevelBuilder
from sprites import *
def render(name,bg):
    
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    #lb.addObject(Beam.BeamSprite(x=(480*6)/2, y=75,width=150,height=26,angle='90' ,restitution=0.5,static='true',friction=0.1,density=100 ))
    lb.addObject(Beam.BeamSprite(x=(480*6)/2, y=175,width=50,height=50,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    lb.addObject(Beam.BeamSprite(x=(480*6)/2, y=75,width=150,height=26,angle='90' ,restitution=0.5,static='true',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    
    lb.addObject(Beam.BeamSprite(x=(480*6)/4, y=175,width=50,height=50,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    lb.addObject(Beam.BeamSprite(x=(480*6)/4, y=75,width=150,height=26,angle='90' ,restitution=0.5,static='true',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    
    lb.addObject(Beam.BeamSprite(x=(480*6)/3, y=175,width=50,height=50,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    lb.addObject(Beam.BeamSprite(x=(480*6)/3, y=75,width=150,height=26,angle='90' ,restitution=0.5,static='true',friction=0.1,density=100 ,classname='Destructable').setName("DBeam"))
    
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    
    lb.render()