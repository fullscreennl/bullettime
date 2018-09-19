import re

def swapLevels(a, b):

    f = open("level_source/level_"+a+".xml")
    xmla = f.read()
    f.close()

    f2 = open("level_source/level_"+b+".xml")
    xmlb = f2.read()
    f2.close()

    exita =  re.findall(r'(level_id.+\>)', xmla)[0]
    exitb =  re.findall(r'(level_id.+\>)', xmlb)[0]

    outxmla = re.sub(r'(level_id.+\>)', exitb , xmla)
    outxmlb = re.sub(r'(level_id.+\>)', exita , xmlb)

    newa = open("level_source/level_"+a+".xml","w")
    newa.write(outxmlb)
    newa.close()

    newb = open("level_source/level_"+b+".xml","w")
    newb.write(outxmla)
    newb.close()

if __name__ == "__main__":
    swapLevels("7_4_2","9_3_0")
