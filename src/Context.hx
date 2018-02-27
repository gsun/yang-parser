import Stmt;

class Context {
    public var mo:Map<String, Stmt>;  //module name => Stmt
    
    public function new() {
        mo = new Map();
    }
}