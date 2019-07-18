import stmt.Stmt;

class Context {
    public var raw:Map<String, StmtRaw>;
    public var mo:Map<String, Stmt>;     //module tree: [module name => Stmt]
    public var path:Map<String, String>; //module path map: [module name => MO file path]
    public var yin:Bool;                 //yang or yin
    
    public function new() {
        raw = new Map();
        mo = new Map();
        path = new Map();
        yin = false;
    }
}