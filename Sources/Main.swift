//
//  SDLMain.swift
//  Ehhh
//
//  Created by CodeBuilder on 07/10/2023.
//

import Foundation
//import PythonSwiftCore
import KivyLauncher
import PySwiftObject


let pythonSwiftImportList: [PySwiftModuleImport] = [
	//insert PySwiftModule import functions here
]

let extra_pip_folders: [String] = [
	
]

@_cdecl("SDL_main")
func main(_ argc: Int32, _ argv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>) -> Int32 {
	print("running main")
	//Bundle.module
	var ret: Int32 = 0
	
	do {
		let python = try KivyLauncher(
			other_paths: extra_pip_folders,
			pyswiftImports: pythonSwiftImportList
		)
		
		//python.prog = PyCoreBluetooth.main_py.path
		
		ret = try python.run_main(argc, argv)
	} catch let err {
		print(err.localizedDescription)
	}
	
	return ret
	
}
