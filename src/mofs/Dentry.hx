package mofs;

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
	
	public var type(get, never):StmtType;
	function get_type() {
		return (node != null)?node.type:"";
	}
	
	function getFlags(s:Stmt) {
		return switch (s.type) {
		case STInput: "\u{2500}w";
		case STOutput: "ro";
		case STRpc: "\u{2500}x";
		case STNotification: "ro";
		default: s.config?"rw":"ro";
		}
    }
	
	public function tree2(depth:String, out:haxe.io.Output) {
		var flags = (node!=null)?getFlags(node):"";
		out.writeString('${flags} ${name}  \n');
		var idx = 0;
		for (c in children) {
			idx++;
			if (idx==children.length) {
				out.writeString('${depth} \u{2514}\u{2500}');
				depth += '    ';
			} else {
				out.writeString('${depth} \u{251c}\u{2500}');
				depth += ' \u{2502}  ';
			}
			c.tree2(depth, out);
			depth = depth.substr(0, depth.length-4);
		}
	}
	
	public function tree(out:haxe.io.Output) {
		var depth = '';
		return tree2(depth, out);
	}
}