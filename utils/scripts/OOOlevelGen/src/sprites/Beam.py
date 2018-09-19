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
                    <key>angle</key>
                    <integer>%(angle)s</integer>
                    <key>static</key>
                    <%(static)s/>
                    <key>classname</key>
                    <string>%(classname)s</string>
                    %(spawnEventXML)s
                	<key>spritedata</key>
					<string>%(spritedata)s</string>
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
				<string>%(name)s</string>
				<key>sprite2</key>
				<string>rbullet</string>
				<key>eventName</key>
				<string>onBulletHit</string>
			</dict>
			<dict>
				<key>sprite1</key>
				<string>%(name)s</string>
				<key>sprite2</key>
				<string>lbullet</string>
				<key>eventName</key>
				<string>onBulletHit</string>
			</dict>
			<dict>
				<key>sprite1</key>
				<string>%(name)s</string>
				<key>sprite2</key>
				<string>cannonBall</string>
				<key>eventName</key>
				<string>onCannonBallHit</string>
			</dict>
"""

class BeamSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.asp = float(kwargs['width']) / float(kwargs['height'])
        self.params['name'] = "Beam"
        
        
        self.addDefault('firstframe','rect.png')
        self.addDefault('classname','')
        
        self.process(kwargs)
         
        if self.params['classname'] == 'Destructable' and self.params['firstframe'] == 'rect.png':
        	if self.asp < 1.5:
        		self.params['firstframe'] = 'brittle_brick.png' 
        	elif self.asp > 1.5 and self.asp < 3.0:
        		self.params['firstframe'] = 'brittle_brick_2_1.png' 
        	else:
        		self.params['firstframe'] = 'brittle_brick_4_1.png' 
            
        self.addDefault('spritedata','')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        if self.params['classname'] == "Destructable":
            return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
        else:
            return( BODIES%self.params, JOINTS%self.params,"")
    
    
    
if __name__ == "__main__":
    print BeamSprite(x=160,y=10,width=100, height=100, static='true',classname='UltraBeam',angle=45).render()[0]
    print BeamSprite(x=160,y=10,width=100, height=4, static='true',classname='UltraBeam',angle=45).render()[0]
    print BeamSprite(x=160,y=10,width=100, height=30, static='true',classname='UltraBeam',angle=45).render()[0]
    
