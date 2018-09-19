from sprites import *

def create(lb,xpos):
    
    xml = """
    <level>
    <sprite shape="circ" type="Enemy.EnemySprite" x="401" y="419" width="119" height="119" angle="-24" restitution="0.9" static="false" friction="0.5" density="5" sheet="6" firstframe="circ.png" setName="0"/>
    <sprite type="Beam.BeamSprite" x="190" y="171" width="299" height="75" angle="10" restitution="0.2" static="true" friction="0.5" density="5" setName="1" sheet="6" firstframe="rect.png"/>
    <sprite type="Beam.BeamSprite" x="93" y="335" width="80" height="80" angle="0" restitution="0.2" static="false" friction="0.5" density="5" setName="3" sheet="6" firstframe="rect.png"/>
    <sprite type="Joints.DistanceJoint" id="2" body1="0" body2="1" damping="0.2" freq="1" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="-16" b1_Yoffset="-23" b2_Xoffset="-109" b2_Yoffset="-26" bx="81" by="145" ax="385" ay="396"/>
    <sprite type="Joints.DistanceJoint" id="4" body1="1" body2="3" damping="0.2" freq="1" texture_type="image" texture="rect.png" texture_width="20" b1_Xoffset="107" b1_Yoffset="25" b2_Xoffset="-25" b2_Yoffset="-22" bx="68" by="313" ax="297" ay="196"/>
    </level>
    """
    
    lb.addObject(Enemy.EnemySprite(firstframe='monster_head.png', x= (xpos + 717-605), y=269,width=56,height=56,angle='0',restitution=0.2,static='false',friction=0.5,density=5, classname='MonsterHeadSprite',sheet='6' ).setName('bluehead'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x= (xpos + 605-605), y=84,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ,sheet='6').setName('leftknee'))
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x= (xpos + 828-605), y=83,width=32,height=32,angle='0',restitution=0.2,static='false',friction=0.5,density=20 ,sheet='6').setName('rightknee'))
   
   
    lb.addObject(Beam.BeamSprite(x= (xpos + 795-605), y=13,width=48,height=26,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 , spritedata = 'BlueMonsterDestructed', firstframe ='monster_foot.png' ,classname='InternalEventBusSprite' ,sheet='6').setName('rightfoot'))
    lb.addObject(Beam.BeamSprite(x= (xpos + 648-605), y=13,width=48,height=26,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 ,spritedata = 'BlueMonsterDestructed', firstframe ='monster_foot.png' ,classname='InternalEventBusSprite',sheet='6' ).setName('leftfoot'))
    
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x= (xpos + 716-605), y=170,width=148,height=148,angle='0',restitution=0.2,static='false',friction=0.5,density=10,sheet='6' ).setName('bluebody'))
    
    lb.addObject(Joints.DistanceJoint(body1='rightknee',body2='rightfoot',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='leftknee',body2='leftfoot',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='leftknee',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='rightknee',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='bluehead',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    
    lb.addObject(Joints.DistanceJoint(body1='leftfoot',body2='bluebody',damping='0.2',freq='2' ,texture_type='blank'))
    lb.addObject(Joints.DistanceJoint(body1='rightfoot',body2='bluebody',damping='0.2',freq='2' ,texture_type='blank'))
    lb.addObject(Joints.DistanceJoint(body1='rightfoot',body2='leftfoot',damping='0.2',freq='2' ,texture_type='blank'))