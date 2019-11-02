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
            if (cwd.prefix != null) {
                //use the same global prefix as parent
                dir.prefix = cwd.prefix;
            } else {
                //set global prefix
                dir.prefix = st.top.sub.prefix_stmt.arg;
            }
        }
        return dir;
    }
    
    public function cdDir(dir:Dentry) {
        cwd = dir;
    }

    public function pwd() {
        return cwd;
    }

    public function tree(?out:haxe.io.Output) {
        var out = (out==null)?Sys.stdout():out;
        return root.tree(out);
    }
}