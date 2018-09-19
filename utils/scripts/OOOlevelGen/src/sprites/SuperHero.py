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
                    <integer>42</integer>
                    <key>height</key>
                    <integer>75</integer>
                    <key>firstFrame</key>
                    <string>hero_frame_1.png</string>
                    <key>sheet_id</key>
                    <integer>5</integer>
                    <key>id</key>
                    <integer>20</integer>
                    <key>name</key>
                    <string>%(name)s</string>
                    <key>classname</key>
                    <string>%(classname)s</string>
                </dict>
                <key>shapes</key>
                <array>

                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>20</integer>
                        <key>width</key>
                        <integer>25</integer>
                        <key>height</key>
                        <integer>25</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
                        <real>%(f)s</real>
                        <key>density</key>
                        <integer>0</integer>
                        <key>restitution</key>
                        <real>0.1</real>
                        <key>userData</key>
                        <string>head</string>
                    </dict>
                    
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>-14</integer>
                        <key>width</key>
                        <integer>46</integer>
                        <key>height</key>
                        <integer>46</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
						<real>%(f)s</real>
						<key>density</key>
						<integer>2</integer>
						<key>restitution</key>
						<real>0.1</real>
						<key>userData</key>
                        <string>body</string>
                    </dict>
                    
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>-40</integer>
                        <key>width</key>
                        <integer>25</integer>
                        <key>height</key>
                        <integer>10</integer>
                        <key>type</key>
                        <string>rect</string>
                        <key>friction</key>
                        <real>%(f)s</real>
                        <key>density</key>
                        <integer>0</integer>
                        <key>restitution</key>
                        <real>0.9</real>
                        <key>sensor</key>
                        <true/>
                        <key>userData</key>
                        <string>feet_sensor</string>
                    </dict>
                    
                </array>
            </dict>
"""

JOINTS = """"""
CONTACTS = """
            <dict>
                <key>sprite1</key>
                <string>HeroSprite</string>
                <key>sprite2</key>
                <string></string>
                <key>eventName</key>
                <string>onHeroHit</string>
            </dict>
"""

class HeroSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "Hero"
        self.process(kwargs)
        self.addDefault('classname','SuperHeroSprite')
        self.params['__objID__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
if __name__ == "__main__":
    print HeroSprite(x=160,y=10).render()[0]
    
