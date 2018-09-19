import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
        <sprite shape="rect" type="Enemy.EnemySprite" x="188" y="78" width="306" height="27" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="0" sheet="6" firstframe="surfboard.png" classname="EndbossGenericBodyPart" spritedata="NOT_SET"/>
        <sprite shape="circ" type="Enemy.EnemySprite" x="190" y="176" width="133" height="133" angle="1" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="surfer_eyeball.png" setName="1" classname="SnailBodyPart" spritedata="NOT_SET"/>
        <sprite shape="circ" type="Enemy.EnemySprite" x="294" y="201" width="35" height="35" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="surfer_elbow.png" setName="7" classname="EndbossGenericBodyPart" spritedata="NOT_SET"/>
        
        <sprite shape="circ" type="Enemy.EnemySprite" x="343" y="210" width="50" height="50" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="surfer_hand.png" setName="8" classname="EndbossGenericBodyPart" spritedata="NOT_SET"/>
        <sprite shape="circ" type="Enemy.EnemySprite" x="24" y="213" width="50" height="50" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="surfer_hand.png" setName="9" classname="EndbossGenericBodyPart" spritedata="NOT_SET"/>
        
        <sprite shape="circ" type="Enemy.EnemySprite" x="81" y="198" width="35" height="35" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="surfer_elbow.png" setName="10" classname="EndbossGenericBodyPart" spritedata="NOT_SET"/>
        <sprite type="Joints.DistanceJoint" id="2" body1="0" body2="1" damping="0.2" freq="1" texture_type="image" texture="surfer_arm.png" texture_width="20" b1_Xoffset="-74" b1_Yoffset="-2" b2_Xoffset="-51" b2_Yoffset="-15" bx="199" by="161" ax="174" ay="76"/>
        <sprite type="Joints.DistanceJoint" id="3" body1="0" body2="1" damping="0.2" freq="1" texture_type="image" texture="surfer_arm.png" texture_width="20" b1_Xoffset="63" b1_Yoffset="-2" b2_Xoffset="44" b2_Yoffset="-15" bx="294" by="161" ax="311" ay="76"/>
        <sprite type="Joints.DistanceJoint" id="4" body1="0" body2="1" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-91" b1_Yoffset="0" b2_Xoffset="44" b2_Yoffset="-15" bx="294" by="161" ax="157" ay="78"/>
        <sprite type="Joints.DistanceJoint" id="5" body1="0" body2="1" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="79" b1_Yoffset="-1" b2_Xoffset="-50" b2_Yoffset="-15" bx="200" by="161" ax="327" ay="77"/>
        <sprite type="Joints.PrismaticJoint" id="6" body1="0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_translation="-1000" upper_translation="1000" enable_limit="true" vertical="false" bx="478" by="79" ax="197" ay="79"/>
        
        <sprite type="Joints.DistanceJoint" id="11" body1="10" body2="1" damping="0.2" freq="10" texture_type="image" texture="surfer_arm.png" texture_width="20" b1_Xoffset="11" b1_Yoffset="-1" b2_Xoffset="-57" b2_Yoffset="6" bx="193" by="182" ax="152" ay="197" collide_connected="true"/>
        <sprite type="Joints.DistanceJoint" id="12" body1="9" body2="10" damping="0.2" freq="50" texture_type="image" texture="surfer_arm.png" texture_width="20" b1_Xoffset="2" b1_Yoffset="0" b2_Xoffset="-10" b2_Yoffset="0" bx="131" by="198" ax="86" ay="213" collide_connected="true"/>
        <sprite type="Joints.DistanceJoint" id="13" body1="1" body2="7" damping="0.2" freq="10" texture_type="image" texture="surfer_arm.png" texture_width="20" b1_Xoffset="55" b1_Yoffset="5" b2_Xoffset="-8" b2_Yoffset="0" bx="346" by="201" ax="305" ay="181" collide_connected="true"/>
        <sprite type="Joints.DistanceJoint" id="14" body1="7" body2="8" damping="0.2" freq="50" texture_type="image" texture="surfer_arm.png" texture_width="20" b1_Xoffset="9" b1_Yoffset="2" b2_Xoffset="-8" b2_Yoffset="-1" bx="395" by="209" ax="363" ay="203" collide_connected="true"/>
        
        <sprite type="Joints.DistanceJoint" id="15" body1="0" body2="9" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-135" b1_Yoffset="-2" b2_Xoffset="1" b2_Yoffset="1" bx="85" by="214" ax="113" ay="76"/>
        <sprite type="Joints.DistanceJoint" id="16" body1="0" body2="8" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="132" b1_Yoffset="-1" b2_Xoffset="-7" b2_Yoffset="-1" bx="396" by="209" ax="380" ay="77" collide_connected="true"/>
        <sprite type="Joints.DistanceJoint" id="17" body1="9" body2="8" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-10" b1_Yoffset="1" b2_Xoffset="8" b2_Yoffset="1" bx="411" by="211" ax="74" ay="214"/>

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    