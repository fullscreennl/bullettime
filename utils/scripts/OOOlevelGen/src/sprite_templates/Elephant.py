import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>

<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="181" y="38" width="65" height="82" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Elephant3" sheet="6" firstframe="elephant_leg.png" classname="ElephantLimb" spritedata="Elephant"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="280" y="138" width="264" height="149" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Elephant0" sheet="6" firstframe="elephant_body.png" classname="ElephantBrain" spritedata="Elephant"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="331" y="66" width="137" height="137" angle="0" restitution="0.2" static="false" friction="0.5" density="10" sheet="6" firstframe="elephant_wheel.png" setName="Elephant1" classname="ElephantLimb" spritedata="Elephant"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="116" y="181" width="155" height="155" angle="0" restitution="0.2" static="false" friction="0.5" density="2" sheet="6" firstframe="elephant_head.png" setName="Elephant2" classname="ElephantLimb" spritedata="Elephant"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="69" y="126" width="55" height="55" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="elephant_trunk1.png" setName="Elephant4" classname="ElephantLimb" spritedata="Elephant"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="67" y="78" width="39" height="39" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="elephant_trunk2.png" setName="Elephant5" classname="ElephantLimb" spritedata="Elephant"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="66" y="35" width="33" height="33" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="elephant_trunk3.png" setName="Elephant6" classname="ElephantBrain" spritedata="Elephant"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="92" y="104" width="69" height="51" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Elephant8" sheet="6" firstframe="elephant_teeth.png" classname="ElephantLimb" spritedata="Tester"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="Elephant1" body2="Elephant0" motor_speed="-2.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="354" by="180" b2_Xoffset="74" b2_Yoffset="42" ax="331" ay="66" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="9" body1="Elephant2" body2="Elephant0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="268" by="186" b2_Xoffset="-12" b2_Yoffset="48" ax="159" ay="177" b1_Xoffset="43" b1_Yoffset="-4"/>
<sprite type="Joints.DistanceJoint" id="10" body1="Elephant0" body2="Elephant2" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="94" b1_Yoffset="50" b2_Xoffset="14" b2_Yoffset="48" bx="130" by="229" ax="374" ay="188"/>
<sprite type="Joints.DistanceJoint" id="11" body1="Elephant3" body2="Elephant0" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-17" b1_Yoffset="17" b2_Xoffset="-120" b2_Yoffset="-41" bx="160" by="97" ax="164" ay="55"/>
<sprite type="Joints.DistanceJoint" id="12" body1="Elephant3" body2="Elephant0" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="13" b1_Yoffset="20" b2_Xoffset="-71" b2_Yoffset="-39" bx="209" by="99" ax="194" ay="58"/>
<sprite type="Joints.DistanceJoint" id="13" body1="Elephant4" body2="Elephant2" damping="0.2" freq="30" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="5" b1_Yoffset="14" b2_Xoffset="-36" b2_Yoffset="-48" bx="80" by="133" ax="74" ay="140"/>
<sprite type="Joints.DistanceJoint" id="14" body1="Elephant5" body2="Elephant4" damping="0.2" freq="30" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-3" b1_Yoffset="5" b2_Xoffset="-4" b2_Yoffset="-16" bx="65" by="110" ax="64" ay="83"/>
<sprite type="Joints.DistanceJoint" id="15" body1="Elephant6" body2="Elephant5" damping="0.2" freq="30" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="6" b2_Xoffset="-3" b2_Yoffset="-11" bx="64" by="67" ax="66" ay="41"/>
<sprite type="Joints.DistanceJoint" id="16" body1="Elephant0" body2="Elephant3" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-72" b1_Yoffset="-36" b2_Xoffset="-15" b2_Yoffset="18" bx="166" by="56" ax="208" ay="102"/>
<sprite type="Joints.DistanceJoint" id="1" body1="Elephant8" body2="Elephant2" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="28" b1_Yoffset="20" b2_Xoffset="26" b2_Yoffset="-47" bx="142" by="134" ax="120" ay="124"/>
<sprite type="Joints.DistanceJoint" id="2" body1="Elephant8" body2="Elephant2" damping="0.8" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="20" b2_Xoffset="-9" b2_Yoffset="-48" bx="107" by="133" ax="90" ay="124"/>
<sprite type="Joints.DistanceJoint" id="3" body1="Elephant5" body2="Elephant8" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-15" b1_Yoffset="-7" b2_Xoffset="-10" b2_Yoffset="-11" bx="82" by="93" ax="52" ay="71"/>
<sprite type="Joints.DistanceJoint" id="4" body1="Elephant8" body2="Elephant4" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="18" b2_Xoffset="18" b2_Yoffset="-1" bx="87" by="125" ax="91" ay="122"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    