package stmt;

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
abstract NodeListAccess(List<Stmt>) from List<Stmt> to List<Stmt> {
    @:op(a.b)
    public function resolve( type : String ) : NodeListAccess {
        if (!Stmt.validType(type)) throw('invalid stmt type ${type}');
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
        if (!Stmt.validType(type)) throw('invalid stmt type ${type}');
        return this.find(function(e) { return e.type == type;});
    } 
}

abstract NodeId(String) from String to String {
    public var prefix(get, never):String;
    public var id(get, never):String;
    
    function get_prefix() {
        var idx = this.indexOf(':');
        return (idx == -1)?null:this.substring(0,idx);
    }
    function get_id() {
        var idx = this.indexOf(':');
        return (idx == -1)?this:this.substring(idx+1);
    }
}

abstract SchemaNodeId(String) from String to String {
    public var absolute(get, never):Bool;
    public var path(get, never):Array<NodeId>;
    
    function get_absolute() {
        return (this.charAt(0)=='/')?true:false;
    }
    function get_path() {
        var relative = absolute?this.substring(1):this;
        return relative.split('/');
    }
}

class Stmt {
    var raw:StmtRaw;
    
    public var type(get, never):String;
    function get_type() {
        return raw.type;
    }
    
    public var keyword(get, never):String;
    function get_keyword() {
        return raw.keyword;
    }
    
    public var arg(get, never):String;
    function get_arg() {
        return raw.arg;
    }

    public var location(get, never):Location;  
    function get_location() {
        return raw.location;
    }
    
    public var subList:List<Stmt>;
    public var status:StmtStatus;
    public var ctx:Context;
    public var parent:Stmt;
    public var origin:Stmt; //cloned from
    public var nodeList:List<Stmt>;
    
    
    static var validTypes:Array<String> = ["anyxml_stmt","argument_stmt","augment_stmt","base_stmt","belongs_to_stmt",
                                      "bit_stmt","case_stmt", "choice_stmt","config_stmt","contact_stmt","container_stmt",
                                      "default_stmt","description_stmt","enum_stmt","error_app_tag_stmt","error_message_stmt",
                                      "extension_stmt","deviation_stmt","deviate_stmt","feature_stmt","fraction_digits_stmt",
                                      "grouping_stmt","identity_stmt","if_feature_stmt","import_stmt","include_stmt","input_stmt",
                                      "key_stmt","leaf_stmt","leaf_list_stmt","length_stmt","list_stmt","mandatory_stmt","max_elements_stmt",
                                      "min_elements_stmt","module_stmt","must_stmt","namespace_stmt","notification_stmt","ordered_by_stmt",
                                      "organization_stmt","output_stmt","path_stmt","pattern_stmt","position_stmt","prefix_stmt","presence_stmt",
                                      "range_stmt","reference_stmt","refine_stmt","require_instance_stmt","revision_stmt","revision_date_stmt",
                                      "rpc_stmt","status_stmt","submodule_stmt","type_stmt","typedef_stmt","unique_stmt","units_stmt",
                                      "uses_stmt","value_stmt","when_stmt","yang_version_stmt","yin_element_stmt","unknown_stmt"];
                                      
    public var top(get, never):Stmt;
    function get_top() {
        var p = this;
        while (p.parent != null) {
            p = p.parent;
        }
        return p;
    }
    
    public var root(get, never):Stmt;
    function get_root() {
        var p = this;
        while (p.parent != null) {
            p = p.parent;
        }
        return p;
    }

    public var config(get, never):Bool;
    function get_config() {
        var p = this;
        while (p != null) {
            var config_stmt = p.sub.config_stmt;
            if (config_stmt != null) return (config_stmt.arg=='true')?true:false;
            p = p.parent;
        }
        return true;
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
        sub.parent = this;
        subList.add(sub);
    }
    
    public function removeSub(sub:Stmt) {
        sub.parent = null;
        subList.remove(sub);
    }
    
    public function isValid() {
        return (status == Current || status == Deprecated)?true:false;
    }
    
    public function new() {
        raw = null;
        ctx = null;
        parent = null;
        subList = new List();
        status = Current;
        origin = null;
        nodeList = new List();
    }
    
    static public function buildStmt(raw:StmtRaw, ctx:Context):Stmt {
        var stmt = switch raw.type {
            case "base_stmt": new BaseStmt();
            case "belongs_to_stmt": new BelongsToStmt();
            case "grouping_stmt": new GroupingStmt();
            case "if_feature_stmt": new IfFeatureStmt();
            case "import_stmt": new ImportStmt();
            case "include_stmt": new IncludeStmt();
            case "type_stmt": new TypeStmt();
            case "uses_stmt": new UsesStmt();
            case "unknown_stmt": new UnknownStmt();
            default: new Stmt();
        }
        stmt.raw = raw;
        stmt.ctx = ctx;
        for (s in raw.subs) {
            var child = buildStmt(s, ctx);
            stmt.addSub(child);
        } 
        return stmt;
    }
        
    static public function validType(t:String) {
        return validTypes.has(t);
    }

    public function toString() {
        return 'type ${type} keyword ${keyword} arg ${arg} location ${location} path ${path}';
    }
}