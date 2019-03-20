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

class Stmt {
    public var type:String;
    public var keyword:String;
    public var arg:String;
    public var subs:List<Stmt>;
    public var location:Location;  

    public var status:StmtStatus;
    public var level:Int; //yang file formatter
    public var ctx:Context;
    public var parent:Stmt;
    public var ref:Stmt;  //the ref to stmt for uses/import/include/belongs-to
    public var top(get, never):Stmt;
    function get_top() {
        var p = this;
        while (p.parent != null) {
            p = p.parent;
        }
        return p;
    }

    public var path(get, never):String;
    function get_path() {
        return ctx.path[top.arg];
    }

    public function getMo(type:String):Null<Stmt> {
        return ctx.mo[type];
    }
    
    public function findSubs(type:String) : List<Stmt> {
        return subs.filter(function(ch) { return ch.type == type;});
    }

    public function findSub(type:String, ?arg:String) : Null<Stmt> {
        if (arg != null) {
            return subs.find(function(ch) { return (ch.type == type && ch.arg == arg); });
        } else {
            return subs.find(function(ch) { return (ch.type == type); });
        }
    }
    
    public function addSub(sub:Stmt) {
        subs.push(sub);
    }
    
    public function new() {
        ctx = null;
        parent = null;
        ref = null;
        subs = new List();
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