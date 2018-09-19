import MonsterBuilder
from sprites import *

def create(lb,xpos):
    xml = """
    <level>


<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="231" y="185" width="139" height="139" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="BuggerBody.png" setName="Bugger0" classname="BuggerLimb" spritedata="Bugger"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="235" y="21" width="260" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Bugger1" sheet="6" firstframe="BuggerFeet.png" classname="BuggerBrain" spritedata="Bugger"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="188" y="293" width="41" height="41" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="BuggerEyeOpen.png" setName="Bugger2" classname="BuggerLimb" spritedata="Bugger"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="261" y="294" width="39" height="39" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="BuggerEyeClosed.png" setName="Bugger3" classname="BuggerLimb" spritedata="Bugger"/>
<sprite type="Joints.DistanceJoint" id="4" body1="Bugger1" body2="Bugger0" damping="0.2" freq="1" texture_type="image" texture="BuggerJoint.png" texture_width="20" b1_Xoffset="-94" b1_Yoffset="1" b2_Xoffset="56" b2_Yoffset="-7" bx="287" by="178" ax="141" ay="22"/>
<sprite type="Joints.DistanceJoint" id="5" body1="Bugger1" body2="Bugger0" damping="0.2" freq="1" texture_type="image" texture="BuggerJoint.png" texture_width="20" b1_Xoffset="81" b1_Yoffset="-2" b2_Xoffset="-59" b2_Yoffset="-7" bx="172" by="178" ax="316" ay="19"/>
<sprite type="Joints.DistanceJoint" id="6" body1="Bugger1" body2="Bugger0" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-94" b1_Yoffset="1" b2_Xoffset="-60" b2_Yoffset="-8" bx="171" by="177" ax="141" ay="22"/>
<sprite type="Joints.DistanceJoint" id="7" body1="Bugger1" body2="Bugger0" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="81" b1_Yoffset="-2" b2_Xoffset="57" b2_Yoffset="-7" bx="288" by="178" ax="316" ay="19"/>
<sprite type="Joints.DistanceJoint" id="8" body1="Bugger0" body2="Bugger2" damping="0.2" freq="1" texture_type="image" texture="BuggerJoint.png" texture_width="20" b1_Xoffset="-60" b1_Yoffset="-5" b2_Xoffset="0" b2_Yoffset="-1" bx="188" by="292" ax="171" ay="180"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Bugger0" body2="Bugger2" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="58" b1_Yoffset="-6" b2_Xoffset="-1" b2_Yoffset="-1" bx="187" by="292" ax="289" ay="179"/>
<sprite type="Joints.DistanceJoint" id="10" body1="Bugger0" body2="Bugger3" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-60" b1_Yoffset="-5" b2_Xoffset="-1" b2_Yoffset="1" bx="260" by="295" ax="171" ay="180"/>
<sprite type="Joints.DistanceJoint" id="11" body1="Bugger0" body2="Bugger3" damping="0.2" freq="1" texture_type="image" texture="BuggerJoint.png" texture_width="20" b1_Xoffset="57" b1_Yoffset="-7" b2_Xoffset="-1" b2_Yoffset="0" bx="260" by="294" ax="288" ay="178"/>
<!-- END Monster construction -->

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    lb.addObject(Enemy.EnemySprite(x=0, y=0,width=50,height=50,angle='0',restitution=0.8,static='false',friction=0.5,density=2,spawnEvent='onPumpkinBomberShoot',classname='PumpkinSprite',firstframe='pumpkin.png' ))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='rbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='Hero',event_name='onDamage'))