import config
import LevelBuilder
from sprite_templates import *
import sprite_templates
from sprites import *
import sys

raise "WARNING - this script is deprecated."

	
def renderMonster(name,nextlevel,sheet,bg):
    lb = LevelBuilder.LevelBuilder(name+".plist",background=bg)
    lb.useTexture(sheet)
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=20,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=185,y=320-60,width=128,height=100,zoom_fact=0.1666))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=350,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=185, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
    for p in range(10):
        lb.addObject(Crate.CrateSprite(x=3*100,y=16,width=32, height=32, static='false',angle=0))
    
    mod = sys.modules['sprite_templates.'+name]
    mod.create(lb,3*480)
    
    lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
    lb.addObject(Teleporter.TeleporterSprite( level_id='leveldata/'+nextlevel))
    lb.render()


def genLeader(firstLevel):
	lb = LevelBuilder.LevelBuilder("test.plist",background=None)
	lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    
	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=20,y=250,width=100,height=500,zoom_fact=1.0))
	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=185,y=320-60,width=128,height=100,zoom_fact=0.1666))
	lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=350,y=250,width=100,height=500,zoom_fact=1.0))
	lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=185, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    
	conversation = "Fok jou!#jonge!*Nee, fok jou!*aargh!*#"
	lb.addObject(Speach.Speach(x=650,y=250,width=200,height=20,msg=conversation))
	lb.addObject(Enemy.EnemySprite(x=979, y=96,width=186,height=184,angle='0',restitution=0.2,static='true',friction=0.5,density=5 , classname='BlobSprite',firstframe='monsterblob.png'))
    
	lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
	lb.addObject(Teleporter.TeleporterSprite( level_id='leveldata/'+firstLevel))
	lb.render()

prevname = ""

mt = monster_table = {}

# name-key        		sheet              		nextscene  #
########################################################
mt['Elephant'] = 		("elephantSheet",		"Snake")
mt['Snake'] = 			("monstersheet1",		"BlueMonster")
mt['BlueMonster'] = 	("monstersheet1",		"SlingerBall")
mt['SlingerBall'] = 	("monstersheet1",		"SpaceShip")
mt['SpaceShip'] =   	("monstersheet1",		"PumpkinBomber")
mt['PumpkinBomber'] =   ("monstersheet1",		"BlueBlob")
mt['BlueBlob'] =   		("monstersheet1",		"RoboCod")
mt['RoboCod'] =   		("monstersheet1",		"Snail")

mt['Snail'] =   		("monstersheet2",		"TestMonster")
mt['TestMonster'] =   	("monstersheet2",		"Walker")

mt['Walker'] =   		("monstersheet_dev",	"Bugger")
mt['Bugger'] =   		("BuggerSheet",			"Stepper")
mt['Stepper'] =   		("Stepper",				"Jumper")
mt['Jumper'] =   		("JumperSheet",			"WobblingBlob")
mt['WobblingBlob'] =   	("monstersheet_dev",	"WalkingPigTail")
mt['WalkingPigTail'] =  ("monstersheet_dev",	"Piston")
mt['Piston'] =   		("monstersheet_dev",	"MotorizedBall")
mt['MotorizedBall'] =   ("monstersheet_dev",	"JanssenWalker")

mt['JanssenWalker'] =   ("JanssenWalker",		"JibberLeg")
mt['JibberLeg'] =   	("JibberLeg",			"MeatGrinder")
mt['MeatGrinder'] =   	("MeatGrinder",			"Stryder")
mt['Stryder'] =   		("StryderSheet",		"MuppetMotion")
mt['MuppetMotion'] =   	("MuppetMotion",	"Catapult")
mt['Catapult'] =   		("Catapult",	"GooBalls")
mt['GooBalls'] =   		("GooBallsSheet",		"Caterpillar")
mt['Caterpillar'] =   	("Caterpillar",			"Slammer")
mt['Slammer'] = 		("SlammerSheet" ,		"Flunker")
mt['Flunker'] = 		("FlunkerSheet" ,		"CaterpillarVersion2")
mt['CaterpillarVersion2'] = ("Caterpillar" ,	"KingofBlobs")

mt['KingofBlobs'] =   	("KingofBlobs",			"MagicWalker")
mt['MagicWalker'] =   	("MagicWalker",	"LittleFloater")
mt['LittleFloater'] =   ("LittleFloaterSheet",	"LittleCrawler")
mt['LittleCrawler'] =   ("LittleCrawlerSheet",	"ShoveIt")
mt['ShoveIt'] =   		("ShoveIt",				"JerkyBicycle")
mt['JerkyBicycle'] =  	("JerkyBicycle",	"DefenseTower")
mt['DefenseTower'] =   	("DefenseTower",	"SteppingFucker")
mt['SteppingFucker'] =  ("SteppingFucker",		"test")

for name in mt.keys():
	print "<EB type='%s' x='200' />\n"%name

for name in mt.keys():
	prevname = name
	try:
		mt[name]
		sheetname = mt[name][0]
		next = mt[name][1]
	except:
		sheetname = "monstersheet_dev"
		next = "test"
	renderMonster(name,next,sheetname,None)
	
	
#hallo!!

genLeader("MuppetMotion")

