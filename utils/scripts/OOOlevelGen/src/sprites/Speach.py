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
					<integer>200</integer>
					<key>height</key>
					<integer>20</integer>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
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
						<integer>-240</integer>
						<key>width</key>
						<integer>200</integer>
						<key>height</key>
						<integer>20</integer>
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
			
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(x)s</integer>
					<key>y</key>
					<integer>%(y)s</integer>
					<key>width</key>
					<integer>200</integer>
					<key>height</key>
					<integer>500</integer>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID2__)s</integer>
					<key>name</key>
					<string>zone</string>
					<key>classname</key>
					<string></string>
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
						<integer>200</integer>
						<key>height</key>
						<integer>500</integer>
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
					<integer>500</integer>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID3__)s</integer>
					<key>name</key>
					<string>block</string>
					<key>classname</key>
					<string>ConversationBlock</string>
                    <key>static</key>
                    <true/>
                    <key>spritedata</key>
                    <string></string>
				</dict>
				<key>shapes</key>
				<array>
					<dict>
						<key>x</key>
						<integer>50</integer>
						<key>y</key>
						<integer>0</integer>
						<key>width</key>
						<integer>20</integer>
						<key>height</key>
						<integer>500</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>1</real>
						<key>density</key>
						<integer>1</integer>
						<key>restitution</key>
						<real>0</real>
						<key>sensor</key>
						<false/>
					</dict>
				</array>
			</dict>
			
			<dict>
				<key>body</key>
				<dict>
					<key>x</key>
					<integer>%(x)s</integer>
					<key>y</key>
					<integer>%(y)s</integer>
					<key>width</key>
					<integer>200</integer>
					<key>height</key>
					<integer>20</integer>
					<key>sheet_id</key>
					<integer>%(sheet)s</integer>
					<key>id</key>
					<integer>%(__objID4__)s</integer>
					<key>name</key>
					<string>block</string>
					<key>classname</key>
					<string>ConversationBlock</string>
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
						<integer>-258</integer>
						<key>width</key>
						<integer>200</integer>
						<key>height</key>
						<integer>20</integer>
						<key>type</key>
						<string>rect</string>
						<key>friction</key>
						<real>200</real>
						<key>density</key>
						<integer>1</integer>
						<key>restitution</key>
						<real>0</real>
						<key>sensor</key>
						<false/>
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
                <string>onSpeak</string>
            </dict>
            <dict>
                <key>sprite1</key>
                <string>:body</string>
                <key>sprite2</key>
                <string>zone</string>
                <key>eventName</key>
                <string>onPauseControlls</string>
            </dict>
"""

class Speach(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        #self.params['name'] = "Alert"
        self.process(kwargs)
        self.addDefault('classname','')
        self.addDefault('msg','hallo !&#xD; sdfsdf  ')
        self.addDefault('name','Speach')
        self.params['__objID__'] = ID.next()
        self.params['__objID2__'] = ID.next()
        self.params['__objID3__'] = ID.next()
        self.params['__objID4__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print Speach(x=100,y=250,width=50,height=500).render()[0]
    
