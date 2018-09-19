import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="243" y="67" width="144" height="18" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="LittleFloater1" sheet="6" firstframe="floater_stick.png" classname="LittleFloaterLimb" spritedata="LittleFloater" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="241" y="37" width="79" height="79" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="floater_body.png" setName="LittleFloater0" classname="LittleFloaterBrain" spritedata="LittleFloater" groupIndex="-1"/>
<sprite type="Joints.RevoluteJoint" id="2" body1="LittleFloater1" body2="LittleFloater0" motor_speed="50.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="242" by="8" b2_Xoffset="1" b2_Yoffset="-29" ax="242" ay="71" b1_Xoffset="-1" b1_Yoffset="4"/>
<!-- END Monster construction -->
 </level>
	"""   
	MonsterBuilder.createFromXMLString(lb,xpos,xml)

   
   
