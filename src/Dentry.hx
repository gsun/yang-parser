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
    
    public function tree2(depth:String, out:haxe.io.Output) {
        out.writeString('${name}  \n');
        var idx = 0;
        for (c in children) {
            idx++;
            out.writeString( '${depth} |--');
            (idx==children.length)?(depth += '    '):(depth += ' |  ');
            c.tree2(depth, out);
            depth = depth.substr(0, depth.length-4);
        }
    }
    
    public function tree(out:haxe.io.Output) {
        var depth = '';
        return tree2(depth, out);
    }
}