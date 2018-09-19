import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="176" y="120" width="44" height="44" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs0" classname="KingofBlobsLimb" spritedata="KingofBlobs" groupIndex="-1"/>

<sprite shape="circ" type="Enemy.EnemySprite" x="210" y="86" width="51" height="51" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs2" classname="KingofBlobsLimb" spritedata="KingofBlobs" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="278" y="81" width="64" height="64" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs3" classname="KingofBlobsLimb" spritedata="KingofBlobs" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="292" y="129" width="37" height="37" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs4" classname="KingofBlobsLimb" spritedata="KingofBlobs" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="322" y="109" width="40" height="40" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs5" classname="KingofBlobsLimb" spritedata="KingofBlobs" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="270" y="174" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs15" classname="KingofBlobsLimb" spritedata="KingofBlobs" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="236" y="134" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="KingofBlobs_body.png" setName="KingofBlobs1" classname="KingofBlobsBrain" spritedata="KingofBlobs" groupIndex="-1"/>
<sprite type="Joints.DistanceJoint" id="6" body1="KingofBlobs2" body2="KingofBlobs3" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="-1" b2_Yoffset="1" bx="277" by="82" ax="210" ay="86"/>
<sprite type="Joints.DistanceJoint" id="7" body1="KingofBlobs0" body2="KingofBlobs2" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="2" b2_Xoffset="0" b2_Yoffset="0" bx="210" by="86" ax="176" ay="122"/>
<sprite type="Joints.DistanceJoint" id="8" body1="KingofBlobs1" body2="KingofBlobs0" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="2" bx="176" by="122" ax="235" ay="135"/>
<sprite type="Joints.DistanceJoint" id="9" body1="KingofBlobs1" body2="KingofBlobs2" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="0" bx="210" by="86" ax="236" ay="135"/>
<sprite type="Joints.DistanceJoint" id="10" body1="KingofBlobs4" body2="KingofBlobs1" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="1" b2_Xoffset="-1" b2_Yoffset="0" bx="235" by="134" ax="292" ay="130"/>
<sprite type="Joints.DistanceJoint" id="11" body1="KingofBlobs5" body2="KingofBlobs4" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="2" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="0" bx="292" by="129" ax="324" ay="110"/>
<sprite type="Joints.DistanceJoint" id="12" body1="KingofBlobs5" body2="KingofBlobs3" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="2" bx="278" by="83" ax="323" ay="110"/>
<sprite type="Joints.DistanceJoint" id="13" body1="KingofBlobs3" body2="KingofBlobs1" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="-1" b2_Yoffset="0" bx="235" by="134" ax="277" ay="82"/>
<sprite type="Joints.DistanceJoint" id="14" body1="KingofBlobs3" body2="KingofBlobs4" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="2" b2_Xoffset="-1" b2_Yoffset="0" bx="291" by="129" ax="276" ay="83"/>
<sprite type="Joints.DistanceJoint" id="16" body1="KingofBlobs15" body2="KingofBlobs1" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="0" b2_Xoffset="-1" b2_Yoffset="1" bx="235" by="135" ax="270" ay="174"/>
<sprite type="Joints.DistanceJoint" id="17" body1="KingofBlobs4" body2="KingofBlobs15" damping="0.2" freq="2" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="0" b2_Xoffset="0" b2_Yoffset="0" bx="270" by="174" ax="291" ay="129"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    