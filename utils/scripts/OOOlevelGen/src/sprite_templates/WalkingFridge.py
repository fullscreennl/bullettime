import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="340" y="190" width="122" height="122" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_0" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="340" y="189" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_1" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="260" y="78" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="15" sheet="6" firstframe="circ.png" setName="WalkingPigTail_2" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="419" y="77" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="15" sheet="6" firstframe="circ.png" setName="WalkingPigTail_3" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="339" y="294" width="25" height="25" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_4" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="337" y="188" width="42" height="42" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_7" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="365" y="322" width="17" height="17" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_6" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="380" y="358" width="18" height="18" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_8" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="392" y="420" width="10" height="10" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="WalkingPigTail_9" classname="WalkingPigTailLimb" spritedata="WalkingPigTail"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="WalkingPigTail_1" body2="WalkingPigTail_0" motor_speed="-5.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="291" by="179" b2_Xoffset="-49" b2_Yoffset="-11" ax="333" ay="188" b1_Xoffset="-7" b1_Yoffset="-1"/>
<sprite type="Joints.DistanceJoint" id="5" body1="WalkingPigTail_1" body2="WalkingPigTail_2" damping="0.2" freq="30" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-29" b1_Yoffset="-2" b2_Xoffset="-1" b2_Yoffset="1" bx="259" by="79" ax="311" ay="187"/>
<sprite type="Joints.DistanceJoint" id="6" body1="WalkingPigTail_3" body2="WalkingPigTail_1" damping="0.2" freq="30" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="27" b2_Yoffset="-1" bx="367" by="188" ax="419" ay="77"/>
<sprite type="Joints.DistanceJoint" id="7" body1="WalkingPigTail_2" body2="WalkingPigTail_0" damping="0.2" freq="5" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="-54" b2_Yoffset="0" bx="286" by="190" ax="261" ay="79"/>
<sprite type="Joints.DistanceJoint" id="8" body1="WalkingPigTail_2" body2="WalkingPigTail_0" damping="0.2" freq="5" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="1" b2_Xoffset="48" b2_Yoffset="-26" bx="388" by="164" ax="260" ay="79"/>
<sprite type="Joints.DistanceJoint" id="9" body1="WalkingPigTail_3" body2="WalkingPigTail_0" damping="0.2" freq="5" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="0" b2_Xoffset="53" b2_Yoffset="0" bx="393" by="190" ax="420" ay="77"/>
<sprite type="Joints.DistanceJoint" id="10" body1="WalkingPigTail_3" body2="WalkingPigTail_0" damping="0.2" freq="5" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="-1" b2_Xoffset="-47" b2_Yoffset="-31" bx="293" by="159" ax="420" ay="76"/>
<sprite type="Joints.DistanceJoint" id="1" body1="WalkingPigTail_0" body2="WalkingPigTail_4" damping="0.2" freq="5" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-49" b1_Yoffset="30" b2_Xoffset="-1" b2_Yoffset="2" bx="338" by="296" ax="291" ay="220"/>
<sprite type="Joints.DistanceJoint" id="2" body1="WalkingPigTail_0" body2="WalkingPigTail_4" damping="0.2" freq="5" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="50" b1_Yoffset="31" b2_Xoffset="-1" b2_Yoffset="-1" bx="338" by="293" ax="390" ay="221"/>
<sprite type="Joints.DistanceJoint" id="3" body1="WalkingPigTail_4" body2="WalkingPigTail_7" damping="0.2" freq="30" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="0" b2_Xoffset="-7" b2_Yoffset="4" bx="330" by="192" ax="340" ay="294"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="WalkingPigTail_7" body2="WalkingPigTail_0" motor_speed="50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="366" by="234" b2_Xoffset="26" b2_Yoffset="44" ax="347" ay="187" b1_Xoffset="10" b1_Yoffset="-1"/>
<sprite type="Joints.DistanceJoint" id="9" body1="WalkingPigTail_6" body2="WalkingPigTail_4" damping="0.2" freq="10" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="0" b2_Yoffset="1" bx="339" by="295" ax="365" ay="322"/>
<sprite type="Joints.DistanceJoint" id="10" body1="WalkingPigTail_8" body2="WalkingPigTail_6" damping="0.2" freq="10" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="0" b2_Xoffset="-1" b2_Yoffset="0" bx="364" by="322" ax="381" ay="358"/>
<sprite type="Joints.DistanceJoint" id="11" body1="WalkingPigTail_9" body2="WalkingPigTail_8" damping="0.2" freq="10" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="-1" b2_Xoffset="0" b2_Yoffset="-1" bx="380" by="357" ax="393" ay="419"/>
<!-- END Monster construction -->



    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    