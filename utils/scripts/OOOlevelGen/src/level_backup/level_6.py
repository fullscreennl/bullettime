import LevelBuilder
	lb.addObject(Bullet.BulletSprite(x=0, y=0,width=10,height=10,angle='0',restitution=0.5,static='false',friction=0.5,density=3,spawnEvent='onShoot'))
	lb.addObject(Beam.BeamSprite(x=2599, y=115,width=360,height=159,angle='0' ,restitution=0.1,static='false',friction=0,density=3 , firstframe ='spaceship.png', classname='SpaceshipSprite' ).setName('spaceship'))
	lb.addObject(Contacts.Contact(body1='spaceship',body2='rbullet',event_name='onBulletHit'))
	lb.addObject(Enemy.EnemySprite(x=0, y=0,width=32,height=32,angle='0',restitution=0.5,static='false',friction=0.5,density=20, firstframe='slingerball.png', classname='SpaceshipBombSprite' ,spawnEvent='onSpaceshipShoot'))
	
	lb.addObject(Teleporter.TeleporterSprite(level_id='leveldata/level_1'))
	lb.render()