import Chisel
import System.Drawing

class MyApplication(Application):
	window as Window
	
	def launch():
		self.applicationName = 'Test'
		
		window = Window( title:"Hello, Chisel!" )
		window.contentSize = Size( 200, 100 )
		window.visible = true

app = MyApplication( )
app.run( )