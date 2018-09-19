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
					<integer>10</integer>
					<key>height</key>
					<integer>10</integer>
					<key>firstFrame</key>
					<string>nut.png</string>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID__)s</integer>
					<key>name</key>
					<string>%(name)s</string>
                    <key>static</key>
                    <true/>
                    <key>classname</key>
                    <string>%(classname)s</string>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>10</integer>
						<key>height</key>
						<integer>10</integer>
						<key>type</key>
						<string>circ</string>
						<key>friction</key>
						<real>%(f)s</real>
						<key>density</key>
						<integer>%(d)s</integer>
						<key>restitution</key>
						<real>%(r)s</real>
					</dict>
				</array>
			</dict>
"""
JOINTS = """"""

CONTACTS = """
            <dict>
                <key>sprite1</key>
                <string>Hero</string>
                <key>sprite2</key>
                <string>Nut</string>
                <key>eventName</key>
                <string>%(eventName)s</string>
            </dict>

"""

class NutSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "Nut"
        self.process(kwargs)
        self.addDefault('classname','NutSprite')
        self.addDefault('eventName','onNutHit')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print NutSprite(x=160,y=10).render()[0]
    
