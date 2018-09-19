import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
        <!-- BEGIN Monster construction -->
        <sprite shape="rect" type="Enemy.EnemySprite" x="178" y="26" width="295" height="54" angle="0" restitution="0.2" static="false" friction="0.01" density="3" setName="0" sheet="6" firstframe="snail_body.png" classname="SnailBodyPart" spritedata="Snail"/>
        <sprite shape="circ" type="Enemy.EnemySprite" x="190" y="75" width="152" height="152" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="snail_house.png" setName="1" classname="SnailLimb" spritedata="Snail"/>
        <sprite shape="circ" type="Enemy.EnemySprite" x="29" y="110" width="30" height="30" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="snail_eye.png" setName="2" classname="SnailLimb" spritedata="Snail"/>
        <sprite shape="circ" type="Enemy.EnemySprite" x="66" y="114" width="28" height="28" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="snail_eye.png" setName="3" classname="SnailLimb" spritedata="Snail"/>
        <sprite type="Joints.DistanceJoint" id="4" body1="0" body2="2" damping="0.2" freq="20" texture_type="image" texture="snail_eye_joint_skin.png" texture_width="3" b1_Xoffset="-80" b1_Yoffset="-18" b2_Xoffset="-7" b2_Yoffset="0" bx="82" by="111" ax="158" ay="8"/>
        <sprite type="Joints.DistanceJoint" id="5" body1="0" body2="2" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-143" b1_Yoffset="-16" b2_Xoffset="-7" b2_Yoffset="0" bx="82" by="111" ax="95" ay="10"/>
        <sprite type="Joints.DistanceJoint" id="6" body1="0" body2="3" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-76" b1_Yoffset="0" b2_Xoffset="-8" b2_Yoffset="-1" bx="118" by="114" ax="162" ay="26"/>
        <sprite type="Joints.DistanceJoint" id="7" body1="0" body2="3" damping="0.2" freq="20" texture_type="image" texture="snail_eye_joint_skin.png" texture_width="3" b1_Xoffset="-119" b1_Yoffset="-15" b2_Xoffset="-8" b2_Yoffset="-1" bx="118" by="114" ax="119" ay="11"/>
        <sprite type="Joints.DistanceJoint" id="8" body1="0" body2="1" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-136" b1_Yoffset="-17" b2_Xoffset="-58" b2_Yoffset="32" bx="192" by="107" ax="102" ay="9"/>
        <sprite type="Joints.DistanceJoint" id="9" body1="0" body2="1" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="131" b1_Yoffset="-11" b2_Xoffset="57" b2_Yoffset="34" bx="307" by="109" ax="369" ay="15"/>
        <sprite type="Joints.DistanceJoint" id="10" body1="1" body2="0" damping="0.2" freq="50" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="51" b1_Yoffset="-43" b2_Xoffset="112" b2_Yoffset="-11" bx="350" by="15" ax="301" ay="32"/>
        <!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    