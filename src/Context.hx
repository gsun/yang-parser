import Stmt;

class Context {
    public var mo:Map<String, Stmt>;  //module name => Stmt
	public var yin:Bool;             //yang or yin
    
    public function new() {
        mo = new Map();
		yin = false;
    }
}