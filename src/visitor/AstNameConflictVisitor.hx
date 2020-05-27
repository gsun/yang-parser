package visitor;

import stmt.Stmt;

using Lambda;

class AstNameConflictVisitor extends AstVisitor {
	function container_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function grouping_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function input_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function list_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function module_stmt(stmt:Stmt) {
		check5(stmt);
	}

	function notification_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function output_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function rpc_stmt(stmt:Stmt) {
		check2(stmt);
	}

	function submodule_stmt(stmt:Stmt) {
		check5(stmt);
	}

	inline function check2(stmt:Stmt) {
		var types = ["typedef_stmt", "grouping_stmt"];
		for (i in types) {
			nameConflict(stmt, i);
			nameAncestorConflict(stmt, stmt.parent, i);
		}
	}

	inline function check5(stmt:Stmt) {
		var types = [
			"typedef_stmt",
			"grouping_stmt",
			"feature_stmt",
			"identity_stmt",
			"extension_stmt"
		];
		for (i in types) {
			nameConflict(stmt, i);
		}
	}

	function nameConflict(stmt:Stmt, type:String) {
		var a = stmt.getSubs(type);
		for (t in a) {
			var count = a.count(function(x) {
				return ((t != x) && (t.arg == x.arg));
			});
			assertEquals(count, 0, '${t.type} ${t.arg} name-conflict-error');
		}
	}

	function nameAncestorConflict(stmt:Stmt, parent:Stmt, type:String) {
		var a = parent.getSubs(type);
		var b = stmt.getSubs(type);
		for (t in a) {
			var count = b.count(function(x) {
				return ((t != x) && (t.arg == x.arg));
			});
			assertEquals(count, 0, '${t.type} ${t.arg} name-top-conflict-error');
		}
		if (parent.parent != null)
			nameAncestorConflict(stmt, parent.parent, type);
	}
}
