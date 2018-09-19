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
					<string>%(classname)s</string>
                    <key>static</key>
                    <true/>
                    <key>spritedata</key>
                    <string>%(msg)s</string>
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
                <string>%(eventName)s</string>
            </dict>
"""

class EventTrigger(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        #self.params['name'] = "Alert"
        self.process(kwargs)
        self.addDefault('classname','')
        self.addDefault('eventName','onLevelCleared')
        self.addDefault('msg','Hello World!')
        self.addDefault('name','EventTrigger')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print EventTrigger(x=100,y=160,width=50,height=320,msg="ImageAlert").render()[0]
    
