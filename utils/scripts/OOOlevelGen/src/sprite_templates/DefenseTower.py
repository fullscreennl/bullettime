import MonsterBuilder
from sprites import *

def create(lb,xpos):
	xml = """ <level>
	

<!-- BEGIN Monster construction -->
<sprite shape="rect" type="Enemy.EnemySprite" x="209" y="17" width="185" height="16" angle="2" restitution="0.2" static="false" friction="0.5" density="10" setName="DefenseTower2" sheet="6" firstframe="DefenseTower-floor.png" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="291" y="18" width="36" height="36" angle="0" restitution="0.2" static="false" friction="0.5" density="50" sheet="6" firstframe="DefenseTower-wheel.png" setName="DefenseTower1" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="125" y="14" width="33" height="33" angle="0" restitution="0.2" static="false" friction="0.5" density="50" sheet="6" firstframe="DefenseTower-wheel.png" setName="DefenseTower0" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="206" y="88" width="154" height="8" angle="-2" restitution="0.2" static="false" friction="0.5" density="1" setName="DefenseTower5" sheet="6" firstframe="DefenseTower-floor.png" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="209" y="170" width="145" height="9" angle="-3" restitution="0.2" static="false" friction="0.5" density="1" setName="DefenseTower6" sheet="6" firstframe="DefenseTower-floor.png" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="211" y="250" width="141" height="6" angle="2" restitution="0.2" static="false" friction="0.5" density="1" setName="DefenseTower7" sheet="6" firstframe="DefenseTower-floor.png" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="206" y="340" width="93" height="7" angle="-2" restitution="0.2" static="false" friction="0.5" density="1" setName="DefenseTower8" sheet="6" firstframe="DefenseTower-floor.png" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="211" y="417" width="31" height="31" angle="0" restitution="0.2" static="false" friction="0.5" density="1" sheet="6" firstframe="circ.png" setName="DefenseTower9" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<!--
<sprite shape="circ" type="Enemy.EnemySprite" x="172" y="47" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob1" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="240" y="48" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob2" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="174" y="115" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob3" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="231" y="113" width="38" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob4" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="181" y="201" width="42" height="42" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob5" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="232" y="200" width="47" height="47" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob6" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="183" y="275" width="43" height="43" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob7" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="232" y="278" width="42" height="42" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob8" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="208" y="368" width="44" height="44" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob9" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>
-->
<sprite type="Joints.RevoluteJoint" id="3" body1="DefenseTower0" body2="DefenseTower2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="169" by="16" b2_Xoffset="-40" b2_Yoffset="-1" ax="127" ay="14" b1_Xoffset="2" b1_Yoffset="0"/>
<sprite type="Joints.RevoluteJoint" id="4" body1="DefenseTower1" body2="DefenseTower2" motor_speed="50.0" torque="1000.0" enable_motor="false" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="243" by="19" b2_Xoffset="34" b2_Yoffset="2" ax="290" ay="17" b1_Xoffset="-1" b1_Yoffset="-1"/>
<sprite type="Joints.DistanceJoint" id="10" body1="DefenseTower5" body2="DefenseTower2" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-63" b1_Yoffset="3" b2_Xoffset="-88" b2_Yoffset="3" bx="121" by="20" ax="143" ay="91"/>
<sprite type="Joints.DistanceJoint" id="11" body1="DefenseTower5" body2="DefenseTower2" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="63" b1_Yoffset="-2" b2_Xoffset="85" b2_Yoffset="9" bx="294" by="26" ax="269" ay="86"/>
<sprite type="Joints.DistanceJoint" id="12" body1="DefenseTower2" body2="DefenseTower5" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="84" b1_Yoffset="8" b2_Xoffset="-38" b2_Yoffset="2" bx="168" by="90" ax="293" ay="25"/>
<sprite type="Joints.DistanceJoint" id="13" body1="DefenseTower2" body2="DefenseTower5" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-55" b1_Yoffset="1" b2_Xoffset="31" b2_Yoffset="0" bx="237" by="88" ax="154" ay="18"/>
<sprite type="Joints.DistanceJoint" id="14" body1="DefenseTower5" body2="DefenseTower6" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-68" b1_Yoffset="3" b2_Xoffset="-67" b2_Yoffset="6" bx="142" by="176" ax="138" ay="91"/>
<sprite type="Joints.DistanceJoint" id="15" body1="DefenseTower6" body2="DefenseTower5" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="64" b1_Yoffset="-2" b2_Xoffset="62" b2_Yoffset="-1" bx="268" by="87" ax="273" ay="168"/>
<sprite type="Joints.DistanceJoint" id="16" body1="DefenseTower5" body2="DefenseTower6" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="50" b1_Yoffset="-2" b2_Xoffset="-30" b2_Yoffset="4" bx="179" by="174" ax="256" ay="86"/>
<sprite type="Joints.DistanceJoint" id="17" body1="DefenseTower5" body2="DefenseTower6" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-57" b1_Yoffset="4" b2_Xoffset="42" b2_Yoffset="1" bx="251" by="171" ax="149" ay="92"/>
<sprite type="Joints.DistanceJoint" id="18" body1="DefenseTower7" body2="DefenseTower6" damping="0.2" freq="10" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-66" b1_Yoffset="-1" b2_Xoffset="-63" b2_Yoffset="6" bx="146" by="176" ax="145" ay="249"/>
<sprite type="Joints.DistanceJoint" id="19" body1="DefenseTower7" body2="DefenseTower6" damping="0.2" freq="10" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="61" b1_Yoffset="4" b2_Xoffset="55" b2_Yoffset="-1" bx="264" by="169" ax="272" ay="254"/>
<sprite type="Joints.DistanceJoint" id="20" body1="DefenseTower6" body2="DefenseTower7" damping="0.2" freq="10" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="26" b1_Yoffset="1" b2_Xoffset="-53" b2_Yoffset="0" bx="158" by="250" ax="235" ay="171"/>
<sprite type="Joints.DistanceJoint" id="21" body1="DefenseTower7" body2="DefenseTower6" damping="0.2" freq="10" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="42" b1_Yoffset="4" b2_Xoffset="-43" b2_Yoffset="4" bx="166" by="174" ax="253" ay="254"/>
<sprite type="Joints.DistanceJoint" id="22" body1="DefenseTower8" body2="DefenseTower7" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="31" b1_Yoffset="0" b2_Xoffset="-59" b2_Yoffset="0" bx="152" by="250" ax="237" ay="340"/>
<sprite type="Joints.DistanceJoint" id="23" body1="DefenseTower7" body2="DefenseTower8" damping="0.2" freq="20" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="28" b1_Yoffset="2" b2_Xoffset="-40" b2_Yoffset="3" bx="166" by="343" ax="239" ay="252"/>
<sprite type="Joints.DistanceJoint" id="24" body1="DefenseTower8" body2="DefenseTower7" damping="0.2" freq="10" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-41" b1_Yoffset="4" b2_Xoffset="-65" b2_Yoffset="0" bx="146" by="250" ax="165" ay="344"/>
<sprite type="Joints.DistanceJoint" id="25" body1="DefenseTower8" body2="DefenseTower7" damping="0.2" freq="10" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="34" b1_Yoffset="0" b2_Xoffset="53" b2_Yoffset="4" bx="264" by="254" ax="240" ay="340"/>
<sprite type="Joints.DistanceJoint" id="26" body1="DefenseTower9" body2="DefenseTower8" damping="0.2" freq="5" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-1" b1_Yoffset="0" b2_Xoffset="-41" b2_Yoffset="3" bx="165" by="343" ax="210" ay="417"/>
<sprite type="Joints.DistanceJoint" id="27" body1="DefenseTower9" body2="DefenseTower8" damping="0.2" freq="5" texture_type="image" texture="DefenseTower-stud.png" texture_width="10" b1_Xoffset="-1" b1_Yoffset="-1" b2_Xoffset="30" b2_Yoffset="0" bx="236" by="340" ax="210" ay="416"/>
<!--
<sprite type="Joints.DistanceJoint" id="37" body1="DefenseTower5" body2="blob1" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-15" b1_Yoffset="0" b2_Xoffset="0" b2_Yoffset="-12" bx="172" by="35" ax="191" ay="88"/>
<sprite type="Joints.DistanceJoint" id="38" body1="DefenseTower5" body2="blob2" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="12" b1_Yoffset="1" b2_Xoffset="0" b2_Yoffset="-13" bx="240" by="35" ax="218" ay="89"/>
<sprite type="Joints.DistanceJoint" id="39" body1="DefenseTower6" body2="blob3" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-10" b1_Yoffset="0" b2_Xoffset="1" b2_Yoffset="-14" bx="175" by="101" ax="199" ay="170"/>
<sprite type="Joints.DistanceJoint" id="40" body1="blob4" body2="DefenseTower6" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="-13" b2_Xoffset="-15" b2_Yoffset="1" bx="194" by="171" ax="230" ay="100"/>
<sprite type="Joints.DistanceJoint" id="41" body1="DefenseTower7" body2="blob5" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-17" b1_Yoffset="0" b2_Xoffset="-1" b2_Yoffset="-14" bx="180" by="187" ax="194" ay="250"/>
<sprite type="Joints.DistanceJoint" id="42" body1="blob6" body2="DefenseTower7" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="-19" b2_Xoffset="-15" b2_Yoffset="0" bx="196" by="250" ax="232" ay="181"/>
<sprite type="Joints.DistanceJoint" id="43" body1="DefenseTower8" body2="blob7" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-4" b1_Yoffset="1" b2_Xoffset="2" b2_Yoffset="-15" bx="185" by="260" ax="202" ay="341"/>
<sprite type="Joints.DistanceJoint" id="44" body1="blob8" body2="DefenseTower8" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="-15" b2_Xoffset="-4" b2_Yoffset="1" bx="202" by="341" ax="230" ay="263"/>
<sprite type="Joints.DistanceJoint" id="45" body1="blob9" body2="DefenseTower9" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="-14" b2_Xoffset="-1" b2_Yoffset="-10" bx="210" by="407" ax="207" ay="354"/>
-->
<!-- END Monster construction -->



 </level>
	"""   
	idprefix = MonsterBuilder.createFromXMLString(lb,xpos,xml)
   
	lb.addObject(Enemy.EnemySprite(x=(172+xpos), y=47,width=38,height=38,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob1'))
	lb.addObject(Enemy.EnemySprite(x=(240+xpos), y=48,width=38,height=38,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob2'))

	lb.addObject(Enemy.EnemySprite(x=(174+xpos), y=115,width=38,height=38,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob3'))
	lb.addObject(Enemy.EnemySprite(x=(231+xpos), y=113,width=38,height=38,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob4'))
	
	lb.addObject(Enemy.EnemySprite(x=(181+xpos), y=201,width=42,height=42,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob5'))
	lb.addObject(Enemy.EnemySprite(x=(232+xpos), y=200,width=47,height=47,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob6'))
	
	lb.addObject(Enemy.EnemySprite(x=(181+xpos), y=275,width=42,height=42,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob7'))
	lb.addObject(Enemy.EnemySprite(x=(232+xpos), y=278,width=47,height=47,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob8'))

	lb.addObject(Enemy.EnemySprite(x=(208+xpos), y=368,width=44,height=44,angle='0',restitution=0.8, static='false',friction=0.5,density=3,classname='BlobSprite',firstframe='monsterblob.png' ).setName('blob9'))
	#<sprite shape="circ" type="Enemy.EnemySprite" x="208" y="368" width="44" height="44" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="blob9" classname="DefenseTowerLimb" spritedata="DefenseTower" groupIndex="1"/>

	
	
	
	
	newSpritename = str(idprefix + 'DefenseTower5')
 	lb.addObject(Joints.DistanceJoint(body1=newSpritename, body2='blob1', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-15',b1_Yoffset='0',b2_Xoffset='0',b2_Yoffset='-12'))
	lb.addObject(Joints.DistanceJoint(body1=newSpritename, body2='blob2', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='12',b1_Yoffset='1',b2_Xoffset='0',b2_Yoffset='-13'))
	newSpritename2 = str(idprefix + 'DefenseTower6')
	lb.addObject(Joints.DistanceJoint(body1=newSpritename2, body2='blob3', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-10',b1_Yoffset='0',b2_Xoffset='1',b2_Yoffset='-14'))
	lb.addObject(Joints.DistanceJoint(body2=newSpritename2, body1='blob4', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-1',b1_Yoffset='-13',b2_Xoffset='-15',b2_Yoffset='1'))
	newSpritename3 = str(idprefix + 'DefenseTower7')
	lb.addObject(Joints.DistanceJoint(body1=newSpritename3, body2='blob5', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-17',b1_Yoffset='0',b2_Xoffset='-1',b2_Yoffset='-14'))
	lb.addObject(Joints.DistanceJoint(body2=newSpritename3, body1='blob6', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='0',b1_Yoffset='-19',b2_Xoffset='-15',b2_Yoffset='0'))
	newSpritename4 = str(idprefix + 'DefenseTower8')
	lb.addObject(Joints.DistanceJoint(body1=newSpritename4, body2='blob7', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-4',b1_Yoffset='1',b2_Xoffset='2',b2_Yoffset='-15'))
	lb.addObject(Joints.DistanceJoint(body2=newSpritename4, body1='blob8', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-2',b1_Yoffset='-15',b2_Xoffset='-4',b2_Yoffset='1'))
	
	newSpritename5 = str(idprefix + 'DefenseTower9')
	#lb.addObject(Joints.DistanceJoint(body1=newSpritename4, body2='blob7', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-4',b1_Yoffset='1',b2_Xoffset='2',b2_Yoffset='-15'))
	lb.addObject(Joints.DistanceJoint(body2=newSpritename5, body1='blob9', damping='0.2',freq='10' ,texture_type='none',texture = 'rect.png', texture_width=12, b1_Xoffset='-1',b1_Yoffset='-14',b2_Xoffset='-1',b2_Yoffset='-10'))
	
	
	#<sprite type="Joints.DistanceJoint" id="43" body1="DefenseTower8" body2="blob7" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-4" b1_Yoffset="1" b2_Xoffset="2" b2_Yoffset="-15" bx="185" by="260" ax="202" ay="341"/>
	#<sprite type="Joints.DistanceJoint" id="44" body1="blob8" body2="DefenseTower8" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="-15" b2_Xoffset="-4" b2_Yoffset="1" bx="202" by="341" ax="230" ay="263"/>
	#<sprite type="Joints.DistanceJoint" id="45" body1="blob9" body2="DefenseTower9" damping="0.2" freq="20" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="-14" b2_Xoffset="-1" b2_Yoffset="-10" bx="210" by="407" ax="207" ay="354"/>


	
	
	