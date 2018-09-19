import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
	<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="296" y="116" width="68" height="123" angle="0" restitution="0.2" static="false" friction="0.5" density="1" setName="Slammer0" sheet="6" firstframe="SlammerSpine.png" classname="SlammerRotor" spritedata="Slammer" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="175" y="25" width="53" height="53" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="SlammerFoot.png" setName="Slammer1" classname="SlammerBrain" spritedata="Slammer" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="415" y="27" width="54" height="54" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="SlammerFoot.png" setName="Slammer2" classname="SlammerBrain" spritedata="Slammer" groupIndex="-1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="293" y="150" width="147" height="16" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="Slammer3" sheet="6" firstframe="SlammerArm.png" classname="SlammerRotor" spritedata="Slammer" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="421" y="151" width="48" height="48" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="SlammerHand.png" setName="Slammer4" classname="SlammerLimb" spritedata="Slammer" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="152" y="152" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="SlammerHand.png" setName="Slammer5" classname="SlammerLimb" spritedata="Slammer" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="293" y="215" width="59" height="59" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="SlammerHead.png" setName="Slammer6" classname="SlammerLimb" spritedata="Slammer" groupIndex="-1"/>
<sprite type="Joints.RevoluteJoint" id="7" body1="Slammer1" body2="Slammer0" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="282" by="76" b2_Xoffset="-14" b2_Yoffset="-40" ax="176" ay="26" b1_Xoffset="1" b1_Yoffset="1"/>
<sprite type="Joints.RevoluteJoint" id="8" body1="Slammer2" body2="Slammer0" motor_speed="1.0" torque="100000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="304" by="78" b2_Xoffset="8" b2_Yoffset="-38" ax="414" ay="30" b1_Xoffset="-1" b1_Yoffset="3"/>
<sprite type="Joints.RevoluteJoint" id="9" body1="Slammer3" body2="Slammer0" motor_speed="2.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="315" by="111" b2_Xoffset="19" b2_Yoffset="-5" ax="294" ay="151" b1_Xoffset="1" b1_Yoffset="1"/>
<sprite type="Joints.DistanceJoint" id="10" body1="Slammer3" body2="Slammer4" damping="0.2" freq="50" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="59" b1_Yoffset="1" b2_Xoffset="-14" b2_Yoffset="-1" bx="407" by="150" ax="352" ay="151"/>
<sprite type="Joints.DistanceJoint" id="11" body1="Slammer5" body2="Slammer3" damping="0.2" freq="50" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="16" b1_Yoffset="-1" b2_Xoffset="-65" b2_Yoffset="1" bx="228" by="151" ax="168" ay="151"/>
<sprite type="Joints.DistanceJoint" id="12" body1="Slammer0" body2="Slammer6" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="-17" b1_Yoffset="57" b2_Xoffset="1" b2_Yoffset="1" bx="294" by="216" ax="279" ay="173"/>
<sprite type="Joints.DistanceJoint" id="13" body1="Slammer0" body2="Slammer6" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="12" b1_Yoffset="57" b2_Xoffset="0" b2_Yoffset="1" bx="293" by="216" ax="308" ay="173"/>
<sprite type="Joints.DistanceJoint" id="1" body1="Slammer0" body2="Slammer1" damping="0.2" freq="1" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="-3" b1_Yoffset="-53" b2_Xoffset="1" b2_Yoffset="1" bx="176" by="26" ax="293" ay="63"/>
<sprite type="Joints.DistanceJoint" id="2" body1="Slammer2" body2="Slammer0" damping="0.2" freq="1" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="3" b2_Xoffset="-3" b2_Yoffset="-53" bx="293" by="63" ax="414" ay="30"/>
<!-- END Monster construction -->
 </level>
	"""   
	MonsterBuilder.createFromXMLString(lb,xpos,xml)
   
   
