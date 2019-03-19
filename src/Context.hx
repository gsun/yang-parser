import Stmt;

class Context {
    public var mo:Map<String, Stmt>;  //module name => Stmt
    public var path:Map<String, String>; //module name => MO file path
    public var yin:Bool;             //yang or yin
    
    public function new() {
        mo = new Map();
        path = new Map();
        yin = false;
    }
}