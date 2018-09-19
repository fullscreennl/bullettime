import os
import config
from sprites import *
from sprite_templates import *
import traceback
from xml.dom.minidom import parseString
import sys


LEVEL = """

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>scrollmode</key>
    <integer>%(scrollmode)s</integer>
    <key>level</key>
    <dict>
        <key>name</key>
        <string>level 1 test level</string>
        <!--
        <key>background</key>
        <string>%(background)s</string>
        -->
        <!-- SPRITES -->

        <key>compounds</key>
        <array>
            %(sprites)s
        </array>

        <!-- JOINTS -->

        <key>joints</key>
        <array>
            %(joints)s
        </array>

        <!-- CONTACTS -->

        <key>contacts</key>
        <array>
            %(contacts)s
        </array>
        <!-- SHEETS -->

        <key>sheets</key>
        <array>
            %(sheets)s
        </array>
        
        <!-- CANNONS -->
        
        <key>cannons</key>
        <array>
            %(cannons)s
        </array>

    </dict>
</dict>
</plist>
"""

SHEETS = """
            <dict>
                <key>atlas</key>
                <string>%(texture)s</string>
                <key>id</key>
                <integer>5</integer>
            </dict>
            <dict>
                <key>atlas</key>
                <string>%(texture2)s</string>
                <key>id</key>
                <integer>6</integer>
            </dict>
"""

#define SCROLLMODE_STANDARD 1
#define SCROLLMODE_BATTLE 2
#define SCROLLMODE_LEFT 3
#define SCROLLMODE_RIGHT 4

class LevelBuilder:
    def __init__(self,filename,background='bg.png',scrollmode=1):
        self.background = background
        self.filename = filename
        self.scrollmode = scrollmode
        self.object_id = 0
        self.objects = [];
        self.sprites = ""
        self.joints = ""
        self.contacts = ""
        self.cannons = ""
        self.texture = "main_texture"
        self.texture2 = "monstersheet_dev"
        #self.texture2 = "monstersheet1"
        self.contact_filter = {}
        
    def useTexture(self,texturename):
        self.texture2 = "EB_textures/"+texturename

    def build(self):
        for obj in self.objects:
            xml = obj.render()
            self.sprites += xml[0]
            self.joints += xml[1]
            
            try:
                self.cannons += xml[3]
                print self.cannons
            except:
                #print "no cannons"
                pass
            
            try:
                self.contact_filter[xml[2]]
            except:
                self.contacts += xml[2]
                self.contact_filter[xml[2]] = True

    def addJointXML(self,xml):
        self.joints += xml
        
    def addContactXML(self,xml):
        self.contacts += xml
        
    def next(self):
        self.object_id += 1
        return self.object_id

    def addObject(self,obj):
        self.objects.append(obj)

    def render(self):
        self.build()
        xml =  LEVEL%{'scrollmode':self.scrollmode,
                      'background':self.background,
                      'sprites':self.sprites,
                      'joints':self.joints,
                      'sheets':SHEETS%{'texture':self.texture, 'texture2':self.texture2},
                      'contacts':self.contacts,
                      'cannons':self.cannons}
        #print xml
        f = open(config.EXPORT_PATH+self.filename,'w')
        f.write(xml)
        f.close()
        if config.USE_BINARY_PLIST:
            self.convert(config.EXPORT_PATH+self.filename)
        
    def convert(self,file):
        command = "/usr/bin/plutil -convert binary1 "+config.EXPORT_PATH+self.filename
        try:
            print command
            plutil = os.popen(command, "r")
            print plutil.readlines()
            status = plutil.close()
            if status:
                raise IOError("plist conversion failed (status %d)" % status)
        except:
            traceback.print_exc(file=self)
            
    def write(self,msg):
        print msg
        
        
class XMLLevelBuilder(LevelBuilder):
	
	def renderWithXML(self,xml):
	
		dom = parseString(xml)

		self.useTexture(dom.firstChild.attributes['texture'].value)
		
		for node in dom.firstChild.getElementsByTagName('sprite'):
			args = self.toDict(node.attributes)
			try:
				#args['x'] = int(args['x']) + 3*480
				args['x'] = int(args['x'])
			except:
				print "no x value"
			modname = args['type'].split(".")[0]
			classname = args['type'].split(".")[1]
			mod = sys.modules['sprites.'+modname]
			print getattr(mod,classname)
			self.addObject(getattr(mod,classname)(**args))
			
			print "==="*20
			
		for node in dom.firstChild.getElementsByTagName('joint'):
			args = self.toDict(node.attributes)
			try:
				#args['x'] = int(args['x']) + 3*480
				args['x'] = int(args['x'])
			except:
				print "no x value"
			modname = args['type'].split(".")[0]
			classname = args['type'].split(".")[1]
			mod = sys.modules['sprites.'+modname]
			print getattr(mod,classname)
			self.addObject(getattr(mod,classname)(**args))
			
			print "==="*20
		
		for node in dom.firstChild.getElementsByTagName('EB'):
			args = self.toDict(node.attributes)
			try:
				args['x'] = int(args['x']) - 250
			except:
				print "no x value"
			modname = args['type']
			mod = sys.modules['sprite_templates.'+modname]
			print mod
                        print getattr(mod,"create")
			try:
                            print args
                            print args['pass_args']
                            getattr(mod,"create")(self,args['x'],args)
			except:
                            getattr(mod,"create")(self,args['x'])
			
			print ">>>"*20
			
		self.render()
		
	def toDict(self,nodeMap):
		dict = {}
		for prop in nodeMap.keys():
			#print prop ," : " ,nodeMap[prop].value
			dict[str(prop)] = str(nodeMap[prop].value)
		#print dict
		#print "****"*23
		return dict




if __name__ == "__main__":

	#test plain levelbuilder
	if 0:
		lb = LevelBuilder("level_36.plist")
		lb.useTexture("level_1_texture")
		lb.addObject(Rotor.RotorSprite(x=180,y=110,speed=5,torque=10000))
		#lb.addObject(Rotor.RotorSprite(x=100,y=60,speed=5,torque=10000))
		#lb.addObject(Rotor.RotorSprite(x=300,y=200,speed=20,torque=10000))
		lb.addObject(Hero.HeroSprite(x=20,y=10))
		lb.addObject(Launcher.LauncherSprite(name='__launcher__1',x=260, y=50, trigger_x=400, trigger_y=100))
		lb.addObject(Launcher.LauncherSprite(name='__launcher__2',x=100, y=50, trigger_x=300, trigger_y=100))
		lb.addObject(Launcher.LauncherSprite(name='__launcher__3',x=300, y=250, trigger_x=50, trigger_y=300))
		#lb.addObject(Enemy.EnemySprite(x=160,y=300,width=15,height=15))
		lb.addObject(Friend.FriendSprite(x=50,y=160,width=50,height=50))
		lb.addObject(SpikeyBuddy.SpikeyBuddySprite(x=50,y=80,width=50,height=50))
		lb.addObject(Enemy.EnemySprite(x=300,y=100,width=50,height=50))
		lb.addObject(Star.StarSprite(x=100,y=100,width=20,height=20))
		#lb.addObject(Wizard.WizardSprite(x=300,y=50))
		lb.addObject(Wizard.WizardSprite(x=25,y=50))
		lb.render()
		
	#test XML levelBuilder	
	if 1:
	
		"""
					<!-- Joints -->
					
					<joint type='Joints.DistanceJoint' 
									id='J6' 
									body1='edge_1' 
									body2='edge_2' 
									damping='0.2' 
									freq='20'  
									texture_type='image' 
									texture = 'rect.png'  
									texture_width='20' 
									b1_Xoffset='0' 
									b1_Yoffset='0' 
									b2_Xoffset='0' 
									b2_Yoffset='0'/>
									
					<joint type='Joints.RevoluteJoint' 
									id='J6' 
									body1='edge_1' 
									body2='edge_2' 
									motor_speed='50.0'
									torque='1000.0'
									enable_motor='false'
									lower_angle='12'
									upper_angle='45'
									enable_limit='false' 
									collide_connected='false'
									/>
									
					<joint type='Joints.PrismaticJoint' 
									id='J6' 
									body1='edge_1'  
									motor_speed='50.0'
									torque='1000.0'
									enable_motor='false'
									lower_translation='-100'
									upper_translation='100'
									enable_limit='true' 
									vertical='false'
									/>
									
					<sprite type = 'Hero.HeroSprite' x='55' y='40'/>
					<sprite type = 'Bullet.BulletSprite' x='0' y='0' width='10' height='10' angle='0' restitution='0.5' static='false' friction='0.5' density='3' spawnEvent='onShoot'/>

					<!-- alerts -->
					<sprite type = 'Alert.Alert' x='215' y='250' width='100' height='500' name='ImageAlert' msg='pickupsexplained.png'/>
					
					<!-- enemies -->
					<sprite type = 'Enemy.EnemySprite' x='387'  y='56' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' classname='BlobSprite' firstframe='monsterblob.png'/>
					<sprite type = 'Enemy.EnemySprite' x='287'  y='56' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' classname='PumpkinSprite' firstframe='pumpkin.png'/>
					<sprite type = 'Enemy.EnemySprite' x='587'  y='56' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' classname='LoveAlienSprite' firstframe='lovable_alien.png'/>
					<sprite type = 'Enemy.EnemySprite' x='687'  y='56' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' shape='rect'  classname='SquareBlobSprite' firstframe='square_monsterblob.png'/>
					<sprite type = 'Enemy.EnemySprite' x='987'  y='56' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' />
					<sprite type = 'EnemyEquipedRotor.EnemyEquipedRotorSprite' x='1300' y='200' speed='200' beam_length='250' torque='1000' />	
					
					<!-- pickups -->
					<sprite type = 'Crate.CrateSprite' x='718' y='16' width='32'  height='32'  static='false' angle='0'/>
					<sprite type = 'BulletTimePickup.BulletTimePickupSprite' x='1314' y='18' width='32'  height='32'  static='false' angle='0' />
					<sprite type = 'Pickup.PickupSprite' x='672' y='17' width='32'  height='32'  static='false' angle='0'/>
					
					<!-- TODO: what about bar_long.png-->
					<sprite type = 'Beam.BeamSprite' x='1538'  y='68' width='128' height='80' angle='-90'  restitution='0.2' static='false' friction='0.5' density='5' />
					<sprite type = 'Beam.BeamSprite' x='1538'  y='68' width='10' height='10' angle='-90'  restitution='0.2' static='true' friction='0.5' density='5' classname='SimpleScrollStrategySprite' />
					<sprite type = 'Beam.BeamSprite' x='2508'  y='97' width='240' height='36' angle='0'  restitution='0.2' static='false' friction='0.5' density='20' classname='Destructable' firstframe ='brittle_brick.png'  setName= 'dBeam'/>
					<sprite type = 'Friend.FriendSprite' x='836'  y='422' width='128' height='128' angle='0' restitution='0.2' static='false' friction='0.5' density='1'  firstframe ='boulder.png' setName='Friend' />
					<sprite type = 'Nut.NutSprite'  x='600' y='200' />
					<sprite type = 'Bomb.BombSprite' x='500' y='10' width='100' height='100' /><!-- TODO:include texture in main sheet -->
					
					<!-- conversations -->
					<sprite type = 'Speach.Speach' x='650' y='250' width='200' height='20' msg='Fok jou!#jonge!*Nee, fok jou!*aargh!*#'/>
					
					<!-- cannon -->
					<sprite type = 'Friend.FriendSprite' x='836'  y='422' width='128' height='128' angle='0' restitution='0.2' static='false' friction='0.5' density='1'  spawnEvent = 'onCreateBoulder' firstframe ='boulder.png' setName='Friend' />
					<sprite type = 'Cannon.Cannon' event='onCreateBoulder' freq='120' max='25'/>
					
					<!-- contacts / events -->
					<sprite type = 'Contacts.Contact' body1='b2' body2='b1' event_name='onCustomEvent' />
					<sprite type = 'EventTrigger.EventTrigger' x='2665' y='250' width='100' height='500' msg='onLevelCleared' eventName='onEventTriggerHit' />

					<!-- info sign / watchtower/ teleporter -->
					<sprite type = 'Visual.VisualSprite' x='300' y='25' width='250' height='50' firstframe='sign.png' msg='Psst! Remember,#aim for the fireballs. >>'/>
					<EB type = 'Watchtower' x='200'/>
					<sprite type = 'Teleporter.TeleporterSprite'  level_id='leveldata/test'/>
					
					<!-- monsters -->
					<EB type='Slammer' x='200' />
					<EB type='MuppetMotion' x='200' />			
					<EB type='DefenseTower' x='200' />					
					<EB type='SlingerBall' x='200' />		
					<EB type='MotorizedBall' x='200' />			
					<EB type='Stepper' x='200' />			
					<EB type='GooBalls' x='200' />			
					<EB type='WobblingBlob' x='200' />			
					<EB type='TestMonster' x='200' />			
					<EB type='Elephant' x='200' />			
					<EB type='Piston' x='200' />			
					<EB type='Jumper' x='200' />		
					<EB type='Catapult' x='200' />	
					<EB type='Snail' x='200' />	
					<EB type='MeatGrinder' x='200' />	
					<EB type='BlueMonster' x='200' />
					<EB type='JibberLeg' x='200' />
					<EB type='SteppingFucker' x='200' />
					<EB type='Caterpillar' x='200' />
					<EB type='ShoveIt' x='200' />
					<EB type='Snake' x='200' />
					<EB type='PumpkinBomber' x='200' />
					<EB type='KingofBlobs' x='200' />
					<EB type='WalkingPigTail' x='200' />
					<EB type='JerkyBicycle' x='200' />
					<EB type='JanssenWalker' x='200' />
					<EB type='Walker' x='200' />
					<EB type='BlueBlob' x='200' />
					<EB type='Stryder' x='200' />
					<EB type='LittleCrawler' x='200' />
					<EB type='Bugger' x='200' />
					<EB type='CaterpillarVersion2' x='200' />
					<EB type='LittleFloater' x='200' />
					<EB type='MagicWalker' x='200' />
					<EB type='Flunker' x='200' />
					<EB type='SpaceShip' x='200' />
					<EB type='RoboCod' x='200' />
		"""
		
		#lb.addObject(Beam.BeamSprite(x=600+240, y=10,width=500,height=30,angle='0',restitution=0.2,static='true',friction=0.5,density=20,classname='SimpleScrollStrategySprite').setName('Beam'))
		
		lb = XMLLevelBuilder("test.plist",background="test.png")
		xml = """<level texture="monstersheet1">
		
					<sprite type = 'Hero.HeroSprite' x='55' y='40'/>
					<sprite type = 'Bullet.BulletSprite' x='0' y='0' width='10' height='10' angle='0' restitution='0.5' static='false' friction='0.5' density='3' spawnEvent='onShoot'/>	
					
					<sprite type = 'Enemy.EnemySprite' x='687'  y='56' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' shape='rect' classname='SquareBlobSprite' firstframe='square_monsterblob.png' setName='b1'/>
					<sprite type = 'BulletTimePickup.BulletTimePickupSprite' x='1000' y='16' width='32'  height='32'  static='false' angle='0' setName='b2'/>
					
					<sprite type='Joints.DistanceJoint' 
									id='J6' 
									body1='b1' 
									body2='b2' 
									damping='0.2' 
									freq='20'  
									texture_type='line' 
									texture = 'rect.png'  
									texture_width='20' 
									b1_Xoffset='0' 
									b1_Yoffset='0' 
									b2_Xoffset='0' 
									b2_Yoffset='0'/>
									
					<sprite type = 'Alert.Alert' x='215' y='250' width='100' height='500' msg='blah&#xD;blah&#xD;blah&#xD;blah'/>
					<EB type='Conversation' x='200' pass_args='1' msg='blah&#xD;blah&#xD;blah&#xD;blah'/>
					
					<sprite type = 'Teleporter.TeleporterSprite'  level_id='leveldata/test'/>
					
				</level>"""
		lb.renderWithXML(xml)
		
		
		
