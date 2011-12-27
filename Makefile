all: chisel
	booc test.boo
	mono test.exe

chisel: MonoMac.dll
	booc src/*.boo -o:Chisel.dll -r:MonoMac.dll

MONO_MAC_DLL="/Users/theo/Library/Application Support/MonoDevelop-2.6/Addins/MonoDevelop.MonoMac.2.6.0.1/MonoMac.dll"
MonoMac.dll:
	cp $(MONO_MAC_DLL) .