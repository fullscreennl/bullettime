import PhysicsMixin
import ID

BODIES = """
            <dict>
                <key>body</key>
                <dict>
                    <key>x</key>
                    <integer>%(x)s</integer>
                    <key>y</key>
                    <integer>%(y)s</integer>
                    <key>width</key>
                    <integer>%(width)s</integer>
                    <key>height</key>
                    <integer>%(height)s</integer>
                    <key>sheet_id</key>
                    <integer>5</integer>
                    <key>id</key>
                    <integer>%(__objID__)s</integer>
                    <key>name</key>
                    <string>%(name)s</string>
                    <key>angle</key>
                    <integer>%(angle)s</integer>
                    <key>static</key>
                    <true/>
                    <key>classname</key>
                    <string></string>
                </dict>
                <key>shapes</key>
                <array>
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>0</integer>
                        <key>width</key>
                        <integer>%(width)s</integer>
                        <key>height</key>
                        <integer>%(height)s</integer>
                        <key>type</key>
                        <string>rect</string>
                        <key>friction</key>
                        <real>%(f)s</real>
                        <key>density</key>
                        <integer>%(d)s</integer>
                        <key>restitution</key>
                        <real>%(r)s</real>
                        <key>sensor</key>
                        <true/>
                    </dict>
                </array>
            </dict>
"""

JOINTS = """"""

CONTACTS = """"""

class GroundSensor(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.asp = kwargs['width'] / float(kwargs['height'])
        #self.params['texture'] = "rect.png"
        self.params['name'] = "GroundSensor"
        self.process(kwargs)
        self.addDefault('classname','')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print GroundSensor(x=160,y=10,width=100, height=100,angle=45).render()[0]
  
    