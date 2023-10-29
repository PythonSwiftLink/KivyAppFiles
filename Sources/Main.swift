
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
		let python = try KivyLauncher(
			site_paths: extra_pip_folders,
			pyswiftImports: pythonSwiftImportList
		)
		
		//python.prog = PyCoreBluetooth.main_py.path
		
		ret = try python.run_main(argc, argv)
	} catch let err {
		print(err.localizedDescription)
	}
	
	return ret
	
}
