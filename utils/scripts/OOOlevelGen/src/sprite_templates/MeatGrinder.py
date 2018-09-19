import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>


<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="345" y="98" width="93" height="67" angle="8" restitution="0.2" static="false" friction="0.5" density="1" setName="MeatGrinder8" sheet="6" firstframe="MeatGrinder_bone.png" classname="MeatGrinderLimb" spritedata="MeatGrinder"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="149" y="96" width="76" height="64" angle="-9" restitution="0.2" static="false" friction="0.5" density="1" setName="MeatGrinder5" sheet="6" firstframe="MeatGrinder_bone.png" classname="MeatGrinderLimb" spritedata="MeatGrinder"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="96" y="109" width="94" height="83" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="MeatGrinder17" sheet="6" firstframe="MeatGrinder_circlesaw.png" classname="MeatGrinderLimb" spritedata="MeatGrinder"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="246" y="81" width="149" height="149" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="MeatGrinder_body.png" setName="MeatGrinder0" classname="MeatGrinderBrain" spritedata="MeatGrinder"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="199" y="7" width="25" height="25" angle="0" restitution="0.2" static="false" friction="0.5" density="500" sheet="6" firstframe="MeatGrinder_eyeball.png" setName="MeatGrinder1" classname="MeatGrinderLimb" spritedata="MeatGrinder"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="299" y="8" width="25" height="25" angle="0" restitution="0.2" static="false" friction="0.5" density="500" sheet="6" firstframe="MeatGrinder_eyeball.png" setName="MeatGrinder2" classname="MeatGrinderLimb" spritedata="MeatGrinder"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="388" y="103" width="81" height="77" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="MeatGrinder15" sheet="6" firstframe="MeatGrinder_circlesaw.png" classname="MeatGrinderLimb" spritedata="MeatGrinder"/>
<sprite type="Joints.RevoluteJoint" id="3" body1="MeatGrinder1" body2="MeatGrinder0" motor_speed="-10.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="230" by="72" b2_Xoffset="-16" b2_Yoffset="-9" ax="199" ay="7" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="MeatGrinder2" body2="MeatGrinder0" motor_speed="-10.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="271" by="70" b2_Xoffset="25" b2_Yoffset="-11" ax="299" ay="8" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.DistanceJoint" id="6" body1="MeatGrinder5" body2="MeatGrinder0" damping="0.7" freq="15" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-28" b1_Yoffset="18" b2_Xoffset="-34" b2_Yoffset="60" bx="212" by="141" ax="121" ay="114"/>
<sprite type="Joints.DistanceJoint" id="9" body1="MeatGrinder8" body2="MeatGrinder0" damping="0.7" freq="15" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="31" b1_Yoffset="22" b2_Xoffset="33" b2_Yoffset="59" bx="279" by="140" ax="376" ay="120"/>
<sprite type="Joints.RevoluteJoint" id="11" body1="MeatGrinder5" body2="MeatGrinder0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="255" by="100" b2_Xoffset="9" b2_Yoffset="19" ax="178" ay="93" b1_Xoffset="29" b1_Yoffset="-3"/>
<sprite type="Joints.RevoluteJoint" id="12" body1="MeatGrinder8" body2="MeatGrinder0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="257" by="81" b2_Xoffset="11" b2_Yoffset="0" ax="316" ay="93" b1_Xoffset="-29" b1_Yoffset="-5"/>
<sprite type="Joints.RevoluteJoint" id="14" body1="MeatGrinder17" body2="MeatGrinder5" motor_speed="15.0" torque="100.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="166" by="93" b2_Xoffset="17" b2_Yoffset="-3" ax="94" ay="111" b1_Xoffset="-2" b1_Yoffset="2"/>
<sprite type="Joints.RevoluteJoint" id="18" body1="MeatGrinder15" body2="MeatGrinder8" motor_speed="20.0" torque="100.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="338" by="100" b2_Xoffset="-7" b2_Yoffset="2" ax="387" ay="106" b1_Xoffset="-1" b1_Yoffset="3"/>
<sprite type="Joints.DistanceJoint" id="19" body1="MeatGrinder1" body2="MeatGrinder0" damping="0.2" freq="1" texture_type="image" texture="MeatGrinder_bone.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="-28" b2_Yoffset="-47" bx="218" by="34" ax="199" ay="7"/>
<sprite type="Joints.DistanceJoint" id="20" body1="MeatGrinder2" body2="MeatGrinder0" damping="0.2" freq="1" texture_type="image" texture="MeatGrinder_bone.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="30" b2_Yoffset="-51" bx="276" by="30" ax="299" ay="8"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    