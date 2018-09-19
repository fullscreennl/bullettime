import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
<!-- BEGIN Monster construction -->
<sprite shape="circ" type="Enemy.EnemySprite" x="285" y="143" width="260" height="260" angle="0" restitution="0.2" static="false" friction="0.9" density="5" sheet="6" firstframe="circ.png" setName="MotorizedBall0" classname="MotorizedBallLimb" spritedata="MotorizedBall"/>
<sprite shape="circ" type="Enemy.EnemySprite" x="299" y="156" width="289" height="289" angle="0" restitution="0.2" static="false" friction="0.2" density="1" sheet="6" firstframe="circ.png" setName="MotorizedBall1" classname="MotorizedBallBrain" spritedata="MotorizedBall"/>
<sprite type="Joints.RevoluteJoint" id="2" body1="MotorizedBall0" body2="MotorizedBall1" motor_speed="50.0" torque="10000.0" enable_motor="true" lower_angle="12" upper_angle="45" enable_limit="false" collide_connected="false" bx="237" by="87" b2_Xoffset="-62" b2_Yoffset="-69" ax="285" ay="143" b1_Xoffset="0" b1_Yoffset="0"/>
<!-- END Monster construction -->

    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    