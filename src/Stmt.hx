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

abstract StmtArray(List<Stmt>) from List<Stmt> to List<Stmt> {
@:arrayAccess
    public inline function get(arg:String):Stmt {
        return this.find(function(ch) { return ch.arg == arg; });
    }   
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
    public var path:String;
    public var dict:Map<String, String>;
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
    
    public function new() {
        ctx = null;
        parent = null;
        ref = null;
        subs = new List();
        dict = new Map();
        status = Current;
    }
}