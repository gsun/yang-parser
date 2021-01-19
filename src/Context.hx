import stmt.Stmt;
import fw.Fs;

class Context {
	public var modules:Map<String, Stmt>; // module or submodule: [mo name => Stmt]
	public var files:Map<String, String>; // module or submodule files: [mo name => mo file name]
	public var yin:Bool; // yang or yin
	public var fs:Fs; // the module file system

	public function new() {
		modules = new Map();
		files = new Map();
		yin = false;
		fs = new Fs();
	}
}
