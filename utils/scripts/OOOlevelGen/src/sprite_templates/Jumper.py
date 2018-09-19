import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
       <!-- BEGIN Monster construction -->
        <sprite shape="circ" type="Enemy.EnemySprite" x="164" y="86" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="jumper_body.png" setName="0" classname="Jumper" spritedata="Jumper"/>
        <sprite shape="rect" type="Enemy.EnemySprite" x="101" y="10" width="60" height="23" angle="0" restitution="0.2" static="false" friction="0.1" density="30" setName="1" sheet="6" firstframe="jumper_foot.png" classname="JumperLimb" spritedata="Jumper"/>
        <sprite shape="rect" type="Enemy.EnemySprite" x="231" y="9" width="62" height="21" angle="0" restitution="0.2" static="false" friction="0.1" density="30" setName="2" sheet="6" firstframe="jumper_foot.png" classname="JumperLimb" spritedata="Jumper"/>
        <sprite type="Joints.DistanceJoint" id="3" body1="1" body2="0" damping="0.2" freq="1" texture_type="image" texture="jumper_joint.png" texture_width="20" b1_Xoffset="-3" b1_Yoffset="2" b2_Xoffset="-31" b2_Yoffset="-2" bx="193" by="84" ax="158" ay="12"/>
        <sprite type="Joints.DistanceJoint" id="4" body1="2" body2="0" damping="0.2" freq="1" texture_type="image" texture="jumper_joint.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="2" b2_Xoffset="31" b2_Yoffset="0" bx="255" by="86" ax="291" ay="11"/>
        <sprite type="Joints.DistanceJoint" id="5" body1="1" body2="2" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-4" b1_Yoffset="2" b2_Xoffset="-2" b2_Yoffset="2" bx="289" by="11" ax="157" ay="12"/>
        <sprite type="Joints.DistanceJoint" id="6" body1="1" body2="0" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-3" b1_Yoffset="2" b2_Xoffset="31" b2_Yoffset="1" bx="255" by="87" ax="158" ay="12"/>
        <sprite type="Joints.DistanceJoint" id="7" body1="0" body2="2" damping="0.2" freq="50" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-30" b1_Yoffset="-2" b2_Xoffset="-1" b2_Yoffset="1" bx="290" by="10" ax="194" ay="84"/>
        <!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    