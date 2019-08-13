import stmt.Stmt;

class Context {
    public var modules:Map<String, Stmt>; //module or submodule: [mo name => Stmt]
    public var files:Map<String, String>; //module or submodule files: [mo name => mo file name]
    public var yin:Bool;                  //yang or yin
    public var stmts:List<Stmt>;          //all statements
    public var root:Dentry;               //root dentry
    public var dentries:List<Dentry>;     //all dentries
    var cwd:Dentry;                       //current working dentry
    
    public function new() {
        modules = new Map();
        files = new Map();
        yin = false;
        stmts = new List();
        dentries = new List();
        root = new Dentry("/");
        dentries.add(root);
        cwd = root;
    }
    
    public function mkDir(name:String, st:Stmt=null) {
        var dir = new Dentry(name);
        if (st != null) dir.node = st;
        dentries.add(dir);
        if (cwd != null) {
            cwd.children.add(dir);
            dir.parent = cwd;
        }
        return dir;
    }
    
    public function cdDir(dir:Dentry) {
        cwd = dir;
    }

    public function pwd() {
        return cwd;
    }
}