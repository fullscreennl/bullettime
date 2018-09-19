import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="287" y="165" width="109" height="22" angle="0" restitution="0.2" static="false" friction="1.0" density="5" setName="Flunker2" sheet="6" firstframe="FlunkerTail.png" classname="FlunkerLimb" spritedata="Flunker" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="218" y="167" width="79" height="79" angle="0" restitution="0.2" static="false" friction="1.0" density="5" sheet="6" firstframe="FlunkerHead.png" setName="Flunker1" classname="FlunkerBrain" spritedata="Flunker" groupIndex="-1"/>
<sprite type="Joints.RevoluteJoint" userData='FlunkerMotor' id="3" body1="Flunker2" body2="Flunker1" motor_speed="5.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="192" by="167" b2_Xoffset="-26" b2_Yoffset="0" ax="242" ay="167" b1_Xoffset="-45" b1_Yoffset="2" groupIndex="-1"/>
<!-- END Monster construction -->
 </level>
	"""   
	MonsterBuilder.createFromXMLString(lb,xpos,xml)

   
   
