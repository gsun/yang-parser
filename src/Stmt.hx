using Lambda;

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

enum StmtStatus {
    Current;
    Prune;
    Deprecated;
    Obsolete;
}

@:forward
abstract NodeListAccess(List<Stmt>) from List<Stmt> {
    @:op(a.b)
    public function resolve( type : String ) : NodeListAccess {
        return this.filter(function(e) { return e.type == type;});
    }
    @:arrayAccess
    public inline function get(arg:String): Null<Stmt> {
        return this.find(function(e) { return e.arg == arg; });
    }
}

private abstract NodeAccess(List<Stmt>) from List<Stmt> {
    @:op(a.b)
    public function resolve( type : String ) : Null<Stmt> {
        return this.find(function(e) { return e.type == type;});
    } 
}

class Stmt {
    public var type:String;
    public var keyword:String;
    public var arg:String;
    public var subList:List<Stmt>;
    public var location:Location;  

    public var status:StmtStatus;
    public var level:Int; //yang file formatter
    public var ctx:Context;
    public var parent:Stmt;
    public var ref:Stmt;  //the ref to stmt for uses/import/include/belongs-to/type
    public var refed:List<Stmt>;
    public var top(get, never):Stmt;
    function get_top() {
        var p = this;
        while (p.parent != null) {
            p = p.parent;
        }
        return p;
    }

    public var path(get, never):String;
    function get_path() return ctx.path[top.arg];

    public function getMo(type:String):Null<Stmt> return ctx.mo[type];
    
    public var subs(get, never):NodeListAccess;
    function get_subs() return subList;
    
    public var sub(get, never):NodeAccess;
    function get_sub() return subList;
    
    public function getSubs(type:String) : List<Stmt> {
        return subList.filter(function(ch) { return ch.type == type;});
    }

    public function getSub(type:String, ?arg:String) : Null<Stmt> {
        if (arg != null) {
            return subList.find(function(ch) { return (ch.type == type && ch.arg == arg); });
        } else {
            return subList.find(function(ch) { return (ch.type == type); });
        }
    }

    public function addSub(sub:Stmt) {
        subList.add(sub);
    }
    
    public function addRefed(stmt:Stmt) {
        refed.add(stmt);
    }
    
    public function removeSub(sub:Stmt) {
        subList.remove(sub);
        sub.parent = null;
        sub.ctx = null;
        sub.ref = null;
        for (r in sub.refed) {
            r.ref = null;
        }
        sub.refed.clear();
        for (s in sub.subList) {
            removeSub(s);
        }
        sub.subList.clear();
    }
    
    public function new() {
        ctx = null;
        parent = null;
        ref = null;
        refed = new List();
        subList = new List();
        status = Current;
    }

    static public function buildStmt(raw:StmtRaw, ctx:Context, level:Int=0):Stmt {
        var stmt = new Stmt();
        stmt.type = raw.type;
        stmt.keyword = raw.keyword;
        stmt.arg = raw.arg;
        stmt.location = raw.location;
        stmt.ctx = ctx;
        stmt.level = level;
        for (s in raw.subs) {
            var child = buildStmt(s, ctx, level+1);
            child.parent = stmt;
            stmt.addSub(child);
        } 
        return stmt;
    }
}