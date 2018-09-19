import PhysicsMixin
import ID
from sprites.Beam import CONTACTS

BODIES = """
            <dict>
                <key>body</key>
                <dict>
                    <key>x</key>
                    <integer>%(x)s</integer>
                    <key>y</key>
                    <integer>%(y)s</integer>
                    <key>width</key>
                    <integer>%(rotor_size)s</integer>
                    <key>height</key>
                    <integer>%(rotor_size)s</integer>
                    <key>firstFrame</key>
                    <string>enemy_rotor.png</string>
                    <key>sheet_id</key>
                    <integer>5</integer>
                    <key>id</key>
                    <integer>%(__objID__)s</integer>
                    <key>name</key>
                    <string>%(__objID__)s_rotor</string>
                    <key>classname</key>
                    <string>%(classname)s</string>
                </dict>
                <key>shapes</key>
                <array>
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>0</integer>
                        <key>width</key>
                        <integer>%(beam_length)s</integer>
                        <key>height</key>
                        <integer>12</integer>
                        <key>type</key>
                        <string>rect</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>1</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                    </dict>
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>0</integer>
                        <key>width</key>
                        <integer>12</integer>
                        <key>height</key>
                        <integer>%(beam_length)s</integer>
                        <key>type</key>
                        <string>rect</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>1</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                    </dict>
                    <!-- enemies -->
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>%(enemy_offset)s</integer>
                        <key>width</key>
                        <integer>%(enemy_size)s</integer>
                        <key>height</key>
                        <integer>%(enemy_size)s</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>1</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                        <key>userData</key>
                        <string>rotor_enemy</string>
                    </dict>
                    <dict>
                        <key>x</key>
                        <integer>0</integer>
                        <key>y</key>
                        <integer>-%(enemy_offset)s</integer>
                        <key>width</key>
                        <integer>%(enemy_size)s</integer>
                        <key>height</key>
                        <integer>%(enemy_size)s</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>1</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                        <key>userData</key>
                        <string>rotor_enemy</string>
                    </dict>
                    <dict>
                        <key>x</key>
                        <integer>%(enemy_offset)s</integer>
                        <key>y</key>
                        <integer>0</integer>
                        <key>width</key>
                        <integer>%(enemy_size)s</integer>
                        <key>height</key>
                        <integer>%(enemy_size)s</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>1</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                        <key>userData</key>
                        <string>rotor_enemy</string>
                    </dict>
                    <dict>
                        <key>x</key>
                        <integer>-%(enemy_offset)s</integer>
                        <key>y</key>
                        <integer>0</integer>
                        <key>width</key>
                        <integer>%(enemy_size)s</integer>
                        <key>height</key>
                        <integer>%(enemy_size)s</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>1</integer>
                        <key>restitution</key>
                        <real>0.5</real>
                        <key>userData</key>
                        <string>rotor_enemy</string>
                    </dict>

                </array>
            </dict>
            
            <!-- hinge of rotor-->
            
            <dict>
                <key>body</key>
                <dict>
                    <key>x</key>
                    <integer>%(x)s</integer>
                    <key>y</key>
                    <integer>%(y)s</integer>
                    <key>width</key>
                    <integer>10</integer>
                    <key>height</key>
                    <integer>10</integer>
                    <key>firstFrame</key>
                    <string>nut.png</string>
                    <key>sheet_id</key>
                    <integer>5</integer>
                    <key>id</key>
                    <integer>%(__objID2__)s</integer>
                    <key>name</key>
                    <string>%(__objID2__)s_hinge</string>
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
                        <integer>10</integer>
                        <key>height</key>
                        <integer>10</integer>
                        <key>type</key>
                        <string>circ</string>
                        <key>friction</key>
                        <real>0.5</real>
                        <key>density</key>
                        <integer>20</integer>
                        <key>restitution</key>
                        <real>0.2</real>
                    </dict>
                </array>
            </dict>
            

"""

JOINTS = """

            <dict>
                <key>type</key>
                <string>revolute</string>
                <key>body1</key>
                <string>%(__objID2__)s_hinge</string>
                <key>body2</key>
                <string>%(__objID__)s_rotor</string>
                <key>motorSpeed</key>
                <real>%(speed)s</real>
                <key>maxMotorTorque</key>
                <real>%(torque)s</real>
                <key>enableMotor</key>
                <%(enable_motor)s/>
                <key>lowerAngle</key>
                <real>5</real>
                <key>upperAngle</key>
                <real>2</real>
                <key>enableLimit</key>
                <false/>
                <key>collideConnected</key>
                <false/>
            </dict>

"""
CONTACTS = """
            
            <dict>
                <key>sprite1</key>
                <string>:body</string>
                <key>sprite2</key>
                <string>%(__objID__)s_rotor</string>
                <key>eventName</key> 
                <string>onDamage</string>
            </dict>
            <dict>
                <key>sprite1</key>
                <string>:head</string>
                <key>sprite2</key>
                <string>%(__objID__)s_rotor</string>
                <key>eventName</key> 
                <string>onDamage</string>
            </dict>
            <dict>
                <key>sprite1</key>
                <string>%(__objID__)s_rotor</string>
                <key>sprite2</key>
                <string>rbullet</string>
                <key>eventName</key>
                <string>onBulletHit</string>
            </dict>
            <dict>
                <key>sprite1</key>
                <string>%(__objID__)s_rotor</string>
                <key>sprite2</key>
                <string>lbullet</string>
                <key>eventName</key>
                <string>onBulletHit</string>
            </dict>
"""

class EnemyEquipedRotorSprite(PhysicsMixin.PhysicsMixin):
    
    def __init__(self, **kwargs):
        self.params = kwargs
        self.addDefault('classname','EnemyRotor')
        self.addDefault('scaling',2)
        self.addDefault('enable_motor','true')
        
        
        self.params['enemy_offset'] = int(round((100*self.params['scaling']) / 2))
        self.params['beam_length'] = int(round(100*self.params['scaling']))
        self.params['rotor_size'] = int(round(128*self.params['scaling']))
        self.params['enemy_size'] = int(round(25*self.params['scaling']))
        self.params['__objID__'] = ID.next()
        self.params['__objID2__'] = ID.next()
    
    def render(self):
        return( BODIES%self.params, JOINTS%self.params,CONTACTS%self.params)
    
    
    
    
    
if __name__ == "__main__":
    xml = EnemyEquipedRotorSprite(x=160, y=10, speed=200,beam_length=250 ,torque=10000).render()
    print xml[0]
    print xml[1]
    
    
