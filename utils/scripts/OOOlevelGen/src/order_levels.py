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
c = 0
level_id = 0
for item in levelmap:
    print item," : ",c
    c += 1
    if c%3 == 0:
        level_id += 1

def genLevelsForPosition(inputname, index):
    leveltup = levelmap[index]
    f = open("level_source/level_"+inputname+".xml")
    xml = f.read()

    outfile = open("ordered_level_source/level_"+leveltup[0]+".xml","w")
    rep = """level_id="leveldata/"""+leveltup[1]+"""\"/>"""
    outxml = re.sub(r'(level_id.+\>)', rep , xml)
    #print  re.findall(r'(level_id.+\>)', xml)
    print inputname , "-->",index, "-->",leveltup[0]
    outfile.write(outxml)
    f.close()
    outfile.close()
    

def test():
    genLevelsForPosition("3_3_1",2)
    genLevelsForPosition("6_3_1",0)
    genLevelsForPosition("7_3_1",45)
"""
for l in range(300):
    print str(l)+",x_x_x"
    if (l+1)%3 == 0:
        print "\n"
"""

if __name__ == "__main__":
    neworder = open("orderedlevels.txt","r")
    for line in neworder.readlines():
        line = line.replace("\n","")
        command = line.split(",")
        if command[0] != "" and command[1] != "x_x_x":
            genLevelsForPosition(command[1],int(command[0]))




