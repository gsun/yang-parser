package visitor;

import stmt.Stmt;
import stmt.IfFeatureStmt;

using Lambda;

class AstFeatureRecursionVisitor extends AstVisitor {
	var feature:List<String>;

	public function new() {
		super();
		feature = new List();
	}

	function feature_stmt(stmt:Stmt) {
		feature.push(stmt.arg);
		var subs:List<IfFeatureStmt> = cast stmt.subs.if_feature_stmt;
		for (s in subs) {
			var visitor = new AstFeatureRecursionVisitor();
			visitor.feature = feature.list();
			visitor.visit(s);
		}
		feature.pop();
		yield();
	}

	function if_feature_stmt(stmt:Stmt) {
		var n:NodeId = stmt.arg;
		if (n.prefix == null) {
			assertFalse(feature.has(stmt.arg), 'feature-recursion-error');
		} else {
			assertFalse(feature.has(n.id), 'feature-recursion-error');
		}
	}
}
