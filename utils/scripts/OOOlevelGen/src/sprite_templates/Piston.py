import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="228" y="352" width="129" height="129" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="Piston_engine.png" setName="Piston_1" classname="PistonLimb" spritedata="Piston"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="229" y="348" width="198" height="198" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="Piston_body.png" setName="Piston_0" classname="PistonBrain" spritedata="Piston"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="185" y="197" width="24" height="99" angle="0" restitution="0.2" static="false" friction="0.1" density="1" setName="Piston_3" sheet="6" firstframe="Piston_leg.png" classname="PistonLimb" spritedata="Piston"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="104" y="185" width="128" height="128" angle="0" restitution="0.2" static="false" friction="0.1" density="1" setName="Piston_5" sheet="6" firstframe="Piston_leg_guide_small.png" classname="PistonLimb" spritedata="Piston"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="238" y="181" width="66" height="127" angle="0" restitution="0.2" static="false" friction="0.1" density="8" setName="Piston_6" sheet="6" firstframe="Piston_leg_guide.png" classname="PistonLimb" spritedata="Piston"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="375" y="192" width="136" height="149" angle="0" restitution="0.2" static="false" friction="0.1" density="1" setName="Piston_8" sheet="6" firstframe="Piston_leg_guide.png" classname="PistonLimb" spritedata="Piston"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="290" y="135" width="26" height="104" angle="0" restitution="0.2" static="false" friction="0.1" density="1" setName="Piston_7" sheet="6" firstframe="Piston_leg.png" classname="PistonLimb" spritedata="Piston"/>
<sprite type="Joints.RevoluteJoint" id="2" body1="Piston_1" body2="Piston_0" motor_speed="-10.0" torque="5000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="159" by="305" b2_Xoffset="-70" b2_Yoffset="-43" ax="225" ay="352" b1_Xoffset="-3" b1_Yoffset="0"/>
<sprite type="Joints.DistanceJoint" id="4" body1="Piston_1" body2="Piston_3" damping="0.2" freq="30" texture_type="image" texture="Piston_joint_dynamic.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="40" b2_Xoffset="-1" b2_Yoffset="42" bx="184" by="239" ax="229" ay="392"/>
<sprite type="Joints.DistanceJoint" id="7" body1="Piston_5" body2="Piston_0" damping="0.2" freq="30" texture_type="image" texture="Piston_joint_static.png" texture_width="20" b1_Xoffset="55" b1_Yoffset="59" b2_Xoffset="-51" b2_Yoffset="-79" bx="178" by="269" ax="159" ay="244"/>
<sprite type="Joints.DistanceJoint" id="8" body1="Piston_0" body2="Piston_6" damping="0.2" freq="20" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-84" b1_Yoffset="-3" b2_Xoffset="-22" b2_Yoffset="57" bx="216" by="238" ax="145" ay="345"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Piston_0" body2="Piston_5" damping="0.2" freq="30" texture_type="image" texture="Piston_joint_static.png" texture_width="20" b1_Xoffset="-77" b1_Yoffset="21" b2_Xoffset="-57" b2_Yoffset="59" bx="47" by="244" ax="152" ay="369"/>
<sprite type="Joints.DistanceJoint" id="10" body1="Piston_6" body2="Piston_0" damping="0.2" freq="20" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="24" b1_Yoffset="56" b2_Xoffset="88" b2_Yoffset="0" bx="317" by="348" ax="262" ay="237"/>
<sprite type="Joints.DistanceJoint" id="11" body1="Piston_6" body2="Piston_5" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-29" b1_Yoffset="-56" b2_Xoffset="54" b2_Yoffset="-59" bx="158" by="126" ax="209" ay="125"/>
<sprite type="Joints.DistanceJoint" id="2" body1="Piston_7" body2="Piston_1" damping="0.2" freq="30" texture_type="image" texture="Piston_joint_dynamic.png" texture_width="20" b1_Xoffset="-3" b1_Yoffset="44" b2_Xoffset="1" b2_Yoffset="-39" bx="229" by="313" ax="287" ay="179"/>
<sprite type="Joints.DistanceJoint" id="3" body1="Piston_8" body2="Piston_6" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-61" b1_Yoffset="-45" b2_Xoffset="25" b2_Yoffset="-34" bx="263" by="147" ax="314" ay="147"/>
<sprite type="Joints.DistanceJoint" id="4" body1="Piston_0" body2="Piston_8" damping="0.2" freq="30" texture_type="image" texture="Piston_joint_static.png" texture_width="20" b1_Xoffset="59" b1_Yoffset="-73" b2_Xoffset="-57" b2_Yoffset="63" bx="318" by="255" ax="288" ay="275"/>
<sprite type="Joints.DistanceJoint" id="5" body1="Piston_8" body2="Piston_0" damping="0.2" freq="30" texture_type="image" texture="Piston_joint_static.png" texture_width="20" b1_Xoffset="57" b1_Yoffset="65" b2_Xoffset="86" b2_Yoffset="23" bx="315" by="371" ax="432" ay="257"/>
<sprite type="Joints.DistanceJoint" id="19" body1="Piston_6" body2="Piston_5" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-28" b1_Yoffset="-57" b2_Xoffset="54" b2_Yoffset="59" bx="158" by="244" ax="210" ay="124"/>
<sprite type="Joints.DistanceJoint" id="20" body1="Piston_8" body2="Piston_6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-63" b1_Yoffset="-69" b2_Xoffset="24" b2_Yoffset="55" bx="262" by="236" ax="312" ay="123"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    