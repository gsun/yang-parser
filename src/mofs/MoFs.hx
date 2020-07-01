package mofs;

import stmt.Stmt;

class MoFs {
	public var root:Dentry;
	public var cwd:Dentry;
	
	public function new() {
		root = new Dentry('/');
		cwd = root;
	}
	
	public function mkDir(name:String, st:Stmt=null) {
		var dir = new Dentry(name);
		if (st != null) dir.node = st;
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
	
	public function tree(?out:haxe.io.Output) {
        var out = (out==null)?Sys.stdout():out;
        return root.tree(out);
    }
}