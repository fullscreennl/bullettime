import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>

<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="300" y="147" width="234" height="53" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="JanssenWalker_0" sheet="6" firstframe="JanssenBody.png" classname="JanssenWalkerLimb" spritedata="JanssenWalker"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="295" y="151" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="JanssenEngine.png" setName="JanssenWalker_1" classname="JanssenWalkerBrain" spritedata="JanssenWalker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="185" y="189" width="62" height="88" angle="-16" restitution="0.2" static="false" friction="0.5" density="5" setName="JanssenWalker_3" sheet="6" firstframe="JanssenPiston.png" classname="JanssenWalkerLimb" spritedata="JanssenWalker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="148" y="73" width="64" height="80" angle="-12" restitution="0.2" static="false" friction="0.01" density="5" setName="JanssenWalker_4" sheet="6" firstframe="JanssenLeg.png" classname="JanssenWalkerLimb" spritedata="JanssenWalker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="439" y="188" width="63" height="87" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="JanssenWalker2" sheet="6" firstframe="JanssenPiston.png" classname="JanssenWalkerLimb" spritedata="JanssenWalker"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="442" y="62" width="60" height="78" angle="0" restitution="0.2" static="false" friction="3" density="5" setName="JanssenWalker3" sheet="6" firstframe="JanssenLeg.png" classname="JanssenWalkerLimb" spritedata="JanssenWalker"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="295" y="64" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="janssenWheel.png" setName="JanssenWalker9" classname="JanssenWalkerLimb" spritedata="JanssenWalker"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="JanssenWalker_3" body2="JanssenWalker_0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="233" by="135" b2_Xoffset="-67" b2_Yoffset="-12" ax="199" ay="156" b1_Xoffset="14" b1_Yoffset="-33"/>
<sprite type="Joints.DistanceJoint" id="7" body1="JanssenWalker_1" body2="JanssenWalker_3" damping="0.2" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="30" b1_Xoffset="2" b1_Yoffset="-21" b2_Xoffset="32" b2_Yoffset="32" bx="217" by="221" ax="297" ay="130"/>
<sprite type="Joints.DistanceJoint" id="8" body1="JanssenWalker_4" body2="JanssenWalker_1" damping="0.2" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="30" b1_Xoffset="26" b1_Yoffset="28" b2_Xoffset="1" b2_Yoffset="-20" bx="296" by="131" ax="174" ay="101"/>
<sprite type="Joints.DistanceJoint" id="9" body1="JanssenWalker_4" body2="JanssenWalker_3" damping="0.5" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="20" b1_Xoffset="-19" b1_Yoffset="40" b2_Xoffset="-31" b2_Yoffset="-24" bx="154" by="165" ax="129" ay="113"/>
<sprite type="Joints.DistanceJoint" id="10" body1="JanssenWalker_3" body2="JanssenWalker_4" damping="0.5" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="20" b1_Xoffset="14" b1_Yoffset="-34" b2_Xoffset="25" b2_Yoffset="28" bx="173" by="101" ax="199" ay="155"/>
<sprite type="Joints.RevoluteJoint" id="11" body1="JanssenWalker_1" body2="JanssenWalker_0" motor_speed="5.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="372" by="153" b2_Xoffset="72" b2_Yoffset="6" ax="297" ay="153" b1_Xoffset="2" b1_Yoffset="2"/>
<sprite type="Joints.DistanceJoint" id="4" body1="JanssenWalker2" body2="JanssenWalker_1" damping="0.2" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="30" b1_Xoffset="-25" b1_Yoffset="38" b2_Xoffset="22" b2_Yoffset="1" bx="317" by="152" ax="414" ay="226"/>
<sprite type="Joints.DistanceJoint" id="5" body1="JanssenWalker3" body2="JanssenWalker_1" damping="0.2" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="30" b1_Xoffset="-24" b1_Yoffset="25" b2_Xoffset="22" b2_Yoffset="1" bx="317" by="152" ax="418" ay="87"/>
<sprite type="Joints.RevoluteJoint" id="6" body1="JanssenWalker2" body2="JanssenWalker_0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="385" by="168" b2_Xoffset="85" b2_Yoffset="21" ax="414" ay="152" b1_Xoffset="-25" b1_Yoffset="-36"/>
<sprite type="Joints.DistanceJoint" id="7" body1="JanssenWalker3" body2="JanssenWalker2" damping="0.5" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="20" b1_Xoffset="-23" b1_Yoffset="26" b2_Xoffset="-25" b2_Yoffset="-36" bx="414" by="152" ax="419" ay="88"/>
<sprite type="Joints.DistanceJoint" id="8" body1="JanssenWalker3" body2="JanssenWalker2" damping="0.5" freq="10" texture_type="image" texture="JanssenJoint.png" texture_width="20" b1_Xoffset="19" b1_Yoffset="29" b2_Xoffset="23" b2_Yoffset="-35" bx="462" by="153" ax="461" ay="91"/>
<sprite type="Joints.RevoluteJoint" id="10" body1="JanssenWalker9" body2="JanssenWalker_0" motor_speed="50.0" torque="0.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="227" by="153" b2_Xoffset="-73" b2_Yoffset="6" ax="294" ay="54" b1_Xoffset="-1" b1_Yoffset="-10"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    