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
					<integer>20</integer>
					<key>height</key>
					<integer>100</integer>
					<key>sheet_id</key>
					<integer>5</integer>
					<key>id</key>
					<integer>%(__objID1__)s</integer>
					<key>name</key>
					<string>%(name)s</string>
					<!--<key>firstFrame</key>
					<string></string>
					-->
					<key>classname</key>
					<string>%(classname)s</string>
					<key>static</key>
					<true/>
					<key>spritedata</key>
					<string>%(level_id)s</string>
					<!-- <key>spawnEvent</key>
					<string>onLevelCleared</string> -->
                    <key>angle</key>
                    <integer>-45</integer>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>20</integer>
						<key>height</key>
						<integer>100</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>0.1</real>
						<key>density</key>
						<integer>1</integer>
						<key>restitution</key>
						<real>0.9</real>
						<key>sensor</key>
						<false/>
					</dict>
				</array>
			</dict>
			
			<!-- blocking door -->
			
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(doorx)s</integer>
					<key>y</key>
					<integer>%(doory)s</integer>
					<key>width</key>
					<integer>20</integer>
					<key>height</key>
					<integer>100</integer>
					<key>sheet_id</key>
					<integer>5</integer>
					<key>id</key>
					<integer>%(__objID2__)s</integer>
					<key>name</key>
					<string>door</string>
					<!--
					<key>firstFrame</key>
					<string>rect.png</string>
					-->
					<key>classname</key>
					<string>ExitDoor</string>
					<key>static</key>
					<true/>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>20</integer>
						<key>height</key>
						<integer>100</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>1</real>
						<key>density</key>
						<integer>1</integer>
						<key>restitution</key>
						<real>0.9</real>
						<key>sensor</key>
						<false/>
					</dict>
				</array>
			</dict>
			
			<!-- end of door-->
			
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(topx)s</integer>
					<key>y</key>
					<integer>110</integer>
					<key>width</key>
					<integer>100</integer>
					<key>height</key>
					<integer>20</integer>
					<key>sheet_id</key>
					<integer>5</integer>
					<key>id</key>
					<integer>%(__objID3__)s</integer>
					<key>name</key>
					<string>%(name)s</string>
					<key>classname</key>
					<string></string>
					<key>static</key>
					<true/>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>-50</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>100</integer>
						<key>height</key>
						<integer>20</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>0.1</real>
						<key>density</key>
						<integer>1</integer>
						<key>restitution</key>
						<real>0.1</real>
						<key>sensor</key>
						<false/>
					</dict>
				</array>
			</dict>
			
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(visualx)s</integer>
					<key>y</key>
					<integer>%(visualy)s</integer>
					<key>width</key>
					<integer>100</integer>
					<key>height</key>
					<integer>136</integer>
					<key>firstFrame</key>
					<string>teleporter.png</string>
					<key>sheet_id</key>
					<integer>5</integer>
					<key>id</key>
					<integer>%(__objID4__)s</integer>
					<key>name</key>
					<string>tube</string>
					<key>angle</key>
					<integer>0</integer>
					<key>classname</key>
                    <string></string>
                    <key>static</key>
					<true/>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>0</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>100</integer>
						<key>height</key>
						<integer>120</integer>
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

CONTACTS = """
            <dict>
                <key>sprite1</key>
                <string>:body</string>
                <key>sprite2</key>
                <string>Teleporter</string>
                <key>eventName</key>
                <string>onTeleporterHit</string>
            </dict>
            
            <dict>
                <key>sprite1</key>
                <string>:head</string>
                <key>sprite2</key>
                <string>Teleporter</string>
                <key>eventName</key>
                <string>onTeleporterHit</string>
            </dict>
            
"""

class TeleporterSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "Teleporter"
        self.process(kwargs)
        self.addDefault('x',480*6 - 25)
        self.addDefault('topx',480*6)
        self.addDefault('visualx',480*6-50)
        self.addDefault('visualy',50+10)
        self.addDefault('doorx',480*6-90)
        self.addDefault('doory',50)
        self.addDefault('y',30)
        self.addDefault('classname','TeleporterSprite')
        self.params['__objID1__'] = ID.next()
        self.params['__objID2__'] = ID.next()
        self.params['__objID3__'] = ID.next()
        self.params['__objID4__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print TeleporterSprite(x=160,y=10,level_id="level_80.plist").render()[0]
    
