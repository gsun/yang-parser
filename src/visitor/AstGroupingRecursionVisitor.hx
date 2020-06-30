package visitor;

import stmt.Stmt;

using Lambda;

class AstGroupingRecursionVisitor extends AstVisitor {
	var group:List<String>;

	public function new() {
		super();
		group = new List();
	}

	function grouping_stmt(stmt:Stmt) {
		group.push(stmt.arg);
		for (s in stmt.getSubs()) {
			var visitor = new AstGroupingRecursionVisitor();
			visitor.group = group.list();
			visitor.visit(s);
		}
		group.pop();
		yield();
	}

	function uses_stmt(stmt:Stmt) {
		var n:NodeId = stmt.arg;
		if (n.prefix == null) {
			assertFalse(group.has(stmt.arg), 'group-recursion-error');
		} else {
			assertFalse(group.has(n.id), 'group-recursion-error');
		}
	}
}
