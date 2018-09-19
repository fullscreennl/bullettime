import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>

<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="331" y="81" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="steppingfucker_body.png" setName="SteppingFucker0" classname="SteppingFuckerBrain" spritedata="SteppingFucker" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="242" y="42" width="31" height="85" angle="0" restitution="0.2" static="false" friction="1.0" density="20" setName="SteppingFucker1" sheet="6" firstframe="steppingfucker_leftleg.png" classname="SteppingFuckerLimb" spritedata="SteppingFucker" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="420" y="41" width="31" height="86" angle="0" restitution="0.2" static="false" friction="1.0" density="20" setName="SteppingFucker2" sheet="6" firstframe="steppingfucker_rightleg.png" classname="SteppingFuckerLimb" spritedata="SteppingFucker" groupIndex="1"/>
<sprite type="Joints.RevoluteJoint" id="3" body1="SteppingFucker0" body2="SteppingFucker1" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="241" by="75" b2_Xoffset="-1" b2_Yoffset="33" ax="320" ay="81" b1_Xoffset="-11" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="SteppingFucker0" body2="SteppingFucker2" motor_speed="-15.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="421" by="77" b2_Xoffset="1" b2_Yoffset="36" ax="341" ay="81" b1_Xoffset="10" b1_Yoffset="0"/>
<sprite type="Joints.DistanceJoint" id="5" body1="SteppingFucker1" body2="SteppingFucker2" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="-29" b2_Xoffset="-1" b2_Yoffset="-29" bx="419" by="12" ax="243" ay="13"/>
<sprite type="Joints.DistanceJoint" id="6" body1="SteppingFucker1" body2="SteppingFucker0" damping="0.2" freq="1" texture_type="image" texture="steppingfucker_upperleg.png" texture_width="25" b1_Xoffset="-1" b1_Yoffset="33" b2_Xoffset="-1" b2_Yoffset="2" bx="330" by="83" ax="241" ay="75"/>
<sprite type="Joints.DistanceJoint" id="7" body1="SteppingFucker2" body2="SteppingFucker0" damping="0.2" freq="1" texture_type="image" texture="steppingfucker_upperleg.png" texture_width="25" b1_Xoffset="1" b1_Yoffset="36" b2_Xoffset="-2" b2_Yoffset="2" bx="329" by="83" ax="421" ay="77"/>
<!-- END Monster construction -->

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    