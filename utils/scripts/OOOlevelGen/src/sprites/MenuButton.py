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
					<string>%(level_id)s</string>
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
			
			<!-- focus trigger -->
			
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(x)s</integer>
					<key>y</key>
					<integer>50</integer>
					<key>width</key>
					<integer>5</integer>
					<key>height</key>
					<integer>100</integer>
					<key>sheet_id</key>
					<integer>5</integer>
					<key>id</key>
					<integer>%(__objID2__)s</integer>
					<key>name</key>
					<string>MenuSensor</string>
					<!--
					<key>classname</key>
					<string>%(classname)s</string>
					-->
                    <key>static</key>
                    <true/>
                    <key>spritedata</key>
                    <string>%(level_id)s</string>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>5</integer>
						<key>height</key>
						<integer>100</integer>
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
                <string>MenuButton</string>
                <key>eventName</key>
                <string>onLevelSelected</string>
            </dict>
            
            <dict>
                <key>sprite1</key>
                <string>:head</string>
                <key>sprite2</key>
                <string>MenuButton</string>
                <key>eventName</key>
                <string>onLevelSelected</string>
            </dict>
            
            <dict>
                <key>sprite1</key>
                <string>:head</string>
                <key>sprite2</key>
                <string>MenuSensor</string>
                <key>eventName</key>
                <string>onMenuFocusChanged</string>
            </dict>
            
"""

class MenuButtonSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "MenuButton"
        self.process(kwargs)
        self.addDefault('y',220)
        self.addDefault('width',64)
        self.addDefault('height',200)
        self.addDefault('classname','MenuButtonSprite')
        self.addDefault('firstframe','bullet_ani_0.png')
        self.params['__objID__'] = ID.next()
        self.params['__objID2__'] = ID.next()

    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print MenuButtonSprite(x=160,level_id="test.plist").render()[0]
    
