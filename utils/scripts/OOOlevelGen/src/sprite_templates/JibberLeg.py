import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>

<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="265" y="196" width="184" height="143" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="JibberLeg8" sheet="6" firstframe="JibberLeg_body.png" classname="JibberLegLimb" spritedata="JibberLeg"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="188" y="12" width="105" height="25" angle="0" restitution="0.2" static="false" friction="0.5" density="50" setName="JibberLeg0" sheet="6" firstframe="JibberLeg_left_foot.png" classname="JibberLegLimb" spritedata="JibberLeg"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="337" y="12" width="113" height="25" angle="0" restitution="0.2" static="false" friction="0.5" density="50" setName="JibberLeg1" sheet="6" firstframe="JibberLeg_right_foot.png" classname="JibberLegLimb" spritedata="JibberLeg"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="218" y="139" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="2" sheet="6" firstframe="JibberLeg_body.png" setName="JibberLeg2" classname="JibberLegLimb" spritedata="JibberLeg"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="312" y="140" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="2" sheet="6" firstframe="JibberLeg_body.png" setName="JibberLeg3" classname="JibberLegLimb" spritedata="JibberLeg"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="262" y="292" width="137" height="137" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="JibberLeg_head.png" setName="JibberLeg14" classname="JibberLegBrain" spritedata="JibberLeg"/>
<sprite type="Joints.DistanceJoint" id="4" body1="JibberLeg2" body2="JibberLeg0" damping="0.2" freq="30" texture_type="image" texture="JibberLeg_joint.png" texture_width="40" b1_Xoffset="-12" b1_Yoffset="0" b2_Xoffset="39" b2_Yoffset="1" bx="227" by="13" ax="206" ay="139"/>
<sprite type="Joints.DistanceJoint" id="5" body1="JibberLeg0" body2="JibberLeg2" damping="0.5" freq="10" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="3" bx="218" by="142" ax="189" ay="13"/>
<sprite type="Joints.DistanceJoint" id="6" body1="JibberLeg1" body2="JibberLeg3" damping="0.5" freq="10" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="1" b2_Xoffset="-1" b2_Yoffset="3" bx="311" by="143" ax="335" ay="13"/>
<sprite type="Joints.DistanceJoint" id="7" body1="JibberLeg1" body2="JibberLeg3" damping="0.2" freq="30" texture_type="image" texture="JibberLeg_joint.png" texture_width="40" b1_Xoffset="-40" b1_Yoffset="0" b2_Xoffset="15" b2_Yoffset="1" bx="327" by="141" ax="297" ay="12"/>
<sprite type="Joints.RevoluteJoint" id="9" body1="JibberLeg2" body2="JibberLeg8" motor_speed="50.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="198" by="197" b2_Xoffset="-67" b2_Yoffset="1" ax="218" ay="139" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="10" body1="JibberLeg3" body2="JibberLeg8" motor_speed="50.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="325" by="196" b2_Xoffset="60" b2_Yoffset="0" ax="311" ay="143" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.DistanceJoint" id="12" body1="JibberLeg1" body2="JibberLeg0" damping="0.2" freq="10" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="1" b2_Xoffset="1" b2_Yoffset="1" bx="189" by="13" ax="335" ay="13"/>
<sprite type="Joints.DistanceJoint" id="13" body1="JibberLeg1" body2="JibberLeg2" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="0" bx="218" by="139" ax="335" ay="13"/>
<sprite type="Joints.DistanceJoint" id="15" body1="JibberLeg14" body2="JibberLeg8" damping="0.5" freq="1" texture_type="image" texture="JibberLeg_joint.png" texture_width="60" b1_Xoffset="0" b1_Yoffset="-30" b2_Xoffset="-3" b2_Yoffset="23" bx="262" by="219" ax="262" ay="262"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    