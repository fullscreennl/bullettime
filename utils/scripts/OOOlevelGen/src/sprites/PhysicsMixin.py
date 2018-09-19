import sys
sys.path.append("..")

class PhysicsMixin:
    
    def addDefault(self,key,defaultValue):
        try:
            self.params[key]
        except:
            self.params[key] = defaultValue

    def process(self,args):
        
        try:
            self.params['spawnframe'] =  args['spawnframe']
        except:
            self.params['spawnframe'] = 0
            
        try:
            self.params['spawnEvent'] =  args['spawnEvent']
            self.params['spawnEventXML'] = "<key>spawnEvent</key>\n"
            self.params['spawnEventXML'] += "<string>"+args['spawnEvent']+"</string>"
        except:
            self.params['spawnEventXML'] = ""

        try:
            self.params['r'] =  args['restitution']
        except:
            self.params['r'] = 0.2

        try: 
            self.params['f'] =  args['friction']
        except:
            self.params['f'] = 0.5

        try:
            self.params['d'] =  args['density']
        except:
            self.params['d'] = 20
            
        try:
            self.params['static'] =  args['static']
        except:
            self.params['static'] = 'false'
            
        try:
            self.params['sheet'] =  args['sheet']
        except:
            self.params['sheet'] = '5'
            
        try:
            self.params['name'] =  args['setName']
            self.name = args['setName']
        except:
            pass
            
        try:
            self.params['groupIndex'] =  args['groupIndex']
        except:
            self.params['groupIndex'] = 1
            
    def setName(self,name):
        self.name = name
        self.params['name'] = name
        return self
