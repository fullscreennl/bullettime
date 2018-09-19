'''
Created on Dec 21, 2010

@author: johantenbroeke
'''
from sprites import *

def create(lb,xpos):
    lb.addObject(PumpkinBomber.PumpkinBomberSprite(x=xpos, y=54))
    lb.addObject(Enemy.EnemySprite(x=0, y=0,width=24,height=24,angle='0',restitution=0.5,static='false',friction=0.5,density=2,spawnEvent='onPumpkinBomberShoot',classname='PumpkinSprite',firstframe='pumpkin.png' ))
    lb.addObject(Contacts.Contact(body1='beamPumpkinBomber',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='beamPumpkinBomber',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='Hero',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='rbullet',event_name='onBulletHit'))