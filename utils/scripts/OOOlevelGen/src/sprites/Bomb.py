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
					<string>dynamite.png</string>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID__)s</integer>
					<key>name</key>
					<string>%(name)s</string>
					<key>angle</key>
                    <integer>%(angle)s</integer>
					<key>classname</key>
					<string>%(classname)s</string>
                    <key>static</key>
                    <%(static)s/>
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
					</dict>
				</array>
			</dict>
"""

JOINTS = """"""

CONTACTS = """
             <dict>
				<key>sprite1</key>
				<string>%(name)s</string>
				<key>sprite2</key>
				<string>rbullet</string>
				<key>eventName</key>
				<string>onSimpleExplode</string>
			</dict>
			<dict>
				<key>sprite1</key>
				<string>%(name)s</string>
				<key>sprite2</key>
				<string>lbullet</string>
				<key>eventName</key>
				<string>onSimpleExplode</string>
			</dict>
"""

class BombSprite(PhysicsMixin.PhysicsMixin):

    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "Bomb"
        self.process(kwargs)
        self.addDefault('classname','BombSprite')
        self.addDefault('angle','0')
        self.params['__objID__'] = ID.next()

    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)



if __name__ == "__main__":
    print BombSprite(friction=0.3,x=160,y=10,width=100, height=100,density=10,restitution=0.9).render()[0]

