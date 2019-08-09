import stmt.Stmt;

class Context {
    public var mo:Map<String, Stmt>;     //module or submodule: [module name => Stmt]
    public var path:Map<String, String>; //module or submodule file path: [module name => MO file path]
    public var yin:Bool;                 //yang or yin
    public var stmt:List<Stmt>;          //all the Stmts
    public var root:Dentry;
    public var dentry:List<Dentry>;
    
    public function new() {
        mo = new Map();
        path = new Map();
        yin = false;
        stmt = new List();
        dentry = new List();
    }
}