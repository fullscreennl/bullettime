import LevelBuilder
    lb.addObject(Hero.HeroSprite(x=49, y=58,width=42,height=74))
    lb.addObject(ZoomTrigger.ZoomTriggerSprite(x=150-115-50,y=250,width=100,height=500,zoom_fact=1.0))
    lb.addObject(WatchtowerVisual.WatchtowerVisualSprite(x=150, y=92,width=128,height=235-50,angle='0',restitution=0.2,static='true',friction=0.5,density=20,firstframe='watchtower.png' ))
    lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_7_3'))
   
    lb.addObject(Beam.BeamSprite(x=795, y=13,width=48,height=26,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 , firstframe ='monster_foot.png' ).setName('rightfoot'))
    lb.addObject(Beam.BeamSprite(x=648, y=13,width=48,height=26,angle='0' ,restitution=0.5,static='false',friction=0.1,density=100 , firstframe ='monster_foot.png' ).setName('leftfoot'))
    
    lb.addObject(Enemy.EnemySprite(firstframe='monster_body.png', x=716, y=170,width=148,height=148,angle='0',restitution=0.2,static='false',friction=0.5,density=10 ).setName('bluebody'))
    
    lb.addObject(Joints.DistanceJoint(body1='rightknee',body2='rightfoot',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='leftknee',body2='leftfoot',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='leftknee',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='rightknee',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    lb.addObject(Joints.DistanceJoint(body1='bluehead',body2='bluebody',damping='0.2',freq='5' ,texture_type='image',texture = 'monster_leg.png'))
    
    lb.addObject(Joints.DistanceJoint(body1='leftfoot',body2='bluebody',damping='0.2',freq='2' ,texture_type='blank'))
    lb.addObject(Joints.DistanceJoint(body1='rightfoot',body2='bluebody',damping='0.2',freq='2' ,texture_type='blank'))
    lb.addObject(Joints.DistanceJoint(body1='rightfoot',body2='leftfoot',damping='0.2',freq='2' ,texture_type='blank'))
    """

    
    lb.addObject(Joints.DistanceJoint(body1='snake_head',body2='snake_body_1',damping='0.2',freq='5',texture_type='image',texture = 'snake_body.png',texture_width=52))
    lb.addObject(Beam.BeamSprite(x=2551, y=161,width=546,height=87,angle='0' ,restitution=0.2,static='false',friction=0.5,density=40 ).setName('Beam'))
    lb.addObject(Nut.NutSprite(x=2281, y=102,width=32,height=32,restitution=0.2,static='false',friction=0.5,density=5 ))
    
   