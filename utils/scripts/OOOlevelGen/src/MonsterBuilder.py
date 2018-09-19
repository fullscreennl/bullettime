from xml.dom.minidom import parseString
import sys
import ID

def createFromXMLString(lb,xpos,xmlString):
    id = str(ID.next())+"_"
    dom = parseString(xmlString)
    for node in dom.firstChild.getElementsByTagName('sprite'):
        args = toDict(node.attributes)
        
        ## add namespace prefix to enable use of more than one EB ##
        try:
            args['x'] = int(args['x']) + xpos
        except:
            print "no x value"
            
        try:
            args['setName'] = id+args['setName']
        except:
            print "no setName value"
            
        try:
            args['body1'] = id+args['body1']
        except:
            print "no body1 value"
            
        try:
            args['body2'] = id+args['body2']
        except:
            print "no body2 value"
            
        try:
            args['spritedata'] = id+args['spritedata']
        except:
            print "no spritedata value"
            
        print args
            
        modname = args['type'].split(".")[0]
        classname = args['type'].split(".")[1]
        mod = sys.modules['sprites.'+modname]
        print getattr(mod,classname)
        lb.addObject(getattr(mod,classname)(**args))
    return id        
        
def toDict(nodeMap):
    dict = {}
    for prop in nodeMap.keys():
        #print prop ," : " ,nodeMap[prop].value
        dict[str(prop)] = str(nodeMap[prop].value)
    #print dict
    #print "****"*23
    return dict