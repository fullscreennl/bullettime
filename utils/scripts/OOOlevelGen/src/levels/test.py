from LevelBuilder import XMLLevelBuilder
from sprites import  *
from sprite_templates import *

def render(name,bg):
	lb = XMLLevelBuilder("test.plist",background="test.png")
	xml = """
			<level texture='monstersheet1'>
			<sprite type = 'Hero.HeroSprite' x='55' y='40'/>
			<sprite type = 'Bullet.BulletSprite' x='0' y='0' width='10' height='10' angle='0' restitution='0.5' static='false' friction='0.5' density='3' spawnEvent='onShoot'/>
			
			<!-- BEGIN Monster construction -->
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="237" y="358" width="71" height="71" angle="0" restitution="0.2" static="true" friction="0.5" density="5" setName="Sprite_1"/>
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="872" y="359" width="77" height="76" angle="0" restitution="0.2" static="true" friction="0.5" density="5" setName="Sprite_7"/>
			<sprite visual="boulder.png" type="Friend.FriendSprite" controll_level="5" x="286" y="261" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" firstframe="boulder.png" setName="Sprite_2"/>
			<sprite visual="boulder.png" type="Friend.FriendSprite" controll_level="5" x="377" y="177" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" firstframe="boulder.png" setName="Sprite_3"/>
			<sprite visual="boulder.png" type="Friend.FriendSprite" controll_level="5" x="485" y="147" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" firstframe="boulder.png" setName="Sprite_4"/>
			<sprite visual="boulder.png" type="Friend.FriendSprite" controll_level="5" x="618" y="165" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" firstframe="boulder.png" setName="Sprite_5"/>
			<sprite visual="boulder.png" type="Friend.FriendSprite" controll_level="5" x="713" y="200" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" firstframe="boulder.png" setName="Sprite_6"/>
			<sprite visual="boulder.png" type="Friend.FriendSprite" controll_level="5" x="797" y="262" width="49" height="49" angle="0" restitution="0.2" static="false" friction="0.5" density="1" firstframe="boulder.png" setName="Sprite_8"/>
			<EB visual="watchtower.png" type="Watchtower" x="900" width="500" height="500" controll_level="1" y="251"/>
			<sprite visual="pumpkin.png" type="Enemy.EnemySprite" controll_level="5" x="235" y="429" width="67" height="67" angle="0" restitution="0.2" static="false" friction="0.5" density="5" classname="PumpkinSprite" firstframe="pumpkin.png"/>
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="1369" y="105" width="70" height="213" angle="0" restitution="0.2" static="false" friction="0.5" density="5"/>
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="1517" y="78" width="55" height="158" angle="0" restitution="0.2" static="false" friction="0.5" density="5"/>
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="1414" y="240" width="55" height="158" angle="89" restitution="0.2" static="true" friction="0.5" density="5"/>
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="1774" y="117" width="55" height="158" angle="89" restitution="0.2" static="false" friction="0.5" density="5"/>
			<sprite visual="rect.png" type="Beam.BeamSprite" controll_level="6" x="1668" y="30" width="55" height="158" angle="89" restitution="0.2" static="false" friction="0.5" density="5"/>
			<sprite visual="monsterblob.png" type="Enemy.EnemySprite" controll_level="5" x="1447" y="37" width="58" height="58" angle="0" restitution="0.2" static="false" friction="0.5" density="5" classname="BlobSprite" firstframe="monsterblob.png"/>
			<joint type="Joints.DistanceJoint" id="0" body1="Sprite_2" body2="Sprite_1" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="-11" b1_Yoffset="7" b2_Xoffset="-20" b2_Yoffset="-5" bx="217" by="353" ax="275" ay="268"/>
			<joint type="Joints.DistanceJoint" id="1" body1="Sprite_3" body2="Sprite_2" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="-15" b1_Yoffset="8" b2_Xoffset="13" b2_Yoffset="-7" bx="299" by="254" ax="362" ay="185"/>
			<joint type="Joints.DistanceJoint" id="2" body1="Sprite_3" body2="Sprite_4" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="12" b1_Yoffset="3" b2_Xoffset="-15" b2_Yoffset="1" bx="470" by="148" ax="389" ay="180"/>
			<joint type="Joints.DistanceJoint" id="3" body1="Sprite_4" body2="Sprite_5" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="13" b1_Yoffset="1" b2_Xoffset="-14" b2_Yoffset="-4" bx="604" by="161" ax="498" ay="148"/>
			<joint type="Joints.DistanceJoint" id="4" body1="Sprite_5" body2="Sprite_6" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="13" b1_Yoffset="1" b2_Xoffset="-12" b2_Yoffset="0" bx="701" by="200" ax="631" ay="166"/>
			<joint type="Joints.DistanceJoint" id="5" body1="Sprite_8" body2="Sprite_7" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="15" b1_Yoffset="8" b2_Xoffset="-25" b2_Yoffset="-25" bx="847" by="334" ax="812" ay="270"/>
			<joint type="Joints.DistanceJoint" id="6" body1="Sprite_6" body2="Sprite_8" damping="0.2" freq="20" texture_type="line" texture="rect.png" texture_width="20" b1_Xoffset="13" b1_Yoffset="7" b2_Xoffset="-14" b2_Yoffset="-4" bx="783" by="258" ax="726" ay="207"/>
			<!-- END Monster construction -->
			
			<sprite type = 'Teleporter.TeleporterSprite'  level_id='leveldata/test'/>
			</level>"""

	lb.renderWithXML(xml)