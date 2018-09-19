import MonsterBuilder
from sprites import *

def create(lb,xpos):
    xml = """
    <level>


<!-- BEGIN Monster construction -->
<!--
<sprite shape="rect" type="Enemy.EnemySprite" x="209" y="40" width="40" height="39" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Catapult10" sheet="6" firstframe="Catapult_wheelstud.png" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="392" y="41" width="38" height="35" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Catapult9" sheet="6" firstframe="Catapult_wheelstud.png" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="207" y="28" width="57" height="57" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="Catapult_wheel.png" setName="Catapult0" classname="CatapultLimb" spritedata="Catapult"  groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="390" y="28" width="57" height="57" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="Catapult_wheel.png" setName="Catapult1" classname="CatapultLimb" spritedata="Catapult"  groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="300" y="70" width="264" height="21" angle="0" restitution="0.2" static="false" friction="0.5" density="50" setName="Catapult2" sheet="6" firstframe="Catapult_base.png" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="251" y="136" width="80" height="99" angle="0" restitution="0.2" static="false" friction="0.5" density="500" setName="Catapult3" sheet="6" firstframe="Catapult_subframe.png" classname="CatapultLimb" spritedata="Catapult"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="317" y="198" width="333" height="16" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Catapult6" sheet="6" firstframe="Catapult_lever.png" classname="CatapultBrain" spritedata="Catapult"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="171" y="118" width="61" height="61" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="Catapult_drivewheel.png" setName="Catapult8" classname="CatapultLimb" spritedata="Catapult"/>


<sprite type="Joints.RevoluteJoint" id="4" body1="Catapult0" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="188" by="72" b2_Xoffset="-112" b2_Yoffset="2" ax="206" ay="27" b1_Xoffset="-1" b1_Yoffset="-1"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="Catapult1" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="357" by="68" b2_Xoffset="57" b2_Yoffset="-2" ax="389" ay="27" b1_Xoffset="-1" b1_Yoffset="-1"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="Catapult6" body2="Catapult3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="226" by="127" b2_Xoffset="-25" b2_Yoffset="-9" ax="219" ay="200" b1_Xoffset="-98" b1_Yoffset="2"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Catapult8" body2="Catapult6" damping="0.2" freq="10" texture_type="image" texture="rect.png" texture_width="5" b1_Xoffset="-1" b1_Yoffset="22" b2_Xoffset="-147" b2_Yoffset="-1" bx="170" by="197" ax="170" ay="140"/>
<sprite type="Joints.RevoluteJoint" id="10" body1="Catapult8" body2="Catapult3" motor_speed="10.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="236" by="109" b2_Xoffset="-15" b2_Yoffset="-27" ax="172" ay="121" b1_Xoffset="1" b1_Yoffset="3"/>

<sprite type="Joints.DistanceJoint" id="1" body1="Catapult10" body2="Catapult2" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="11" b1_Yoffset="3" b2_Xoffset="-55" b2_Yoffset="-1" bx="245" by="69" ax="220" ay="43"/>
<sprite type="Joints.DistanceJoint" id="2" body1="Catapult10" body2="Catapult2" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-13" b1_Yoffset="2" b2_Xoffset="-125" b2_Yoffset="-2" bx="175" by="68" ax="196" ay="42"/>
<sprite type="Joints.DistanceJoint" id="4" body1="Catapult9" body2="Catapult2" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-15" b1_Yoffset="13" b2_Xoffset="40" b2_Yoffset="-1" bx="340" by="69" ax="377" ay="54"/>
<sprite type="Joints.DistanceJoint" id="5" body1="Catapult9" body2="Catapult2" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="13" b1_Yoffset="13" b2_Xoffset="119" b2_Yoffset="1" bx="419" by="71" ax="405" ay="54"/>
-->
<!-- END Monster construction -->


<!-- BEGIN Monster construction -->

<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="394" y="50" width="38" height="35" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Catapult9" sheet="6" firstframe="Catapult_wheelstud.png" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="206" y="45" width="40" height="39" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Catapult10" sheet="6" firstframe="Catapult_wheelstud.png" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="390" y="28" width="57" height="57" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="Catapult_wheel.png" setName="Catapult1" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="207" y="28" width="57" height="57" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="Catapult_wheel.png" setName="Catapult0" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="300" y="70" width="264" height="21" angle="0" restitution="0.2" static="false" friction="0.5" density="50" setName="Catapult2" sheet="6" firstframe="Catapult_base.png" classname="CatapultLimb" spritedata="Catapult" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="251" y="136" width="80" height="99" angle="0" restitution="0.2" static="false" friction="0.5" density="500" setName="Catapult3" sheet="6" firstframe="Catapult_subframe.png" classname="CatapultLimb" spritedata="Catapult"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="317" y="198" width="333" height="16" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Catapult6" sheet="6" firstframe="Catapult_lever.png" classname="CatapultBrain" spritedata="Catapult"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="171" y="118" width="61" height="61" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="Catapult_drivewheel.png" setName="Catapult8" classname="CatapultLimb" spritedata="Catapult"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="Catapult0" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="188" by="72" b2_Xoffset="-112" b2_Yoffset="2" ax="206" ay="27" b1_Xoffset="-1" b1_Yoffset="-1"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="Catapult1" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="357" by="68" b2_Xoffset="57" b2_Yoffset="-2" ax="389" ay="27" b1_Xoffset="-1" b1_Yoffset="-1"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="Catapult6" body2="Catapult3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="226" by="127" b2_Xoffset="-25" b2_Yoffset="-9" ax="219" ay="200" b1_Xoffset="-98" b1_Yoffset="2"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Catapult8" body2="Catapult6" damping="0.2" freq="10" texture_type="image" texture="rect.png" texture_width="5" b1_Xoffset="-1" b1_Yoffset="22" b2_Xoffset="-147" b2_Yoffset="-1" bx="170" by="197" ax="170" ay="140"/>
<sprite type="Joints.RevoluteJoint" id="10" body1="Catapult8" body2="Catapult3" motor_speed="10.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="236" by="109" b2_Xoffset="-15" b2_Yoffset="-27" ax="172" ay="121" b1_Xoffset="1" b1_Yoffset="3"/>
<sprite type="Joints.RevoluteJoint" id="0" body1="Catapult10" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="256" by="70" b2_Xoffset="-44" b2_Yoffset="0" ax="217" ay="60" b1_Xoffset="11" b1_Yoffset="15"/>
<sprite type="Joints.RevoluteJoint" id="1" body1="Catapult10" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="174" by="70" b2_Xoffset="-126" b2_Yoffset="0" ax="191" ay="59" b1_Xoffset="-15" b1_Yoffset="14"/>
<sprite type="Joints.RevoluteJoint" id="2" body1="Catapult9" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="420" by="73" b2_Xoffset="120" b2_Yoffset="3" ax="408" ay="64" b1_Xoffset="14" b1_Yoffset="14"/>
<sprite type="Joints.RevoluteJoint" id="3" body1="Catapult9" body2="Catapult2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="370" by="70" b2_Xoffset="70" b2_Yoffset="0" ax="380" ay="63" b1_Xoffset="-14" b1_Yoffset="13"/>
<!-- END Monster construction -->
<!-- END Monster construction -->



    </level>
    """
    idprefix = MonsterBuilder.createFromXMLString(lb,xpos,xml)
    newSpritename = str(idprefix + 'Catapult3')
    lb.addObject(Enemy.EnemySprite(x=(400+xpos), y=107,width=48,height=48,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob1'))
    lb.addObject(Joints.DistanceJoint(body1=newSpritename, body2='blob1', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='32',b1_Yoffset='-29',b2_Xoffset='-22',b2_Yoffset='-8'))
    
    lb.addObject(Enemy.EnemySprite(x=0, y=0,width=50,height=50,angle='0',restitution=0.8,static='false',friction=0.5,density=2,spawnEvent='onPumpkinBomberShoot',classname='PumpkinSprite',firstframe='pumpkin.png' ))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2=':body',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2=':head',event_name='onDamage'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='lbullet',event_name='onBulletHit'))
    lb.addObject(Contacts.Contact(body1='EnemyBullet',body2='rbullet',event_name='onBulletHit'))