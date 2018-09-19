import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>


<!-- BEGIN Monster construction -->
<!--
<sprite shape="rect" type="Enemy.EnemySprite" x="315" y="94" width="209" height="78" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker0" sheet="6" firstframe="Rhino_leg.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="405" y="36" width="29" height="76" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker1" sheet="6" firstframe="redrect.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="225" y="36" width="28" height="78" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker2" sheet="6" firstframe="redrect.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="171" y="143" width="118" height="48" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker3" sheet="6" firstframe="redrect.png" classname="WalkerBrain" spritedata="Walker"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="317" y="96" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="Walker4" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="273" y="36" width="29" height="78" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker12" sheet="6" firstframe="redrect.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="371" y="34" width="27" height="80" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker14" sheet="6" firstframe="redrect.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="Walker4" body2="Walker0" motor_speed="-5.0" torque="100000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="260" by="94" b2_Xoffset="-55" b2_Yoffset="0" ax="317" ay="98" b1_Xoffset="0" b1_Yoffset="2"/>
<sprite type="Joints.RevoluteJoint" id="6" body1="Walker3" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="231" by="92" b2_Xoffset="-84" b2_Yoffset="-2" ax="216" ay="129" b1_Xoffset="45" b1_Yoffset="-14"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="Walker2" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="273" by="116" b2_Xoffset="-42" b2_Yoffset="22" ax="223" ay="67" b1_Xoffset="-2" b1_Yoffset="31"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="Walker1" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="397" by="119" b2_Xoffset="82" b2_Yoffset="25" ax="403" ay="65" b1_Xoffset="-2" b1_Yoffset="29"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Walker4" body2="Walker2" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="12" b1_Yoffset="1" b2_Xoffset="-2" b2_Yoffset="-30" bx="223" by="6" ax="329" ay="97"/>
<sprite type="Joints.DistanceJoint" id="10" body1="Walker1" body2="Walker4" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="-28" b2_Xoffset="-12" b2_Yoffset="2" bx="305" by="98" ax="403" ay="8"/>
<sprite type="Joints.DistanceJoint" id="11" body1="Walker0" body2="Walker3" damping="0.2" freq="5" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="94" b1_Yoffset="30" b2_Xoffset="49" b2_Yoffset="16" bx="220" by="159" ax="409" ay="124"/>
<sprite type="Joints.RevoluteJoint" id="13" body1="Walker12" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="255" by="119" b2_Xoffset="-60" b2_Yoffset="25" ax="272" ay="67" b1_Xoffset="-1" b1_Yoffset="31"/>
<sprite type="Joints.RevoluteJoint" id="15" body1="Walker14" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="374" by="113" b2_Xoffset="59" b2_Yoffset="19" ax="368" ay="67" b1_Xoffset="-3" b1_Yoffset="33"/>
<sprite type="Joints.DistanceJoint" id="16" body1="Walker12" body2="Walker4" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="-29" b2_Xoffset="0" b2_Yoffset="16" bx="317" by="112" ax="271" ay="7"/>
<sprite type="Joints.DistanceJoint" id="17" body1="Walker14" body2="Walker4" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-7" b1_Yoffset="-28" b2_Xoffset="0" b2_Yoffset="-17" bx="317" by="79" ax="364" ay="6"/>
-->




<!-- BEGIN Monster construction -->

<sprite shape="circ" type="Enemy.EnemySprite" x="317" y="96" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="Walker4" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="405" y="34" width="49" height="74" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker1" sheet="6" firstframe="Rhino_leg.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="225" y="36" width="44" height="78" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker2" sheet="6" firstframe="Rhino_leg.png" classname="WalkerLimb" spritedata="Walker"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="273" y="36" width="43" height="78" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker12" sheet="6" firstframe="Rhino_leg.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="354" y="33" width="43" height="78" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Walker14" sheet="6" firstframe="Rhino_leg.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="316" y="109" width="253" height="114" angle="0" restitution="0.2" static="false" friction="0.5" density="4" setName="Walker0" sheet="6" firstframe="Rhino_body.png" classname="WalkerLimb" spritedata="Walker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="159" y="139" width="148" height="90" angle="0" restitution="0.2" static="false" friction="0.5" density="3" setName="Walker3" sheet="6" firstframe="Rhino_head.png" classname="WalkerBrain" spritedata="Walker"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="Walker4" body2="Walker0" motor_speed="-5.0" torque="100000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="261" by="109" b2_Xoffset="-55" b2_Yoffset="0" ax="317" ay="98" b1_Xoffset="0" b1_Yoffset="2"/>
<sprite type="Joints.RevoluteJoint" id="6" body1="Walker3" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="248" by="107" b2_Xoffset="-68" b2_Yoffset="-2" ax="208" ay="107" b1_Xoffset="49" b1_Yoffset="-32"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="Walker2" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="274" by="131" b2_Xoffset="-42" b2_Yoffset="22" ax="223" ay="67" b1_Xoffset="-2" b1_Yoffset="31"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="Walker1" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="398" by="134" b2_Xoffset="82" b2_Yoffset="25" ax="403" ay="63" b1_Xoffset="-2" b1_Yoffset="29"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Walker4" body2="Walker2" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="12" b1_Yoffset="1" b2_Xoffset="-2" b2_Yoffset="-30" bx="223" by="6" ax="329" ay="97"/>
<sprite type="Joints.DistanceJoint" id="10" body1="Walker1" body2="Walker4" damping="0.2" freq="30" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="-28" b2_Xoffset="-12" b2_Yoffset="2" bx="305" by="98" ax="403" ay="6"/>
<sprite type="Joints.DistanceJoint" id="11" body1="Walker0" body2="Walker3" damping="0.2" freq="5" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="88" b1_Yoffset="-6" b2_Xoffset="57" b2_Yoffset="8" bx="216" by="147" ax="404" ay="103"/>
<sprite type="Joints.RevoluteJoint" id="13" body1="Walker12" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="256" by="134" b2_Xoffset="-60" b2_Yoffset="25" ax="272" ay="67" b1_Xoffset="-1" b1_Yoffset="31"/>
<sprite type="Joints.RevoluteJoint" id="15" body1="Walker14" body2="Walker0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="375" by="128" b2_Xoffset="59" b2_Yoffset="19" ax="354" ay="64" b1_Xoffset="0" b1_Yoffset="31"/>
<sprite type="Joints.DistanceJoint" id="16" body1="Walker12" body2="Walker4" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="-30" b2_Xoffset="-1" b2_Yoffset="14" bx="316" by="110" ax="271" ay="6"/>
<sprite type="Joints.DistanceJoint" id="17" body1="Walker14" body2="Walker4" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="4" b1_Yoffset="-28" b2_Xoffset="0" b2_Yoffset="-17" bx="317" by="79" ax="358" ay="5"/>
<!-- END Monster construction -->

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    