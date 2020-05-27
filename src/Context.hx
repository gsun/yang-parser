import stmt.Stmt;

class Context {
	public var modules:Map<String, Stmt>; // module or submodule: [mo name => Stmt]
	public var files:Map<String, String>; // module or submodule files: [mo name => mo file name]
	public var yin:Bool; // yang or yin
	public var stmts:List<Stmt>; // all statements

	public function new() {
		modules = new Map();
		files = new Map();
		yin = false;
		stmts = new List();
	}
}
