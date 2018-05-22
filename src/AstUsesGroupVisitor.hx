import AstVisitor;
using Lambda;

class AstUsesGroupVisitor extends AstVisitor {  
	
    public function uses_stmt(stmt:Stmt, context:Dynamic) {
		var local = true;
		var prefix;
		var arg = stmt.arg;		
		if (stmt.arg.indexOf(':') != -1) {
			var prefixName:Array<String> = stmt.arg.split(':');
			prefix = prefixName[0];
			arg = prefixName[1];
			if (stmt.top.type == 'module_stmt') {
				if (stmt.top.prefix_stmt[0].arg != prefix) {
				    local = false;
				}
			}
			if (stmt.top.type == 'submodule_stmt') {
				var belongs_to = stmt.top.belongs_to_stmt[0];
				if (belongs_to.prefix_stmt[0].arg != prefix) {
					local = false;
				}
			}
		}
		if (local) {
			var found = false;
			var parent = stmt.parent;
			while (parent != null) {
				for (g in parent.grouping_stmt) {
					if (g.arg == arg) {
						found = true;
						break;
					}
				}
				if (found) break;
				parent = parent.parent;
			}
			if (!found) {  //check the submodule
				for (i in stmt.top.include_stmt) {
					var sub = stmt.ctx.mo[i.arg];
					if (sub != null) {
						for (g in sub.grouping_stmt) {
							if (g.arg == arg) {
								found = true;
								break;
							}
						}
					}
					if (found) break;
				}
			}
			assertTrue(found == true, 'uses_stmt ${stmt.arg} local-group-reference-error ', stmt);
		} else {
			var prefixName:Array<String> = stmt.arg.split(':');
			var found = false;
			for (m in stmt.top.import_stmt) {
				if (m.prefix_stmt.length == 1) {
					if (m.prefix_stmt[0].arg == prefixName[0]) {
						var mo = stmt.ctx.mo[m.arg];
						assertTrue(mo != null, 'uses_stmt ${stmt.arg} global-group-module-error ', stmt);
						for (g in mo.grouping_stmt) {
							if (g.arg == prefixName[1]) {
								found = true;
								break;
							}
						}
					}
				}
				if (found) break;
			}	
            assertTrue(found == true, 'uses_stmt ${stmt.arg} global-group-reference-error ', stmt);			
		}
    }   
}