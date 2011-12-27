import Chisel

class MyApplication(Application):
	window as Window
	
	def launch():
		window = Window( )
		window.title = "Hello, Chisel!"
		window.visible = true

app = MyApplication( )
app.run( )