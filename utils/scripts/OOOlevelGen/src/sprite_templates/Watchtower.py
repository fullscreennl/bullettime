import MonsterBuilder

def create(lb,xpos):
    xml = """
    <level>
	<!-- watchtower -->
	<sprite type = 'ZoomTrigger.ZoomTriggerSprite' x='0' y='250' width='100' height='500' zoom_fact='1.0'/>
	<sprite type = 'ZoomTrigger.ZoomTriggerSprite' x='165' y='260' width='128' height='100' zoom_fact='0.1666'/>
	<sprite type = 'ZoomTrigger.ZoomTriggerSprite' x='330' y='250' width='100' height='500' zoom_fact='1.0'/>
	<sprite type = 'WatchtowerVisual.WatchtowerVisualSprite' x='165'  y='92' width='128' height='285' angle='0' restitution='0.2' static='true' friction='0.5' density='20' firstframe='watchtower.png' />
    </level>
    """
    MonsterBuilder.createFromXMLString(lb,xpos,xml)
    