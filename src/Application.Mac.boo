namespace Chisel

import MonoMac.Foundation
import MonoMac.AppKit

class Application(object):
	private autoreleasePool as NSAutoreleasePool
	private application as NSApplication
	
	def constructor( ):
		pass
	
	virtual def launch():
		pass
	
	def run():
		self.autoreleasePool = NSAutoreleasePool( )
		NSApplication.Init( )
		
		application = NSApplication.SharedApplication
		
		self.launch( )
		
		application.ActivationPolicy = NSApplicationActivationPolicy.Regular
		application.ActivateIgnoringOtherApps( true )
		
		application.Run( )