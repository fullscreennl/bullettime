from BaseHTTPServer import BaseHTTPRequestHandler,HTTPServer
import cgi
from xml.dom.minidom import parseString
import LevelBuilder
from sprites import *
from sprite_templates import *
import sys
import MonsterObjcCodeGenerator

class MyServer(BaseHTTPRequestHandler):
	
	def buildLevel(self,xml):
				
		print ">>>"*50
		print xml
		print "<<<"*50

		lb = LevelBuilder.XMLLevelBuilder("test"+".plist",background="test.png")
		lb.renderWithXML(xml)
	
	def do_GET(self):
		if self.path == "/test":
			FILE_TO_SERVE = "/Users/johantenbroeke/Sites/projects/fullscreen_3/xcodeprojects/oneonone_stripped/Resources/leveldata/test.plist"
			#FILE_TO_SERVE = "/Users/jeroen/Documents/fullscreen_3/xcodeprojects/oneonone_stripped/Resources/leveldata/test.plist"
			f = open(FILE_TO_SERVE) 
			self.send_response(200)
			#self.send_header('Content-type',	'text/html')
			self.end_headers()
			self.wfile.write(f.read())
			f.close()
		if "/load_level_source" in self.path:
			job = self.path.split("/load_level_source/")[1]
			print job
			f = open("level_source/level_"+job+".xml")
			xmlString = f.read()
			f.close()
			self.send_response(200)
			self.send_header('Content-type',	'text/xml')
			self.end_headers()
			if xmlString:
				self.wfile.write(xmlString)
			else:
				self.wfile.write('<status event="loadLEvelError">file not found</status>')
		if "/gen_obj_code" in self.path:
			classname = self.path.split("?")[-1:][0]
			success = MonsterObjcCodeGenerator.generateWithName(classname)
			self.send_response(200)
			self.send_header('Content-type',	'text/xml')
			self.end_headers()
			if success:
				self.wfile.write('<status event="ObjcCodeGenerated">ok</status>')
			else:
				self.wfile.write('<status event="ObjcCodeGenerationFailed">dir exsists</status>')
		return 
		
	def saveLevelXML(self,xml,filename):
		f = open("level_source/level_"+filename+".xml","w")
		f.write(xml)
		f.close()
	
	def do_POST(self):
		# Parse the form data posted
		form = cgi.FieldStorage(
			fp=self.rfile, 
			headers=self.headers,
			environ={'REQUEST_METHOD':'POST',
					 'CONTENT_TYPE':self.headers['Content-Type'],
					 })

		# Begin the response
		self.send_response(200)
		self.end_headers()
		#self.wfile.write('Client: %s\n' % str(self.client_address))
		#self.wfile.write('User-agent: %s\n' % str(self.headers['user-agent']))
		#self.wfile.write('Path: %s\n' % self.path)
		#self.wfile.write('Form data:\n')
		
		if 'filename' in form:
			self.saveLevelXML(form['xml'].value,form['filename'].value)

		self.buildLevel(form['xml'].value)
		
		if 'filename' in form:
			self.wfile.write('<status event="LevelSaved">ok</status>')
		else:
			self.wfile.write('<status event="LevelGenerated">ok</status>')
			
		# Echo back information about what was posted in the form
		for field in form.keys():
			field_item = form[field]
			if field_item.filename:
				# The field contains an uploaded file
				file_data = field_item.file.read()
				file_len = len(file_data)
				del file_data
				#self.wfile.write('\tUploaded %s as "%s" (%d bytes)\n' % \
				#		(field, field_item.filename, file_len))
			else:
				# Regular form value
				#self.wfile.write('\t%s=%s\n' % (field, form[field].value))
				pass
		return

	@staticmethod
	def serve_forever(port):
		HTTPServer(('', port), MyServer).serve_forever()

if __name__ == "__main__":
	MyServer.serve_forever(8081)
