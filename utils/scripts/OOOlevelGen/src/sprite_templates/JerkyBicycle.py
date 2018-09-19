import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
	

<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="271" y="23" width="48" height="48" angle="0" restitution="0.2" static="false" friction="0.5" density="25" sheet="6" firstframe="JerkyBicycle-smallWheel.png" setName="JerkyBicycle1" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="197" y="29" width="59" height="59" angle="0" restitution="0.2" static="false" friction="0.5" density="18" sheet="6" firstframe="JerkyBicycle-bigWheel.png" setName="JerkyBicycle0" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="260" y="65" width="20" height="92" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="JerkyBicycle3" sheet="6" firstframe="JerkyBicycle-basesupport.png" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="199" y="73" width="22" height="76" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="JerkyBicycle2" sheet="6" firstframe="JerkyBicycle-basesupport.png" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="227" y="130" width="121" height="37" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="JerkyBicycle6" sheet="6" firstframe="JerkyBicycle-base.png" classname="JerkyBicycleBrain" spritedata="JerkyBicycle" groupIndex="1"/>

<sprite shape="rect" type="Enemy.EnemySprite" x="226" y="154" width="140" height="7" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="JerkyBicycle17" sheet="6" firstframe="JerkyBicycle-seat.png" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="JerkyBicycle0" body2="JerkyBicycle2" motor_speed="-1.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="196" by="86" b2_Xoffset="-3" b2_Yoffset="13" ax="197" ay="40" b1_Xoffset="0" b1_Yoffset="11"/>
<sprite type="Joints.RevoluteJoint" id="5" body1="JerkyBicycle1" body2="JerkyBicycle3" motor_speed="-1.0" torque="1000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="260" by="96" b2_Xoffset="0" b2_Yoffset="31" ax="258" ay="26" b1_Xoffset="-13" b1_Yoffset="3"/>
<sprite type="Joints.DistanceJoint" id="7" body1="JerkyBicycle2" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="0" b2_Xoffset="-54" b2_Yoffset="-11" bx="173" by="119" ax="198" ay="73"/>
<sprite type="Joints.DistanceJoint" id="8" body1="JerkyBicycle2" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="0" b2_Xoffset="-2" b2_Yoffset="-10" bx="225" by="120" ax="198" ay="73"/>
<sprite type="Joints.DistanceJoint" id="9" body1="JerkyBicycle3" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="6" b2_Xoffset="9" b2_Yoffset="-10" bx="236" by="120" ax="258" ay="71"/>
<sprite type="Joints.DistanceJoint" id="10" body1="JerkyBicycle3" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="6" b2_Xoffset="54" b2_Yoffset="-11" bx="281" by="119" ax="258" ay="71"/>
<sprite type="Joints.DistanceJoint" id="11" body1="JerkyBicycle2" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="36" b2_Xoffset="-28" b2_Yoffset="-12" bx="199" by="118" ax="198" ay="109"/>
<sprite type="Joints.DistanceJoint" id="12" body1="JerkyBicycle3" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="43" b2_Xoffset="33" b2_Yoffset="-13" bx="260" by="117" ax="260" ay="108"/>
<sprite type="Joints.DistanceJoint" id="18" body1="JerkyBicycle2" body2="JerkyBicycle17" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="35" b2_Xoffset="35" b2_Yoffset="1" bx="261" by="155" ax="198" ay="108"/>
<sprite type="Joints.DistanceJoint" id="19" body1="JerkyBicycle3" body2="JerkyBicycle17" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="42" b2_Xoffset="-40" b2_Yoffset="1" bx="186" by="155" ax="261" ay="107"/>
<!-- END Monster construction -->


 </level>
	"""   
	idprefix = MonsterBuilder.createFromXMLString(lb,xpos,xml)
   
	lb.addObject(Enemy.EnemySprite(x=(198+xpos), y=184,width=49,height=49,angle='0',restitution=0.8,static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob1'))
	lb.addObject(Enemy.EnemySprite(x=(249+xpos), y=187,width=44,height=44,angle='0',restitution=0.8,static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob2'))
	newSpritename = str(idprefix + 'JerkyBicycle6')
 	lb.addObject(Joints.DistanceJoint(body1=newSpritename,body2='blob1',damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-31',b1_Yoffset='13',b2_Xoffset='-1',b2_Yoffset='-16'))
	lb.addObject(Joints.DistanceJoint(body1='blob2',body2=newSpritename,damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-1',b1_Yoffset='-15',b2_Xoffset='20',b2_Yoffset='13'))
	#<sprite type="Joints.DistanceJoint" id="15" body1="JerkyBicycle6" body2="blob1" damping="0.2" freq="20" collide_connected="true" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-31" b1_Yoffset="13" b2_Xoffset="-1" b2_Yoffset="-16" bx="197" by="168" ax="196" ay="143"/>
	#<sprite type="Joints.DistanceJoint" id="16" body1="blob2" body2="JerkyBicycle6" damping="0.2" freq="20" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="-15" b2_Xoffset="20" b2_Yoffset="13" bx="247" by="143" ax="248" ay="172"/>


	#<sprite shape="circ" type="Enemy.EnemySprite" x="198" y="184" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="blob1" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
	#<sprite shape="circ" type="Enemy.EnemySprite" x="249" y="187" width="44" height="44" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="blob2" classname="JerkyBicycleLimb" spritedata="JerkyBicycle" groupIndex="1"/>
	
	
	