import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
	<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="148" y="219" width="50" height="50" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls0" classname="GooBallsBrain" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="320" y="266" width="48" height="48" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls1" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="309" y="133" width="52" height="52" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls2" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="470" y="34" width="42" height="42" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls3" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="108" y="30" width="53" height="53" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls4" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="243" y="345" width="53" height="53" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls5" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="399" y="346" width="45" height="45" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls6" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="454" y="197" width="45" height="45" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls7" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="340" y="444" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="gooball.png" setName="GooBalls8" classname="GooBallsLimb" spritedata="GooBalls"/>
<sprite type="Joints.DistanceJoint" id="9" body1="GooBalls0" body2="GooBalls4" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="0" b1_Yoffset="4" b2_Xoffset="-2" b2_Yoffset="1" bx="106" by="31" ax="148" ay="223"/>
<sprite type="Joints.DistanceJoint" id="10" body1="GooBalls4" body2="GooBalls2" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="3" b2_Yoffset="3" bx="312" by="136" ax="109" ay="31"/>
<sprite type="Joints.DistanceJoint" id="11" body1="GooBalls4" body2="GooBalls3" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="1" b1_Yoffset="1" b2_Xoffset="1" b2_Yoffset="2" bx="471" by="36" ax="109" ay="31"/>
<sprite type="Joints.DistanceJoint" id="12" body1="GooBalls3" body2="GooBalls2" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="-1" b1_Yoffset="3" b2_Xoffset="4" b2_Yoffset="3" bx="313" by="136" ax="469" ay="37"/>
<sprite type="Joints.DistanceJoint" id="13" body1="GooBalls0" body2="GooBalls5" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="2" b1_Yoffset="5" b2_Xoffset="-2" b2_Yoffset="10" bx="241" by="355" ax="150" ay="224"/>
<sprite type="Joints.DistanceJoint" id="14" body1="GooBalls2" body2="GooBalls1" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="6" b1_Yoffset="3" b2_Xoffset="0" b2_Yoffset="1" bx="320" by="267" ax="315" ay="136"/>
<sprite type="Joints.DistanceJoint" id="15" body1="GooBalls2" body2="GooBalls0" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="4" b1_Yoffset="5" b2_Xoffset="3" b2_Yoffset="5" bx="151" by="224" ax="313" ay="138"/>
<sprite type="Joints.DistanceJoint" id="16" body1="GooBalls5" body2="GooBalls1" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="-1" b1_Yoffset="11" b2_Xoffset="0" b2_Yoffset="0" bx="320" by="266" ax="242" ay="356"/>
<sprite type="Joints.DistanceJoint" id="17" body1="GooBalls0" body2="GooBalls1" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="4" b1_Yoffset="4" b2_Xoffset="4" b2_Yoffset="1" bx="324" by="267" ax="152" ay="223"/>
<sprite type="Joints.DistanceJoint" id="18" body1="GooBalls1" body2="GooBalls7" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="4" b1_Yoffset="3" b2_Xoffset="1" b2_Yoffset="2" bx="455" by="199" ax="324" ay="269"/>
<sprite type="Joints.DistanceJoint" id="19" body1="GooBalls2" body2="GooBalls7" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="7" b1_Yoffset="2" b2_Xoffset="2" b2_Yoffset="1" bx="456" by="198" ax="316" ay="135"/>
<sprite type="Joints.DistanceJoint" id="20" body1="GooBalls3" body2="GooBalls7" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="2" b1_Yoffset="3" b2_Xoffset="2" b2_Yoffset="0" bx="456" by="197" ax="472" ay="37"/>
<sprite type="Joints.DistanceJoint" id="21" body1="GooBalls5" body2="GooBalls8" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="0" b1_Yoffset="8" b2_Xoffset="-3" b2_Yoffset="7" bx="337" by="451" ax="243" ay="353"/>
<sprite type="Joints.DistanceJoint" id="22" body1="GooBalls5" body2="GooBalls6" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="0" b1_Yoffset="6" b2_Xoffset="3" b2_Yoffset="1" bx="402" by="347" ax="243" ay="351"/>
<sprite type="Joints.DistanceJoint" id="23" body1="GooBalls1" body2="GooBalls6" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="2" b1_Yoffset="1" b2_Xoffset="2" b2_Yoffset="0" bx="401" by="346" ax="322" ay="267"/>
<sprite type="Joints.DistanceJoint" id="24" body1="GooBalls7" body2="GooBalls6" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="4" b1_Yoffset="2" b2_Xoffset="3" b2_Yoffset="1" bx="402" by="347" ax="458" ay="199"/>
<sprite type="Joints.DistanceJoint" id="25" body1="GooBalls8" body2="GooBalls6" damping="0.2" freq="4" texture_type="image" texture="goojoint.png" texture_width="40" b1_Xoffset="-1" b1_Yoffset="7" b2_Xoffset="3" b2_Yoffset="2" bx="402" by="348" ax="339" ay="451"/>
<!-- END Monster construction -->
 </level>
	"""   
	MonsterBuilder.createFromXMLString(lb,xpos,xml)
   
   
