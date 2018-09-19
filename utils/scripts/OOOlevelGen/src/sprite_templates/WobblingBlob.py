import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
<!-- BEGIN Monster construction -->

<sprite shape="circ" type="Enemy.EnemySprite" x="340" y="189" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="WobblingBlob_eyeball.png" setName="WobblingBlob_1" classname="WobblingBlobLimb" spritedata="WobblingBlob"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="340" y="190" width="122" height="122" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="WobblingBlob_eyelid.png" setName="WobblingBlob_0" classname="WobblingBlobBrain" spritedata="WobblingBlob"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="260" y="78" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="15" sheet="6" firstframe="WobblingBlob_wheel.png" setName="WobblingBlob_2" classname="WobblingBlobLimb" spritedata="WobblingBlob"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="419" y="77" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="15" sheet="6" firstframe="WobblingBlob_wheel.png" setName="WobblingBlob_3" classname="WobblingBlobLimb" spritedata="WobblingBlob"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="WobblingBlob_1" body2="WobblingBlob_0" motor_speed="-5.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="291" by="179" b2_Xoffset="-49" b2_Yoffset="-11" ax="333" ay="188" b1_Xoffset="-7" b1_Yoffset="-1"/>
<sprite type="Joints.DistanceJoint" id="5" body1="WobblingBlob_1" body2="WobblingBlob_2" damping="0.2" freq="30" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="-29" b1_Yoffset="-2" b2_Xoffset="-1" b2_Yoffset="1" bx="259" by="79" ax="311" ay="187"/>
<sprite type="Joints.DistanceJoint" id="6" body1="WobblingBlob_3" body2="WobblingBlob_1" damping="0.2" freq="30" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="27" b2_Yoffset="-1" bx="367" by="188" ax="419" ay="77"/>
<sprite type="Joints.DistanceJoint" id="7" body1="WobblingBlob_2" body2="WobblingBlob_0" damping="0.2" freq="5" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="-54" b2_Yoffset="0" bx="286" by="190" ax="261" ay="79"/>
<sprite type="Joints.DistanceJoint" id="8" body1="WobblingBlob_2" body2="WobblingBlob_0" damping="0.2" freq="5" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="1" b2_Xoffset="-2" b2_Yoffset="-52" bx="338" by="138" ax="260" ay="79"/>
<sprite type="Joints.DistanceJoint" id="9" body1="WobblingBlob_3" body2="WobblingBlob_0" damping="0.2" freq="5" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="0" b2_Xoffset="52" b2_Yoffset="0" bx="392" by="190" ax="420" ay="77"/>
<sprite type="Joints.DistanceJoint" id="10" body1="WobblingBlob_3" body2="WobblingBlob_0" damping="0.2" freq="5" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="-1" b2_Xoffset="-3" b2_Yoffset="-53" bx="337" by="137" ax="420" ay="76"/>
<sprite type="Joints.DistanceJoint" id="11" body1="WobblingBlob_3" body2="WobblingBlob_2" damping="0.2" freq="10" texture_type="image" texture="WobblingBlob_joint.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="-1" b2_Xoffset="0" b2_Yoffset="1" bx="260" by="79" ax="420" ay="76"/>
<!-- END Monster construction -->

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    