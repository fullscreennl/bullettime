import MonsterBuilder
from sprites import *

def create(lb,xpos):
    xml = """
    <level>
<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="236" y="237" width="145" height="145" angle="0" restitution="0.2" static="false" friction="0.5" density="5" sheet="6" firstframe="StepperBody.png" setName="Stepper0" classname="StepperBrain" spritedata="Stepper"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="120" y="21" width="102" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="20" setName="Stepper1" sheet="6" firstframe="StepperLeftFoot.png" classname="StepperBrain_2" spritedata="Stepper"/>
<sprite shape="rect" type="Enemy.EnemySprite" x="354" y="18" width="118" height="38" angle="0" restitution="0.2" static="false" friction="0.5" density="20" setName="Stepper2" sheet="6" firstframe="StepperRightFoot.png" classname="StepperBrain_2" spritedata="Stepper"/>
<sprite type="Joints.DistanceJoint" id="3" body1="Stepper1" body2="Stepper0" damping="0.2" freq="1" texture_type="image" texture="StepperJoint.png" texture_width="20" b1_Xoffset="-1" b1_Yoffset="1" b2_Xoffset="-53" b2_Yoffset="-2" bx="183" by="235" ax="119" ay="22"/>
<sprite type="Joints.DistanceJoint" id="4" body1="Stepper1" body2="Stepper0" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-2" b1_Yoffset="1" b2_Xoffset="57" b2_Yoffset="-3" bx="293" by="234" ax="118" ay="22"/>
<sprite type="Joints.DistanceJoint" id="5" body1="Stepper2" body2="Stepper0" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="1" b1_Yoffset="0" b2_Xoffset="-52" b2_Yoffset="-1" bx="184" by="236" ax="355" ay="18"/>
<sprite type="Joints.DistanceJoint" id="6" body1="Stepper2" body2="Stepper0" damping="0.2" freq="1" texture_type="image" texture="StepperJoint.png" texture_width="20" b1_Xoffset="0" b1_Yoffset="-1" b2_Xoffset="57" b2_Yoffset="-5" bx="293" by="232" ax="354" ay="17"/>
<sprite type="Joints.DistanceJoint" id="7" body1="Stepper1" body2="Stepper0" damping="0.2" freq="10" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="40" b1_Yoffset="-2" b2_Xoffset="-1" b2_Yoffset="53" bx="235" by="290" ax="160" ay="19"/>
<sprite type="Joints.DistanceJoint" id="8" body1="Stepper2" body2="Stepper0" damping="0.2" freq="10" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="-50" b1_Yoffset="0" b2_Xoffset="0" b2_Yoffset="54" bx="236" by="291" ax="304" ay="18"/>
<sprite type="Joints.DistanceJoint" id="9" body1="Stepper1" body2="Stepper2" damping="0.2" freq="1" texture_type="none" texture="rect.png" texture_width="20" b1_Xoffset="41" b1_Yoffset="-3" b2_Xoffset="-50" b2_Yoffset="0" bx="304" by="18" ax="161" ay="18"/>
<!-- END Monster construction -->
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    lb.addObject(Enemy.EnemySprite(x=979, y=96,width=35,height=35,angle='0',restitution=0.2,static='false',friction=0.5,density=5, spawnEvent="onSpitBlob" ,classname='BlobSprite',firstframe='monsterblob.png').setName("Enemy"))
    