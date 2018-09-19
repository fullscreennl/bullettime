import PhysicsMixin
import ID
import Enemy
import Friend
import Beam
import Joints
import Contacts

class PumpkinBomberSprite(PhysicsMixin.PhysicsMixin):

    def __init__(self,**kwargs):
        self.params = kwargs
        self.params['name'] = "PumpkinBomber"
        self.params['__objID__'] = ID.next()
        self.bodies = ""
        self.joints = ""
        self.contacts = ""
        self.process(kwargs)
        self.buildBodies()
        self.buildJoints()
        self.buildContacts()


    def buildBodies(self):
        
                                            
        bodyXML = """<dict>
                <key>body</key>
                <dict>
                    <key>x</key>
                    <integer>%(x)s</integer>
                    <key>y</key>
                    <integer>%(y)s</integer>
                    <key>width</key>
                    <integer>180</integer>
                    <key>height</key>
                    <integer>92</integer>
                    <key>firstFrame</key>
                    <string>pumpkin_bomber.png</string>
                    <key>sheet_id</key>
                    <integer>6</integer>
                    <key>id</key>
                    <integer>%(__objID__)s</integer>
                    <key>name</key>
                    <string>beamPumpkinBomber</string>
                    <key>static</key>
                    <false/>
                    <key>classname</key>
                    <string>PumpkinBomberSprite</string>
                </dict>
                <key>shapes</key>
                <array>
					<dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>200</integer>
                        <key>width</key>
                        <integer>180</integer>
                        <key>height</key>
                        <integer>92</integer>
                        <key>type</key>
                        <string>poly</string>
                        <key>points_CCW</key>
                        <string>0|-46#90|-30#75|0#50|27#0|46#-50|27#-75|0#-90|-30</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>3</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                    </dict>
                     </array>
            </dict>
"""                          
        self.bodies += bodyXML%self.params
        #self.joints += self.body.render()[1]
        #self.contacts += self.body.render()[2]
        
        self.wheel1 = Friend.FriendSprite(width=38,
                                    height=38,
                                    y= int(round(self.params['y']- 40)),
                                    x= int(round(self.params['x']- 65)),
                                    static="false",density=1, firstframe='wheel.png',sheet='6').setName('wheel_left'+self.params['name'])
        self.bodies += self.wheel1.render()[0]
        self.joints += self.wheel1.render()[1]
        self.contacts += self.wheel1.render()[2]

        self.wheel2 = Friend.FriendSprite(width=38,
                                    height=38,
                                    y= int(round(self.params['y'] - 40)),
                                    x= int(round(self.params['x'] + 65)),
                                    static="false",density=1, firstframe='wheel.png',sheet='6').setName('wheel_right'+self.params['name'])
        self.bodies += self.wheel2.render()[0]
        self.joints += self.wheel2.render()[1]
        self.contacts += self.wheel2.render()[2]


    def buildJoints(self):
        self.joints += Joints.RevoluteJoint(body1='wheel_left'+self.params['name'],
                                            body2='beam'+self.params['name'],
                                            motor_speed='0.0',
                                            torque='0.0',
                                            enable_motor='false',
                                            lower_angle='12',
                                            upper_angle='45',
                                            enable_limit='false',
                                            collide_connected='false').render()[1]

        self.joints += Joints.RevoluteJoint(body1='wheel_right'+self.params['name'],
                                            body2='beam'+self.params['name'],
                                            motor_speed='0.0',
                                            torque='0.0',
                                            enable_motor='false',
                                            lower_angle='12',
                                            upper_angle='45',
                                            enable_limit='false',
                                            collide_connected='false').render()[1]

    def render(self):
        return( self.bodies, self.joints, self.contacts)

    def buildContacts(self):
        pass

if __name__ == "__main__":
    print PumpkinBomberSprite(x=100,y=100).render()[1]
    