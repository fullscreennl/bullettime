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
					<key>firstFrame</key>
					<string>%(firstframe)s</string>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID__)s</integer>
					<key>name</key>
					<string>%(name)s</string>
					<key>classname</key>
					<string>%(classname)s</string>
                    <key>static</key>
                    <%(static)s/>
                    <key>spawnframe</key>
                    <integer>%(spawnframe)s</integer>
                    %(spawnEventXML)s
                    <key>spritedata</key>
					<string>%(spritedata)s</string>
					<key>angle</key>
                    <integer>%(angle)s</integer>
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
						<string>%(shape)s</string>
						<key>friction</key>
						<real>%(f)s</real>
						<key>density</key>
						<integer>%(d)s</integer>
						<key>restitution</key>
						<real>%(r)s</real>
						<key>groupIndex</key>
						<integer>%(groupIndex)s</integer>
					</dict>
				</array>
			</dict>
"""

JOINTS = """"""

CONTACTS = """
			<dict>
				<key>sprite1</key>
				<string>%(classname)s</string>
				<key>sprite2</key>
				<string></string>
				<key>eventName</key>
				<string>onToxicHit</string>
			</dict>
			<dict>
				<key>sprite2</key>
				<string>%(classname)s</string>
				<key>sprite1</key>
				<string></string>
				<key>eventName</key>
				<string>onToxicHit</string>
			</dict>
            <dict>
                <key>sprite1</key>
                <string>:body</string>
                <key>sprite2</key>
                <string>%(name)s</string>
                <key>eventName</key>
                <string>onDeathByToxic</string>
            </dict>
            <dict>
                <key>sprite1</key>
                <string>:head</string>
                <key>sprite2</key>
                <string>%(name)s</string>
                <key>eventName</key>
                <string>onDeathByToxic</string>
            </dict>
"""

class UltraToxicUnit(PhysicsMixin.PhysicsMixin):

    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "ToxicUnit"
        self.process(kwargs)
        self.addDefault('classname','UltraToxicUnit')
        self.addDefault('firstframe','square_monsterblob.png')
        self.addDefault("spritedata", "")
        self.addDefault('shape','rect')
        self.params['__objID__'] = ID.next()

    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)



if __name__ == "__main__":
    print UltraToxicUnit(friction=0.3,x=160,y=10,width=100, height=100,density=10,restitution=0.9).render()[0]

