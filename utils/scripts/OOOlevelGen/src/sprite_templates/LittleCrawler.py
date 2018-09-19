import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="234" y="20" width="39" height="39" angle="0" restitution="0.2" static="false" friction="1.0" density="50" sheet="6" firstframe="Crawler_wheel.png" setName="LittleCrawler0" classname="LittleCrawlerLimb" spritedata="LittleCrawler" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="268" y="32" width="64" height="64" angle="0" restitution="0.2" static="false" friction="0.1" density="1" sheet="6" firstframe="Crawler_body.png" setName="LittleCrawler1" classname="LittleCrawlerBrain" spritedata="LittleCrawler" groupIndex="-1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="299" y="19" width="34" height="34" angle="0" restitution="0.2" static="false" friction="1.0" density="50" sheet="6" firstframe="Crawler_wheel.png" setName="LittleCrawler2" classname="LittleCrawlerLimb" spritedata="LittleCrawler" groupIndex="-1"/>
<sprite type="Joints.RevoluteJoint" id="3" body1="LittleCrawler0" body2="LittleCrawler1" motor_speed="5.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="249" by="39" b2_Xoffset="-19" b2_Yoffset="7" ax="222" ay="17" b1_Xoffset="-12" b1_Yoffset="-3"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="LittleCrawler2" body2="LittleCrawler1" motor_speed="5.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="288" by="40" b2_Xoffset="20" b2_Yoffset="8" ax="308" ay="24" b1_Xoffset="9" b1_Yoffset="5"/>
<sprite type="Joints.DistanceJoint" id="5" body1="LittleCrawler0" body2="LittleCrawler1" damping="0.2" freq="1" texture_type="image" texture="Crawler_joints.png" texture_width="30" b1_Xoffset="-12" b1_Yoffset="-3" b2_Xoffset="0" b2_Yoffset="2" bx="268" by="34" ax="222" ay="17"/>
<sprite type="Joints.DistanceJoint" id="6" body1="LittleCrawler2" body2="LittleCrawler1" damping="0.2" freq="1" texture_type="image" texture="Crawler_joints.png" texture_width="30" b1_Xoffset="9" b1_Yoffset="4" b2_Xoffset="-1" b2_Yoffset="2" bx="267" by="34" ax="308" ay="23"/>
<!-- END Monster construction -->
 </level>
	"""   
	MonsterBuilder.createFromXMLString(lb,xpos,xml)

   
   
