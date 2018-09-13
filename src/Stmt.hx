typedef StmtRevision = {
    var name:String;
    @:optional var revision:String;
}

typedef Loc = {
    var offset:Int;
    var line:Int;
    var column:Int;
}

typedef Location = {
    var start:Loc;
    var end:Loc;
}

typedef StmtRaw = {
    var type:String;
    var keyword:String;
    var arg:String;
    var subs:Array<StmtRaw>;
    var location:Location;
}

abstract StmtArray(Array<Stmt>) from Array<Stmt> to Array<Stmt> {
@:arrayAccess
    public inline function get(key:String):Stmt {
        for (i in this) {
            if (i.arg == key) return i;
        }
        return null;
    }   
}

class Stmt implements Dynamic<Array<Stmt>> {
    public var type:String;
    public var keyword:String;
    public var arg:String;
    public var subs:Array<Stmt>;
    public var location:Location;  

    public var path:String;
    public var dict:Map<String, String>;
    public var ctx:Context;
    public var parent:Stmt;
    public var top(get, never):Stmt;
    function get_top() {
        var p = this;
        while (p.parent != null) {
            p = p.parent;
        }
        return p;
    }
    
    //auto resolve the stmt with type and arg, 
    //for example, st.import_stmt get the array of import stmts,
    //st.import_stmt["xyz"] get the specific import stmt with arg "xyz".
    function resolve(type:String) : StmtArray {
        return [ for (ch in subs) if (ch.type == type) ch ];
    }
    
    public function new() {
        ctx = null;
        parent = null;
        subs = [];
        dict = new Map();
    }
    
    
}