import MonsterBuilder

def create(lb,xpos,args):
    xml = """
			<level>
			<!-- conversation -->
			<sprite type = 'Speach.Speach' controll_level='1' x='250' y='250' width='200' height='500' msg="%(msg)s"/>
			<sprite _label= 'green_blob' _color = '0xff0000' visual='monsterblob.png' type = 'Enemy.EnemySprite' controll_level='5' x='400'  y='100' width='102' height='101' angle='0' restitution='0.2' static='true' friction='0.5' density='5' classname='TalkingBlobSprite' firstframe='monsterblob.png'/>
			<sprite _label= 'brick' _color = '0x00ff55' visual='rect.png' type = 'Beam.BeamSprite' controll_level='6' x='400'  y='40' width='128' height='30' angle='0'  restitution='0.2' static='true' friction='0.5' density='5' />
			</level>"""%args
    	
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
