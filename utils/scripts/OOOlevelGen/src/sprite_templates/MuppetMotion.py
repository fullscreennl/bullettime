import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>

<!-- BEGIN Monster construction -->
<!--
<sprite shape="circ" type="Enemy.EnemySprite" x="200" y="150" width="200" height="200" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="muppetmotion_body.png" setName="MuppetMotion1" classname="MuppetMotionBrain" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="100" y="150" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MuppetMotion0" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="300" y="150" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MuppetMotion3" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="200" y="250" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MuppetMotion4" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="200" y="50" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MuppetMotion5" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite type="Joints.RevoluteJoint" id="2" body1="MuppetMotion0" body2="MuppetMotion1" motor_speed="-50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="152" by="99" b2_Xoffset="-48" b2_Yoffset="-51" ax="100" ay="150" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="6" body1="MuppetMotion4" body2="MuppetMotion1" motor_speed="-50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="160" by="164" b2_Xoffset="-40" b2_Yoffset="14" ax="200" ay="250" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="MuppetMotion3" body2="MuppetMotion1" motor_speed="50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="215" by="183" b2_Xoffset="15" b2_Yoffset="33" ax="300" ay="150" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="MuppetMotion5" body2="MuppetMotion1" motor_speed="-50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="230" by="125" b2_Xoffset="30" b2_Yoffset="-25" ax="200" ay="50" b1_Xoffset="0" b1_Yoffset="0"/>
-->
<!-- END Monster construction -->

<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="200" y="150" width="232" height="232" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="muppetmotion_body.png" setName="MuppetMotion1" classname="MuppetMotionBrain" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="100" y="150" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="2" setName="MuppetMotion0" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="300" y="150" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="2" setName="MuppetMotion3" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="200" y="250" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="2" setName="MuppetMotion4" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="200" y="50" width="30" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="2" setName="MuppetMotion5" sheet="6" firstframe="muppetmotion_propeller.png" classname="MuppetMotionLimb" spritedata="MuppetMotion" groupIndex="1"/>
<sprite type="Joints.RevoluteJoint" id="2" body1="MuppetMotion0" body2="MuppetMotion1" motor_speed="-50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="152" by="99" b2_Xoffset="-48" b2_Yoffset="-51" ax="100" ay="150" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="6" body1="MuppetMotion4" body2="MuppetMotion1" motor_speed="-50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="160" by="164" b2_Xoffset="-40" b2_Yoffset="14" ax="200" ay="250" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="MuppetMotion3" body2="MuppetMotion1" motor_speed="50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="215" by="183" b2_Xoffset="15" b2_Yoffset="33" ax="300" ay="150" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="MuppetMotion5" body2="MuppetMotion1" motor_speed="-50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="230" by="125" b2_Xoffset="30" b2_Yoffset="-25" ax="200" ay="50" b1_Xoffset="0" b1_Yoffset="0"/>
<!-- END Monster construction -->




    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    