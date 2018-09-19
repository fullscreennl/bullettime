import PhysicsMixin
import ID

CANNON = """
            <dict>
                <key>event</key>
                <string>%(event)s</string>
                <key>freq</key>
                <integer>%(freq)s</integer>
                <key>max</key>
                <integer>%(max)s</integer>
            </dict>
"""

class Cannon:
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return("","","",CANNON%self.params)
    
    
    
if __name__ == "__main__":
    print Cannon(event="onCreateEnemy",freq=30,max=100).render()[0]
    
