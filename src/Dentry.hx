import stmt.Stmt;

class Dentry {
    public var parent:Dentry;
    public var children:List<Dentry>;
    public var name:String;
    public var node:Stmt;
    
    public function new(name:String=null) {
        parent = null;
        children = new List();
        node = null;
        this.name = name;
    }

    public var root(get, never):Dentry;
    function get_root() {
        var p = this;
        while (p.parent != null) {
            p = p.parent;
        }
        return p;
    }
    
    public var type(get, never):String;
    function get_type() {
        return (node != null)?node.type:"";
    }
}