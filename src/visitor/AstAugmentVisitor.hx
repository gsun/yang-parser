package visitor;

import stmt.Stmt;

using Lambda;

class AstAugmentVisitor extends AstVisitor {
	function augment_stmt(stmt:Stmt) {
		var d = stmt.ctx.fs.find(stmt.arg);
		assertTrue(d!=null, 'augment-arg-error');
	}
}