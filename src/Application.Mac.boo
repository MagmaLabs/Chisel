namespace Chisel

import MonoMac.Foundation
import MonoMac.AppKit

class Application(object):
	private autoreleasePool as NSAutoreleasePool
	private application as NSApplication
	
	private quitMenuItem as NSMenuItem
	
	private _applicationName as string
	
	public def constructor( ):
		self.autoreleasePool = NSAutoreleasePool( )
		NSApplication.Init( )
		
		application = NSApplication.SharedApplication
		
		if _applicationName is null:
			_applicationName = NSProcessInfo.ProcessInfo.ProcessName
		
		application.ActivationPolicy = NSApplicationActivationPolicy.Regular
		application.ActivateIgnoringOtherApps( true )
		
		menuBar = NSMenu( )
		appMenuItem = NSMenuItem( )
		menuBar.AddItem( appMenuItem )
		application.SetMainMenu( menuBar )
		
		appMenu = NSMenu( )
		quitTitle = "Quit " + _applicationName
		quitMenuItem = NSMenuItem( quitTitle, 'q' )
		appMenu.AddItem( quitMenuItem )
		appMenuItem.Submenu = appMenu
		
		quitMenuItem.Activated += def(sender, args):
			application.Stop( sender )
		
		self.launch( )
	
	public applicationName as string:
		set:
			bundle = NSBundle.MainBundle
			infoDictionary = bundle.InfoDictionary as NSMutableDictionary
			infoDictionary[NSString("CFBundleName")] = NSString(value)
			
			_applicationName = value
			
			if quitMenuItem:
				quitMenuItem.Title = value
		get:
			return _applicationName
	
	virtual def launch():
		pass
	
	def run():
		application.Run( )