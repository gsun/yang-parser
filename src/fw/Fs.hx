package fw;

import stmt.Stmt;

abstract NodeId(String) from String to String {
	public var prefix(get, never):String;
	public var id(get, never):String;

	function get_prefix() {
		var idx = this.indexOf(':');
		return (idx == -1) ? null : this.substring(0, idx);
	}

	function get_id() {
		var idx = this.indexOf(':');
		return (idx == -1) ? this : this.substring(idx + 1);
	}
}

abstract SchemaNodeId(String) from String to String {
	public var absolute(get, never):Bool;
	public var path(get, never):Array<NodeId>;

	function get_absolute() {
		return (this.charAt(0) == '/') ? true : false;
	}

	function get_path() {
		var relative = absolute ? this.substring(1) : this;
		return relative.split('/');
	}
}

class Fs {
	public var root:Dentry;
	public var cwd:Dentry;

	public function new() {
		root = new Dentry('/');
		cwd = root;
	}

	public function mkDir(name:String, st:Stmt = null) {
		var dir = new Dentry(name);
		if (st != null)
			dir.node = st;
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

	public function find(path:String) {
		var n:SchemaNodeId = path;
		if (n.absolute) {
			cwd = root;
		}
		return cwd;
	}

	public function tree(?out:haxe.io.Output) {
		var out = (out == null) ? Sys.stdout() : out;
		return root.tree(out);
	}
}
