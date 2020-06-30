package visitor;

import stmt.UnknownStmt;
import stmt.ImportStmt;
import stmt.IncludeStmt;

using Lambda;

class AstUnknownVisitor extends AstVisitor {
	function unknown_stmt(stmt:UnknownStmt) {
		var local = true;
		var prefix;
		var keyword = stmt.keyword;

		if (stmt.keyword.indexOf(':') != -1) {
			var prefixName:Array<String> = stmt.keyword.split(':');
			prefix = prefixName[0];
			keyword = prefixName[1];
			if (stmt.top.type == 'module_stmt') {
				if (stmt.top.subs.prefix_stmt[prefix] == null) {
					local = false;
				}
			}
			if (stmt.top.type == 'submodule_stmt') {
				var belongs_to = stmt.top.sub.belongs_to_stmt;
				if (belongs_to.subs.prefix_stmt[prefix] == null) {
					local = false;
				}
			}
		}
		if (local) {
			var parent = stmt.parent;
			while (parent != null) {
				var ee = parent.subs.extension_stmt[keyword];
				if (ee != null && ee.isValid())
					stmt.extension = ee;
				if (stmt.extension != null)
					break;
				parent = parent.parent;
			}
			if (stmt.extension == null) { // check the submodule
				var subs:List<IncludeStmt> = cast stmt.top.subs.include_stmt;
				for (i in subs) {
					var sub = stmt.getMo(i.arg);
					assertTrue(sub != null, 'type_stmt ${stmt.keyword} include-module-error');
					var ee = sub.subs.extension_stmt[keyword];
					if (ee != null && ee.isValid())
						stmt.extension = ee;
					if (stmt.extension != null)
						break;
				}
			}
			assertTrue(stmt.extension != null || stmt.parent.type == 'unknown_stmt',
				'unknown_stmt ${stmt.keyword} ${stmt.arg} local-extension-reference-error');
		} else {
			var prefixName:Array<String> = stmt.keyword.split(':');
			var subs:List<ImportStmt> = cast stmt.top.subs.import_stmt;
			for (m in subs) {
				if (m.subs.prefix_stmt[prefixName[0]] != null) {
					var mo = stmt.getMo(m.arg);
					assertTrue(mo != null, 'type_stmt ${stmt.keyword} global-extension-module-error');
					var ee = mo.subs.extension_stmt[keyword];
					if (ee != null && ee.isValid())
						stmt.extension = ee;
					if (stmt.extension != null)
						break;
				}
			}
			assertTrue(stmt.extension != null || stmt.parent.type == 'unknown_stmt',
				'unknown_stmt ${stmt.keyword} ${stmt.arg} global-extension-reference-error');
		}
	}
}
