import LevelBuilder
	
	
	lb.addObject(Joints.RevoluteJoint(body1='wheel',body2='spaceship',motor_speed='-50',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
	lb.addObject(Joints.RevoluteJoint(body1='wheel2',body2='spaceship',motor_speed='-500',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
	lb.addObject(Joints.RevoluteJoint(body1='wheel3',body2='spaceship',motor_speed='500',enable_motor='true',torque='10000',lower_angle='12',upper_angle='50',userData='rev_joint',enable_limit='false',collide_connected='false'))
	