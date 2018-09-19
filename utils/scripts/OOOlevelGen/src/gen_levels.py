from LevelBuilder import XMLLevelBuilder
import os

level_source = "level_source"
#level_source = "ordered_level_source"

for level in os.listdir(level_source):
	print level
	if ".xml" in level:
		xmlfile = open(level_source+"/"+level,"r")
		xml = xmlfile.read()
		name = level.split(".")[0]
		lb = XMLLevelBuilder(name+".plist")	
		lb.renderWithXML(xml)
