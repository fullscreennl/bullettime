import LevelBuilder
from sprites import *
def render(name,bg):

    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.addObject(Hero.HeroSprite(x=6*480 - 50, y=16,width=32,height=32))
    #lb.addObject(Beam.BeamSprite(x=400, y=75,width=32,height=100,angle=0,static='true',spawnEvent='onCreateMenuBlock'))
    #lb.addObject(Visual.VisualSprite(x=300, y=25,width=250,height=50,firstframe='sign.png',msg='createMenuSign',classname='EventAwakeningVisualSprite'))	
    for mb in range(33):
        lb.addObject(MenuButton.MenuButtonSprite(x=(mb*80)+100,level_id=mb+33))
    lb.addObject(MenuSwitch.goMenu3(x=480*6,y=250))
    lb.addObject(MenuSwitch.goMenu1(x=0,y=250))
    lb.render()
