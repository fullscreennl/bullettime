PRISMATIC = """
            <dict>
                <key>type</key>
                <string>prismatic</string>
                <key>body1</key>
                <string>%(body1)s</string>
                <key>motorSpeed</key>
                <real>%(motor_speed)s</real>
                <key>maxMotorTorque</key>
                <real>%(torque)s</real>
                <key>enableMotor</key>
                <%(enable_motor)s/>
                <key>lowerTranslation</key>
                <real>%(lower_translation)s</real>
                <key>upperTranslation</key>
                <real>%(upper_translation)s</real>
                <key>xdir</key>
                <real>%(xdir)s</real>
                <key>ydir</key>
                <real>%(ydir)s</real>
                <key>enableLimit</key>
                <%(enable_limit)s/>
                <key>userData</key>
                <string>%(userData)s</string>
            </dict>
            """


REVOLUTE = """
            <dict>
                <key>type</key>
                <string>revolute</string>
                <key>body1</key>
                <string>%(body1)s</string>
                <key>body2</key>
                <string>%(body2)s</string>
                <key>motorSpeed</key>
                <real>%(motor_speed)s</real>
                <key>maxMotorTorque</key>
                <real>%(torque)s</real>
                <key>enableMotor</key>
                <%(enable_motor)s/>
                <key>lowerAngle</key>
                <real>%(lower_angle)s</real>
                <key>upperAngle</key>
                <real>%(upper_angle)s</real>
                <key>enableLimit</key>
                <%(enable_limit)s/>
                <key>collideConnected</key>
                <%(collide_connected)s/>
                <key>userData</key>
                <string>%(userData)s</string>
                <!-- offstes for rev joints -->
                <key>b1_Xoffset</key>
                <real>%(b1_Xoffset)s</real>
                <key>b1_Yoffset</key>
                <real>%(b1_Yoffset)s</real>
                
            </dict>
            """

DISTANCE ="""
            <dict>
                <key>type</key>
                <string>distance</string>
                <key>body1</key>
                <string>%(body1)s</string>
                <key>body2</key>
                <string>%(body2)s</string>
                <key>dampingRatio</key>
                <real>%(damping)s</real>
                <key>frequencyHz</key>
                <real>%(freq)s</real>
                <key>userData</key>
                <string>%(userData)s</string>
                <!-- offsets for distance joints -->
                <key>b1_Xoffset</key>
                <real>%(b1_Xoffset)s</real>
                <key>b1_Yoffset</key>
                <real>%(b1_Yoffset)s</real>
                <key>b2_Xoffset</key>
                <real>%(b2_Xoffset)s</real>
                <key>b2_Yoffset</key>
                <real>%(b2_Yoffset)s</real>
                
                <!-- texturing image - line - blank -->
                <key>texture_type</key>
                <string>%(texture_type)s</string>
                <key>texture</key>
                <string>%(texture)s</string>
                <key>texture_width</key>
                <real>%(texture_width)s</real>
                
            </dict>
            """

    
    

class RevoluteJoint:
    
    def __init__(self,**kwargs):
        try:
            kwargs['userData']
        except:
            kwargs['userData'] = 'deafaultJoint'
            
        for offset in ("b1_Xoffset","b1_Yoffset","b2_Xoffset","b2_Yoffset"):
            try:
                kwargs[offset]
            except:
                kwargs[offset] = '0'
                
        self.params = kwargs
        
        print "*** >>>>> ",self.params
    
    def render(self):
        return( "", REVOLUTE%self.params,"")
    
    
class DistanceJoint:
    
    def __init__(self,**kwargs):
        try:
            kwargs['userData']
        except:
            kwargs['userData'] = 'deafaultJoint'
       
        try:
            kwargs['texture_type']
        except:
            kwargs['texture_type'] = 'line'
            
        try:
            kwargs['texture']
        except:
            kwargs['texture'] = 'bar_long.png'
            
        try:
            kwargs['texture_width']
        except:
            kwargs['texture_width'] = 25.2
            
        for offset in ("b1_Xoffset","b1_Yoffset","b2_Xoffset","b2_Yoffset"):
            try:
                kwargs[offset]
            except:
                kwargs[offset] = '0'
        self.params = kwargs
    
    def render(self):
        return( "", DISTANCE%self.params,"")
    
    
class PrismaticJoint:
    
    def __init__(self,**kwargs):
        try:
            kwargs['userData']
        except:
            kwargs['userData'] = 'deafaultJoint'
        self.params = kwargs
        if kwargs['vertical'] == 'true':
            self.params['xdir'] = 0.0
            self.params['ydir'] = 1.0  
        else:
            self.params['xdir'] = 1.0
            self.params['ydir'] = 0.0  
    
    def render(self):
        return( "", PRISMATIC%self.params,"")
    
if __name__ == "__main__":
    #print PrismaticJoint(body1='body_1',motor_speed='50.0',torque='1000.0',enable_motor='true',lower_translation='-100',upper_translation='100',enable_limit='false',vertical=False).render()[1]
    #print RevoluteJoint(body1='body_1',body2='body_2',motor_speed='50.0',torque='1000.0',enable_motor='true',lower_angle='12',upper_angle='45',enable_limit='false',collide_connected='false').render()[1]
    print DistanceJoint(body1='body_1',body2='body_2',damping='0.2',freq='0.8').render()[1]
            
