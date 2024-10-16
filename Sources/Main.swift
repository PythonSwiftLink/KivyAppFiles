
import Foundation
import KivyLauncher
import PySwiftObject


let pythonSwiftImportList: [PySwiftModuleImport] = [

]

let extra_pip_folders: [URL] = [
	
]

@_cdecl("SDL_main")
func main(_ argc: Int32, _ argv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>) -> Int32 {
	print("running main")
	//Bundle.module
	var ret: Int32 = 0
	
	do {
		let kivy = try KivyLauncher(
			site_paths: extra_pip_folders,
			pyswiftImports: pythonSwiftImportList
		)
		
		#if DEBUG
		kivy.KIVY_CONSOLELOG = true
		#endif
		
		//python.prog = PyCoreBluetooth.main_py.path
		
		kivy.setup()
		
		// overrite env values
		//kivy.env.KIVY_GL_BACKEND = "sdl2"
		
		kivy.start()
		
		ret = try kivy.run_main(argc, argv)
	} catch let err {
		print(err.localizedDescription)
	}
	
	return ret
	
}
