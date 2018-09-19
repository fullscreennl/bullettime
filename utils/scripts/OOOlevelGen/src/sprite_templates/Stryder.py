import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>

<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="295" y="285" width="9" height="226" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Stryder4" sheet="6" firstframe="Stryder_Upperleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="326" y="285" width="9" height="224" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Stryder5" sheet="6" firstframe="Stryder_Upperleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="352" y="285" width="9" height="223" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Stryder6" sheet="6" firstframe="Stryder_Upperleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="295" y="116" width="12" height="231" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Stryder10" sheet="6" firstframe="Stryder_Lowerleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="327" y="116" width="12" height="233" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Stryder12" sheet="6" firstframe="Stryder_Lowerleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="353" y="117" width="12" height="231" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Stryder13" sheet="6" firstframe="Stryder_Lowerleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="311" y="283" width="10" height="226" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Stryder24" sheet="6" firstframe="Stryder_Upperleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="338" y="285" width="10" height="221" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Stryder25" sheet="6" firstframe="Stryder_Upperleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="311" y="115" width="12" height="232" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Stryder28" sheet="6" firstframe="Stryder_Lowerleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="339" y="117" width="11" height="232" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Stryder33" sheet="6" firstframe="Stryder_Lowerleg.png" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>

<sprite shape="circ" type="Enemy.EnemySprite" x="323" y="440" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="Stryder22" classname="StryderLimb" spritedata="Stryder" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="321" y="441" width="113" height="113" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="Stryder_body.png" setName="Stryder3" classname="StryderBrain" spritedata="Stryder" groupIndex="-1"/>

<sprite type="Joints.RevoluteJoint" id="7" body1="Stryder4" body2="Stryder3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="293" by="444" b2_Xoffset="-28" b2_Yoffset="3" ax="295" ay="356" b1_Xoffset="0" b1_Yoffset="71"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="Stryder5" body2="Stryder3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="303" by="446" b2_Xoffset="-18" b2_Yoffset="5" ax="326" ay="356" b1_Xoffset="0" b1_Yoffset="71"/>
<sprite type="Joints.RevoluteJoint" id="9" body1="Stryder6" body2="Stryder3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="350" by="453" b2_Xoffset="29" b2_Yoffset="12" ax="352" ay="356" b1_Xoffset="0" b1_Yoffset="71"/>
<sprite type="Joints.RevoluteJoint" id="11" body1="Stryder10" body2="Stryder4" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="294" by="242" b2_Xoffset="-1" b2_Yoffset="-43" ax="294" ay="201" b1_Xoffset="-1" b1_Yoffset="85"/>
<sprite type="Joints.RevoluteJoint" id="14" body1="Stryder12" body2="Stryder5" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="325" by="242" b2_Xoffset="-1" b2_Yoffset="-43" ax="326" ay="201" b1_Xoffset="-1" b1_Yoffset="85"/>
<sprite type="Joints.RevoluteJoint" id="15" body1="Stryder13" body2="Stryder6" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="352" by="244" b2_Xoffset="0" b2_Yoffset="-41" ax="352" ay="201" b1_Xoffset="-1" b1_Yoffset="84"/>
<sprite type="Joints.DistanceJoint" id="16" body1="Stryder4" body2="Stryder10" damping="0.2" freq="10" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="0" b1_Yoffset="38" b2_Xoffset="-1" b2_Yoffset="109" bx="294" by="225" ax="295" ay="323"/>
<sprite type="Joints.DistanceJoint" id="17" body1="Stryder5" body2="Stryder12" damping="0.2" freq="10" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="0" b1_Yoffset="40" b2_Xoffset="-1" b2_Yoffset="110" bx="326" by="226" ax="326" ay="325"/>
<sprite type="Joints.DistanceJoint" id="18" body1="Stryder6" body2="Stryder13" damping="0.2" freq="10" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="-1" b1_Yoffset="39" b2_Xoffset="0" b2_Yoffset="109" bx="353" by="226" ax="351" ay="324"/>
<sprite type="Joints.DistanceJoint" id="19" body1="Stryder22" body2="Stryder4" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="-9" b1_Yoffset="0" b2_Xoffset="-1" b2_Yoffset="110" bx="294" by="395" ax="314" ay="440"/>
<sprite type="Joints.DistanceJoint" id="20" body1="Stryder22" body2="Stryder6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="5" b1_Yoffset="1" b2_Xoffset="-1" b2_Yoffset="109" bx="351" by="394" ax="328" ay="441"/>
<sprite type="Joints.DistanceJoint" id="21" body1="Stryder5" body2="Stryder22" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="-2" b1_Yoffset="109" b2_Xoffset="1" b2_Yoffset="-9" bx="324" by="431" ax="324" ay="394"/>
<sprite type="Joints.RevoluteJoint" id="23" body1="Stryder22" body2="Stryder3" motor_speed="1.0" torque="20000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="273" by="441" b2_Xoffset="-48" b2_Yoffset="0" ax="323" ay="439" b1_Xoffset="0" b1_Yoffset="-1"/>
<sprite type="Joints.DistanceJoint" id="26" body1="Stryder22" body2="Stryder24" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="-7" b2_Xoffset="-2" b2_Yoffset="111" bx="309" by="394" ax="323" ay="433"/>
<sprite type="Joints.RevoluteJoint" id="27" body1="Stryder24" body2="Stryder3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="278" by="425" b2_Xoffset="-43" b2_Yoffset="-16" ax="309" ay="355" b1_Xoffset="-2" b1_Yoffset="72"/>
<sprite type="Joints.RevoluteJoint" id="29" body1="Stryder28" body2="Stryder24" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="310" by="242" b2_Xoffset="-1" b2_Yoffset="-41" ax="309" ay="201" b1_Xoffset="-2" b1_Yoffset="86"/>
<sprite type="Joints.DistanceJoint" id="30" body1="Stryder28" body2="Stryder24" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="-1" b1_Yoffset="110" b2_Xoffset="-2" b2_Yoffset="41" bx="309" by="324" ax="310" ay="225"/>
<sprite type="Joints.DistanceJoint" id="31" body1="Stryder25" body2="Stryder22" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="108" b2_Xoffset="1" b2_Yoffset="-8" bx="324" by="432" ax="338" ay="393"/>
<sprite type="Joints.RevoluteJoint" id="32" body1="Stryder25" body2="Stryder3" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="372" by="436" b2_Xoffset="51" b2_Yoffset="-5" ax="338" ay="356" b1_Xoffset="0" b1_Yoffset="71"/>
<sprite type="Joints.RevoluteJoint" id="34" body1="Stryder33" body2="Stryder25" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="339" by="243" b2_Xoffset="1" b2_Yoffset="-42" ax="337" ay="201" b1_Xoffset="-2" b1_Yoffset="84"/>
<sprite type="Joints.DistanceJoint" id="35" body1="Stryder25" body2="Stryder33" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="2" b1_Xoffset="0" b1_Yoffset="39" b2_Xoffset="0" b2_Yoffset="109" bx="339" by="226" ax="338" ay="324"/>
<!-- END Monster construction -->


    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    