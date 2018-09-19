import config
#import Image
#import ImageDraw
#import ImageFont

level_template = """
		<dict>
			<key>id</key>
			<string>%(name)s</string>
			<key>score</key>
			<integer>0</integer>
			<key>pic</key>
			<string>%(name)s.png</string>
			<key>levelTitle</key>
			<string>%(title)s</string>
			<key>par</key>
			<integer>%(par)s</integer>
			<key>tbl</key>
			<integer>%(tbl)s</integer>
		</dict>
"""

levels_to_render = [
				    ("menu", 4,60,"yellow_bg.png"),
				    ("menu2", 4,60,"yellow_bg.png"),
				    ("menu3", 4,60,"yellow_bg.png"),
				     ("menu_walkback", 4,60,"yellow_bg.png"),
				     ("menu_2_walkback", 4,60,"yellow_bg.png"),
				     ("menu_2_walkto", 4,60,"yellow_bg.png"),
				     ("menu_3_walkto", 4,60,"yellow_bg.png")

				    ]

#level_data = open("gameprogress_template.plist").read()
#generated_levels = ""

def generatePreviewImage(name):
	im = Image.new('RGB',(240,160),(0,0,0))
	draw = ImageDraw.Draw(im)
	font = ImageFont.truetype("fonts/BudmoJiggler.TTF", 10)
	draw.text((10, 25), name, font=font)
	im.save(config.EXPORT_PATH+name+".png")


for l in levels_to_render:
	module = __import__("levels."+l[0],globals(), locals(), [l[0]], -1)
	#print module
	level_name =  l[0]
	#generatePreviewImage(level_name)
	level_title = level_name.replace("_"," ")
	module.render(level_name,l[3])

	#generated_levels += level_template%{'name':level_name, 'title':level_title, 'par':l[1], 'tbl':l[2]}

#level_data =  level_data%{'levels':generated_levels}


#game_progress_output = open(config.GAMEPROGRESS_PATH+"gameprogress.plist",'w')
#game_progress_output.write(level_data)
#game_progress_output.close()
