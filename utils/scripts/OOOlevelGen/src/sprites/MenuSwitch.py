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
					<key>classname</key>
					<string>MenuTransitionSensorSprite</string>
                    <key>static</key>
                    <true/>
                    <key>spritedata</key>
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
						<real>1</real>
						<key>density</key>
						<integer>1</integer>
						<key>restitution</key>
						<real>0</real>
						<key>sensor</key>
						<true/>
					</dict>
				</array>
			</dict>
"""

JOINTS = """"""

CONTACTS = """
            <dict>
                <key>sprite1</key>
                <string>:body</string>
                <key>sprite2</key>
                <string>%(name)s</string>
                <key>eventName</key>
                <string>%(event)s</string>
            </dict>
"""

class goMenu1(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['width'] = 20
        self.params['height'] = 500
        self.params['name'] = "MenuSwitch"
        self.params['event'] = "goFirstMenu"
        self.process(kwargs)
        self.addDefault('classname','')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)

class goMenu2(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['width'] = 20
        self.params['height'] = 500
        self.params['name'] = "MenuSwitch"
        self.params['event'] = "goMidMenu"
        self.process(kwargs)
        self.addDefault('classname','')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
        
class goMenu2Forward(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['width'] = 20
        self.params['height'] = 500
        self.params['name'] = "MenuSwitch"
        self.params['event'] = "goForwardMidMenu"
        self.process(kwargs)
        self.addDefault('classname','')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
        
class goMenu3(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['width'] = 20
        self.params['height'] = 500
        self.params['name'] = "MenuSwitch3"
        self.params['event'] = "goLastMenu"
        self.process(kwargs)
        self.addDefault('classname','')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print goMenu2(x=100,y=160,width=50,height=320,zoom_fact=3.0).render()[0]
    
