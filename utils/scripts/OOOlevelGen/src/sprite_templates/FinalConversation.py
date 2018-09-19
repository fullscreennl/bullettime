import MonsterBuilder

def create(lb,xpos,args):
    xml = """
			<level>
			<!-- conversation -->
			<sprite type = 'Speach.Speach' controll_level='1' x='250' y='250' width='200' height='500' msg="%(msg)s"/>
			<sprite _label= 'green_blob' _color = '0xff0000' visual='monsterblob.png' type = 'Friend.FriendSprite' controll_level='5' x='400'  y='105' width='102' height='101' angle='0' restitution='0.2' static='false' friction='0.5' density='5' classname='DeliciaSprite' firstframe='delicia.png'/>
			<sprite _label= 'brick' _color = '0x00ff55' visual='rect.png' type = 'Beam.BeamSprite' controll_level='6' x='350' angle='15'  y='10' width='128' height='30' restitution='0.2' static='true' friction='0.5' density='5' />
			<sprite _label= 'brick' _color = '0x00ff55' visual='rect.png' type = 'Beam.BeamSprite' controll_level='6' x='450' angle='-15' y='10' width='128' height='30' restitution='0.2' static='true' friction='0.5' density='5' />
			</level>"""%args
    	
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
