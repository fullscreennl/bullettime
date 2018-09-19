import MonsterBuilder
from sprites import *

def create(lb,xpos):
    xml = """
    <level>
		
<!-- BEGIN Monster construction -->

<sprite shape="rect" type="Enemy.EnemySprite" x="115" y="19" width="46" height="24" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="AcceledCaterpillar3" sheet="6" firstframe="caterpillar_body.png" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="1"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="145" y="19" width="46" height="24" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="AcceledCaterpillar5" sheet="6" firstframe="caterpillar_body.png" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>

<sprite shape="circ" type="Enemy.EnemySprite" x="100" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.7" density="3" sheet="6" firstframe="caterpillar_head.png" setName="AcceledCaterpillar1" classname="AcceledCaterpillarBrain" spritedata="AcceledCaterpillar" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="130" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.7" density="5" sheet="6" firstframe="caterpillar_body.png" setName="AcceledCaterpillar2" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>


<sprite type="Joints.RevoluteJoint" id="6" body1="AcceledCaterpillar1" body2="AcceledCaterpillar3" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="104" by="16" b2_Xoffset="-11" b2_Yoffset="-3" ax="100" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="AcceledCaterpillar2" body2="AcceledCaterpillar3" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="110" by="16" b2_Xoffset="-5" b2_Yoffset="-3" ax="130" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="175" y="19" width="46" height="24" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="AcceledCaterpillar6" sheet="6" firstframe="caterpillar_body.png" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>

<!-- schakel -->
<sprite shape="circ" type="Enemy.EnemySprite" x="160" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="3" sheet="6" firstframe="caterpillar_body.png" setName="AcceledCaterpillar4" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>
<!--connection joint -->
<sprite type="Joints.RevoluteJoint" id="8" body1="AcceledCaterpillar3" body2="AcceledCaterpillar5" motor_speed="0.0" torque="0.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="110" by="16" b2_Xoffset="-35" b2_Yoffset="-3" ax="130" ay="19" b1_Xoffset="15" b1_Yoffset="0"/>
<!--wheel joint -->
<sprite type="Joints.RevoluteJoint" id="9" body1="AcceledCaterpillar4" body2="AcceledCaterpillar5" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="140" by="16" b2_Xoffset="-5" b2_Yoffset="-3" ax="160" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>


<sprite shape="rect" type="Enemy.EnemySprite" x="205" y="19" width="46" height="24" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="AcceledCaterpillar8" sheet="6" firstframe="caterpillar_body.png" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>

<!-- schakel -->
<sprite shape="circ" type="Enemy.EnemySprite" x="190" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.7" density="3" sheet="6" firstframe="caterpillar_body.png" setName="AcceledCaterpillar7" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>
<!--connection joint -->
<sprite type="Joints.RevoluteJoint" id="10" body1="AcceledCaterpillar5" body2="AcceledCaterpillar6" motor_speed="0.0" torque="0.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="140" by="16" b2_Xoffset="-35" b2_Yoffset="-3" ax="170" ay="19" b1_Xoffset="15" b1_Yoffset="0"/>
<!--wheel joint -->
<sprite type="Joints.RevoluteJoint" id="11" body1="AcceledCaterpillar7" body2="AcceledCaterpillar6" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="170" by="16" b2_Xoffset="-5" b2_Yoffset="-3" ax="190" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="235" y="19" width="46" height="24" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="AcceledCaterpillar10" sheet="6" firstframe="caterpillar_body.png" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>

<!-- schakel -->
<sprite shape="circ" type="Enemy.EnemySprite" x="220" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.7" density="3" sheet="6" firstframe="caterpillar_body.png" setName="AcceledCaterpillar9" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>
<!--connection joint -->
<sprite type="Joints.RevoluteJoint" id="12" body1="AcceledCaterpillar6" body2="AcceledCaterpillar8" motor_speed="0.0" torque="0.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="170" by="16" b2_Xoffset="-35" b2_Yoffset="-3" ax="200" ay="19" b1_Xoffset="15" b1_Yoffset="0"/>
<!--wheel joint -->
<sprite type="Joints.RevoluteJoint" id="13" body1="AcceledCaterpillar9" body2="AcceledCaterpillar8" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="200" by="16" b2_Xoffset="-5" b2_Yoffset="-3" ax="220" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="265" y="19" width="46" height="24" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="AcceledCaterpillar12" sheet="6" firstframe="caterpillar_body.png" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>

<!-- schakel -->
<sprite shape="circ" type="Enemy.EnemySprite" x="250" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.7" density="3" sheet="6" firstframe="caterpillar_body.png" setName="AcceledCaterpillar11" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>
<!--connection joint -->
<sprite type="Joints.RevoluteJoint" id="13" body1="AcceledCaterpillar8" body2="AcceledCaterpillar10" motor_speed="0.0" torque="0.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="200" by="16" b2_Xoffset="-35" b2_Yoffset="-3" ax="230" ay="19" b1_Xoffset="15" b1_Yoffset="0"/>
<!--wheel joint -->
<sprite type="Joints.RevoluteJoint" id="14" body1="AcceledCaterpillar11" body2="AcceledCaterpillar10" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="230" by="16" b2_Xoffset="-5" b2_Yoffset="-3" ax="250" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>


<!-- schakel -->
<sprite shape="circ" type="Enemy.EnemySprite" x="280" y="19" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.7" density="3" sheet="6" firstframe="caterpillar_body.png" setName="AcceledCaterpillar13" classname="AcceledCaterpillarLimb" spritedata="AcceledCaterpillar" groupIndex="-1"/>
<!--connection joint -->
<sprite type="Joints.RevoluteJoint" id="15" body1="AcceledCaterpillar10" body2="AcceledCaterpillar12" motor_speed="0.0" torque="0.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="230" by="16" b2_Xoffset="-35" b2_Yoffset="-3" ax="260" ay="19" b1_Xoffset="15" b1_Yoffset="0"/>
<!--wheel joint -->
<sprite type="Joints.RevoluteJoint" id="16" body1="AcceledCaterpillar13" body2="AcceledCaterpillar12" motor_speed="-5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="260" by="16" b2_Xoffset="-5" b2_Yoffset="-3" ax="280" ay="19" b1_Xoffset="0" b1_Yoffset="0"/>

<!-- END Monster construction -->

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    
