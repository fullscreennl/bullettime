import os
import re

levels = []

prev = "start"
prev_s = 0

#<sprite type="Teleporter.TeleporterSprite" level_id="leveldata/menu"/>
#<sprite type="Teleporter.TeleporterSprite" level_id="leveldata/level_4_4_1"/>

levelmap = []

for e in range(10):
    for l in range(10):
        for s in range(3):
            if prev_s > 1:
                levelspec = (prev,"menu")
            else:
                levelspec = (prev,"level_"+str(e)+"_"+str(l)+"_"+str(s))
            levelmap.append(levelspec)
            prev_s = s
            prev =  str(e)+"_"+str(l)+"_"+str(s)

levelmap = levelmap[1:]
levelmap.append(("9_9_2",",menu"))

#print levelmap
#print len(levelmap)

if __name__ == "__main__":
    levels_in_file = []
    neworder = open("orderedlevels.txt","r")
    for line in neworder.readlines():
        line = line.replace("\n","")
        command = line.split(",")
        if command[0] != "" and command[1] != "x_x_x":
            if command[1] in levels_in_file:
                print "double ",command[1]
            else:
                levels_in_file.append(command[1])


    #print levelmap
    #print levels_in_file

    for l in levelmap:
        if l[0] not in levels_in_file:
            print l[0]

