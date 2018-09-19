CONTACT = """
 
            <dict>
                <key>sprite1</key>
                <string>%(body1)s</string>
                <key>sprite2</key>
                <string>%(body2)s</string>
                <key>eventName</key>
                <string>%(event_name)s</string>
            </dict>

"""

class Contact:
    
    def __init__(self,**kwargs):
        self.params = kwargs
    
    def render(self):
        return( "", "",CONTACT%self.params)
    
    
if __name__ == '__main__':
    print Contact(body1='test',body2='test2',event_name='onTest').render()[2]
