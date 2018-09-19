raise "Level templates already generated."

template = """
<level texture='monstersheet1'>
	<sprite type = 'Hero.HeroSprite' x='55' y='40'/>
	<sprite type = 'Bullet.BulletSprite' x='0' y='0' width='10' height='10' angle='0' restitution='0.5' static='false' friction='0.5' density='3' spawnEvent='onShoot'/>		
	<sprite type = 'Teleporter.TeleporterSprite'  level_id='leveldata/%(exit_level)s'/>
</level>
"""  



objc = """[level_dict setObject:[NSArray arrayWithObjects:@"leveldata/%(levelname)s",@"%(levelname)s#BulletTime#End of the world party",@"visual.png",[NSNumber numberWithInteger:200],deafaultBGFormat,nil] forKey:@"%(level_ind)s"];"""
    
prevlevel = "level_9_9_2"
levelname = "" 
levelnames = []
prevscene = 0

WRITE_FILES = 1

counter = 0
    
for episode in range(10):
	print "//////////////////////"
	print "// episode: ",episode
	print "//////////////////////" 
	for level in range(10):
		print "// level: ",episode,"_",level
		for scene in range(3):
			ep = str(episode)
			le = str(level)
			sc = str(scene)
			levelname = "level_"+ep+"_"+le+"_"+sc
			if prevscene == 2:
				if counter > 49:
					xml = template%{"exit_level":"menu2"}
				else:
					xml = template%{"exit_level":"menu"}
			else:
				xml = template%{"exit_level":levelname}
			if WRITE_FILES:
				f = open("level_source/"+prevlevel+".xml",'w')
				f.write(xml)
				f.close()
			prevlevel = levelname
			prevscene = scene
			if scene == 0:
				print objc%{"level_ind":counter,"levelname":levelname}
				counter += 1
			
			