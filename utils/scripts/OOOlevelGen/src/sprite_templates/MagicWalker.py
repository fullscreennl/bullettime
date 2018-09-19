import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>


<!-- BEGIN Monster construction -->
<!-- engine 1 -->
<sprite shape="circ" type="Enemy.EnemySprite" x="111" y="49" width="40" height="40" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="MagicWalker_enginebase.png" setName="MagicWalker0" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="112" y="49" width="27" height="27" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="MagicWalker_engine.png" setName="MagicWalker1" classname="MagicWalkerBrain" spritedata="MagicWalker" groupIndex="1"/>


<sprite shape="rect" type="Enemy.EnemySprite" x="86" y="3" width="22" height="9" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MagicWalker2" sheet="6" firstframe="MagicWalker_foot.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="132" y="3" width="24" height="10" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MagicWalker3" sheet="6" firstframe="MagicWalker_foot.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>

<!-- engine 2 -->
<sprite shape="circ" type="Enemy.EnemySprite" x="234" y="55" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="MagicWalker_enginebase.png" setName="MagicWalker4" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="235" y="54" width="26" height="26" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="MagicWalker_engine.png" setName="MagicWalker6" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>

<!-- engine 3 -->
<sprite shape="circ" type="Enemy.EnemySprite" x="367" y="56" width="39" height="39" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="MagicWalker_enginebase.png" setName="MagicWalker5" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="368" y="56" width="29" height="29" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="MagicWalker_engine.png" setName="MagicWalker7" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>


<sprite shape="rect" type="Enemy.EnemySprite" x="213" y="3" width="21" height="8" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MagicWalker8" sheet="6" firstframe="MagicWalker_foot.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="266" y="3" width="19" height="7" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MagicWalker9" sheet="6" firstframe="MagicWalker_foot.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="391" y="4" width="24" height="10" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MagicWalker10" sheet="6" firstframe="MagicWalker_foot.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="349" y="4" width="24" height="11" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="MagicWalker11" sheet="6" firstframe="MagicWalker_foot.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="180" y="147" width="105" height="106" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="MagicWalker38" sheet="6" firstframe="MagicWalker_cockpit.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="1"/>

<sprite shape="circ" type="Enemy.EnemySprite" x="442" y="184" width="17" height="17" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="MagicWalker_linkagesmall.png" setName="MagicWalker46" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="449" y="147" width="17" height="17" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="MagicWalker_linkagesmall.png" setName="MagicWalker47" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="453" y="102" width="32" height="32" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="MagicWalker_hook.png" setName="MagicWalker48" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="-1"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="363" y="159" width="182" height="21" angle="48" restitution="0.2" static="false" friction="0.5" density="1" setName="MagicWalker42" sheet="6" firstframe="MagicWalker_leverbeam.png" classname="MagicWalkerLimb" spritedata="MagicWalker" groupIndex="-1"/>

<!-- engine joints -->
<sprite type="Joints.RevoluteJoint" id="12" body1="MagicWalker1" body2="MagicWalker0" motor_speed="15.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="94" by="42" b2_Xoffset="-17" b2_Yoffset="-7" ax="112" ay="49" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="13" body1="MagicWalker6" body2="MagicWalker4" motor_speed="25.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="216" by="50" b2_Xoffset="-18" b2_Yoffset="-5" ax="235" ay="54" b1_Xoffset="0" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="14" body1="MagicWalker7" body2="MagicWalker5" motor_speed="50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="349" by="58" b2_Xoffset="-18" b2_Yoffset="2" ax="368" ay="56" b1_Xoffset="0" b1_Yoffset="0"/>

<!-- 1 legs -->
<sprite type="Joints.DistanceJoint" id="15" body1="MagicWalker2" body2="MagicWalker1" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_leg.png" texture_width="20" b1_Xoffset="-4" b1_Yoffset="2" b2_Xoffset="-9" b2_Yoffset="-1" bx="103" by="48" ax="82" ay="5"/>
<sprite type="Joints.DistanceJoint" id="16" body1="MagicWalker3" body2="MagicWalker1" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_leg.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="2" b2_Xoffset="7" b2_Yoffset="0" bx="119" by="49" ax="130" ay="5"/>
<!-- 2 legs -->
<sprite type="Joints.DistanceJoint" id="17" body1="MagicWalker8" body2="MagicWalker6" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_leg.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="-7" b2_Yoffset="0" bx="228" by="54" ax="212" ay="4"/>
<sprite type="Joints.DistanceJoint" id="18" body1="MagicWalker9" body2="MagicWalker6" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_leg.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="8" b2_Yoffset="1" bx="243" by="55" ax="265" ay="4"/>
<!-- 3 legs -->
<sprite type="Joints.DistanceJoint" id="19" body1="MagicWalker11" body2="MagicWalker7" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_leg.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="2" b2_Xoffset="-10" b2_Yoffset="0" bx="358" by="56" ax="347" ay="6"/>
<sprite type="Joints.DistanceJoint" id="20" body1="MagicWalker10" body2="MagicWalker7" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_leg.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="1" b2_Xoffset="9" b2_Yoffset="0" bx="377" by="56" ax="391" ay="5"/>


<sprite type="Joints.DistanceJoint" id="21" body1="MagicWalker3" body2="MagicWalker2" damping="0.2" freq="10" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-1" b1_Yoffset="2" b2_Xoffset="-4" b2_Yoffset="2" bx="82" by="5" ax="131" ay="5"/>
<sprite type="Joints.DistanceJoint" id="22" body1="MagicWalker9" body2="MagicWalker8" damping="0.2" freq="10" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="0" b1_Yoffset="1" b2_Xoffset="-1" b2_Yoffset="1" bx="212" by="4" ax="266" ay="4"/>
<sprite type="Joints.DistanceJoint" id="23" body1="MagicWalker10" body2="MagicWalker11" damping="0.2" freq="10" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="2" b2_Xoffset="-2" b2_Yoffset="1" bx="347" by="5" ax="392" ay="6"/>
<sprite type="Joints.DistanceJoint" id="24" body1="MagicWalker4" body2="MagicWalker0" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="-19" b2_Xoffset="1" b2_Yoffset="20" bx="112" by="69" ax="235" ay="36"/>
<sprite type="Joints.DistanceJoint" id="25" body1="MagicWalker4" body2="MagicWalker0" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="2" b1_Yoffset="20" b2_Xoffset="1" b2_Yoffset="-19" bx="112" by="30" ax="236" ay="75"/>
<sprite type="Joints.DistanceJoint" id="26" body1="MagicWalker5" body2="MagicWalker4" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="0" b1_Yoffset="-20" b2_Xoffset="0" b2_Yoffset="19" bx="234" by="74" ax="367" ay="36"/>
<sprite type="Joints.DistanceJoint" id="27" body1="MagicWalker5" body2="MagicWalker4" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="19" b2_Xoffset="2" b2_Yoffset="-17" bx="236" by="38" ax="368" ay="75"/>
<sprite type="Joints.DistanceJoint" id="28" body1="MagicWalker3" body2="MagicWalker0" damping="0.2" freq="5" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-2" b1_Yoffset="3" b2_Xoffset="-18" b2_Yoffset="1" bx="93" by="50" ax="130" ay="6"/>
<sprite type="Joints.DistanceJoint" id="29" body1="MagicWalker9" body2="MagicWalker4" damping="0.2" freq="5" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="0" b1_Yoffset="2" b2_Xoffset="-16" b2_Yoffset="1" bx="218" by="56" ax="266" ay="5"/>
<sprite type="Joints.DistanceJoint" id="30" body1="MagicWalker10" body2="MagicWalker5" damping="0.2" freq="5" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="-17" b2_Yoffset="0" bx="350" by="56" ax="392" ay="5"/>
<sprite type="Joints.DistanceJoint" id="31" body1="MagicWalker2" body2="MagicWalker0" damping="0.2" freq="5" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-3" b1_Yoffset="2" b2_Xoffset="21" b2_Yoffset="2" bx="132" by="51" ax="83" ay="5"/>
<sprite type="Joints.DistanceJoint" id="32" body1="MagicWalker8" body2="MagicWalker4" damping="0.2" freq="5" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="18" b2_Yoffset="0" bx="252" by="55" ax="212" ay="4"/>
<sprite type="Joints.DistanceJoint" id="33" body1="MagicWalker11" body2="MagicWalker5" damping="0.2" freq="5" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-3" b1_Yoffset="2" b2_Xoffset="20" b2_Yoffset="0" bx="387" by="56" ax="346" ay="6"/>
<sprite type="Joints.DistanceJoint" id="34" body1="MagicWalker4" body2="MagicWalker0" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="20" b2_Xoffset="1" b2_Yoffset="20" bx="112" by="69" ax="235" ay="75"/>
<sprite type="Joints.DistanceJoint" id="35" body1="MagicWalker5" body2="MagicWalker4" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="19" b2_Xoffset="0" b2_Yoffset="21" bx="234" by="76" ax="368" ay="75"/>
<sprite type="Joints.DistanceJoint" id="36" body1="MagicWalker4" body2="MagicWalker3" damping="0.2" freq="20" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="3" b1_Yoffset="-18" b2_Xoffset="-2" b2_Yoffset="2" bx="130" by="5" ax="237" ay="37"/>
<sprite type="Joints.DistanceJoint" id="37" body1="MagicWalker11" body2="MagicWalker4" damping="0.2" freq="20" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-2" b1_Yoffset="2" b2_Xoffset="2" b2_Yoffset="-19" bx="236" by="36" ax="347" ay="6"/>
<sprite type="Joints.DistanceJoint" id="39" body1="MagicWalker0" body2="MagicWalker38" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="2" b1_Yoffset="22" b2_Xoffset="-45" b2_Yoffset="-44" bx="135" by="103" ax="113" ay="71"/>
<sprite type="Joints.DistanceJoint" id="40" body1="MagicWalker4" body2="MagicWalker38" damping="0.2" freq="10" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="21" b2_Xoffset="45" b2_Yoffset="-46" bx="225" by="101" ax="235" ay="76"/>
<sprite type="Joints.DistanceJoint" id="41" body1="MagicWalker4" body2="MagicWalker38" damping="0.2" freq="20" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="0" b1_Yoffset="21" b2_Xoffset="-45" b2_Yoffset="-44" bx="135" by="103" ax="234" ay="76"/>
<sprite type="Joints.DistanceJoint" id="43" body1="MagicWalker42" body2="MagicWalker38" damping="0.2" freq="20" texture_type="none" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="4" b1_Yoffset="3" b2_Xoffset="46" b2_Yoffset="-23" bx="226" by="124" ax="367" ay="162"/>
<sprite type="Joints.DistanceJoint" id="44" body1="MagicWalker42" body2="MagicWalker4" damping="0.2" freq="30" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="-57" b1_Yoffset="-63" b2_Xoffset="0" b2_Yoffset="20" bx="234" by="75" ax="306" ay="96"/>
<sprite type="Joints.DistanceJoint" id="45" body1="MagicWalker5" body2="MagicWalker42" damping="0.2" freq="30" texture_type="image" texture="MagicWalker_construction.png" texture_width="15" b1_Xoffset="1" b1_Yoffset="20" b2_Xoffset="-56" b2_Yoffset="-64" bx="307" by="95" ax="368" ay="76"/>

<!-- ball and chain -->
<sprite type="Joints.DistanceJoint" id="49" body1="MagicWalker46" body2="MagicWalker42" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_linkage.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="54" b2_Yoffset="62" bx="417" by="221" ax="441" ay="185"/>
<sprite type="Joints.DistanceJoint" id="50" body1="MagicWalker47" body2="MagicWalker46" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_linkage.png" texture_width="20" b1_Xoffset="2" b1_Yoffset="0" b2_Xoffset="0" b2_Yoffset="-3" bx="442" by="181" ax="451" ay="147"/>
<sprite type="Joints.DistanceJoint" id="51" body1="MagicWalker48" body2="MagicWalker47" damping="0.2" freq="20" texture_type="image" texture="MagicWalker_linkage.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="12" b2_Xoffset="0" b2_Yoffset="-2" bx="449" by="145" ax="452" ay="114"/>
<!-- END Monster construction -->








    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    