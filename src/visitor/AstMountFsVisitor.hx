package visitor;

import stmt.Stmt;
import stmt.UsesStmt;
import stmt.IncludeStmt;
using Lambda;

class AstMountFsVisitor extends AstVisitor {
	var expanding:Bool;

	public function choice_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir(stmt.arg, stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function case_stmt(stmt:Stmt) {
		stmt.ctx.fs.mkDir(stmt.arg, stmt);
	} 
	
	public function rpc_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir(stmt.arg, stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function input_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir("input", stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function output_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir("output", stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function container_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir(stmt.arg, stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function leaf_stmt(stmt:Stmt) {
		stmt.ctx.fs.mkDir(stmt.arg, stmt);
	}
	
	public function leaf_list_stmt(stmt:Stmt) {
		stmt.ctx.fs.mkDir(stmt.arg, stmt);
	}
	
	public function list_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir(stmt.arg, stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function anyxml_stmt(stmt:Stmt) {
		stmt.ctx.fs.mkDir(stmt.arg, stmt);
	}
	
	public function uses_stmt(stmt:UsesStmt) {
		var visitor = new AstMountFsVisitor();
		visitor.expanding = true;
		visitor.visit(stmt.grouping);
		yield();
	}
	
	public function grouping_stmt(stmt:UsesStmt) {
		if (!expanding) yield();
	}  

	public function module_stmt(stmt:Stmt) {
		var pwd = stmt.ctx.fs.pwd();
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(pwd);
		yield();
	}
	
	public function include_stmt(stmt:IncludeStmt) {
		var visitor = new AstMountFsVisitor();
		visitor.expanding = true;
		visitor.visit(stmt.subModule);
		yield();
	}
	
	public function submodule_stmt(stmt:Stmt) {
		if (!expanding) {
			yield();
			return;
		}
		var pwd = stmt.ctx.fs.pwd();
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(pwd);
		yield();
	}

	public function notification_stmt(stmt:Stmt) {
		var de = stmt.ctx.fs.mkDir(stmt.arg, stmt);
		stmt.ctx.fs.cdDir(de);
		for (s in stmt.getSubs()) {
			var visitor = new AstMountFsVisitor();
			visitor.visit(s);
		}
		stmt.ctx.fs.cdDir(de.parent);
		yield();
	}
	
	public function augment_stmt(stmt:Stmt) {
		yield();
	}
}