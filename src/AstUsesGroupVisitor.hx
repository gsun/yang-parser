import AstVisitor;
using Lambda;

class AstUsesGroupVisitor extends AstVisitor {  
    public function new() {	}   
	
    public function uses_stmt(stmt:Stmt, context:Dynamic) {
		if (stmt.arg.indexOf(':') == -1) {
			var found = false;
			var stmt1 = stmt;
			while (stmt1 != null) {
				for (g in stmt1.grouping_stmt) {
					if (g.arg == stmt.arg) {
						found = true;
						break;
					}
				}
				stmt1 = stmt1.parent;
			}
			assertTrue(found == true, 'uses_stmt ${stmt.arg} group-reference-error ', stmt);
		} else {
			var prefixName = stmt.arg.split(':');
			var found = false;
			for (m in stmt.top.import_stmt) {
				if (m.prefix_stmt != null) {
					if (m.prefix_stmt.arg == prefixName[0]) {
						var mo = stmt.ctx.mo[m.arg];
						assertTrue(mo != null, 'uses_stmt ${stmt.arg} group-reference-error ', stmt);
						for (g in stmt.grouping_stmt) {
							if (g.arg == prefixName[1]) {
								found = true;
								break;
							}
						}
					}
				}
			}	
            assertTrue(found == true, 'uses_stmt ${stmt.arg} group-reference-error ', stmt);			
		}
    }   
}