import PhysicsMixin
import ID

BODIES = """
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(x)s</integer>
					<key>y</key>
					<integer>127</integer>
					<key>width</key>
					<integer>128</integer>
					<key>height</key>
					<integer>250</integer>
					<key>firstFrame</key>
					<string>watchtower.png</string>
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
                    <string>%(classname)s</string>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>-32</integer>
						<key>width</key>
						<integer>128</integer>
						<key>height</key>
						<integer>185</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>%(f)s</real>
						<key>density</key>
						<integer>%(d)s</integer>
						<key>restitution</key>
						<real>%(r)s</real>
					</dict>
					<!-- anti slip matje bovenop -->
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>60</integer>
						<key>width</key>
						<integer>100</integer>
						<key>height</key>
						<integer>5</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>120</real>
						<key>density</key>
						<integer>%(d)s</integer>
						<key>restitution</key>
						<real>%(r)s</real>
					</dict>
					
				</array>
			</dict>
"""

JOINTS = """"""

CONTACTS = """"""

class WatchtowerVisualSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.asp = float(kwargs['width']) / float(kwargs['height'])
        self.params['name'] = "Beam"
        self.process(kwargs)
        self.addDefault('classname','')
        self.addDefault('firstframe','watchtower.png')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print WatchtowerVisualSprite(x=160,y=10,width=100, height=100, static='true',classname='UltraBeam',angle=45).render()[0]
    print WatchtowerVisualSprite(x=160,y=10,width=100, height=4, static='true',classname='UltraBeam',angle=45).render()[0]
    print WatchtowerVisualSprite(x=160,y=10,width=100, height=30, static='true',classname='UltraBeam',angle=45).render()[0]
    
