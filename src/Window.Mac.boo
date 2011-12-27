namespace Chisel

import System.Drawing
import MonoMac.Foundation
import MonoMac.AppKit

class Window(object):
	private window as NSWindow

	def constructor( ):
		windowRect = Rectangle( 100, 100, 300, 300 )
		window = NSWindow( windowRect,
			NSWindowStyle.Resizable | NSWindowStyle.Closable | NSWindowStyle.Titled,
			NSBackingStore.Buffered, false )
	
	title as string:
		get:
			return window.Title
		set:
			window.Title = value
			
	visible as bool:
		get:
			return false
		set:
			window.MakeKeyAndOrderFront( window )