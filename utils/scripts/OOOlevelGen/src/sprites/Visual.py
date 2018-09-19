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
					<!--
					<key>firstFrame</key>
					<string>%(firstframe)s</string>
					-->
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID__)s</integer>
					<key>name</key>
					<string>%(name)s</string>
					<key>angle</key>
					<integer>0</integer>
					<key>classname</key>
                    <string>%(classname)s</string>
                    <key>spritedata</key>
                    <string>%(msg)s</string>
				</dict>
			</dict>
"""

JOINTS = """"""

CONTACTS = """"""

class VisualSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.asp = float(kwargs['width']) / float(kwargs['height'])
        self.params['name'] = "Visual"
        self.process(kwargs)
        self.addDefault('classname','StaticVisualSprite')
        self.addDefault('msg','test')
        self.addDefault('firstframe','rect.png')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print VisualSprite(x=160,y=10,width=100, height=100, static='true',classname='UltraBeam',angle=45).render()[0]
    print VisualSprite(x=160,y=10,width=100, height=4, static='true',classname='UltraBeam',angle=45).render()[0]
    print VisualSprite(x=160,y=10,width=100, height=30, static='true',classname='UltraBeam',angle=45).render()[0]
    
