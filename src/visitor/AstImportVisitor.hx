package visitor;

import stmt.Stmt;
import stmt.ModuleStmt;
import stmt.SubmoduleStmt;
import stmt.ImportStmt;
import stmt.IncludeStmt;
import stmt.BelongsToStmt;

using Lambda;

class AstImportVisitor extends AstVisitor {
	function module_stmt(stmt:ModuleStmt) {
		var subs:List<ImportStmt> = cast stmt.subs.import_stmt;
		for (i in subs) {
			var m = stmt.getMo(i.arg);
			assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
			assertEquals(m.keyword, "module", 'import_stmt ${i.arg} type-error');
			if (m != null && m.isValid())
				i.module = m;
		}

		var subs:List<IncludeStmt> = cast stmt.subs.include_stmt;
		for (i in subs) {
			var sub:Stmt = stmt.getMo(i.arg);
			assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
			assertEquals(sub.keyword, "submodule", 'include_stmt ${i.arg} type-error');

			var module_version = stmt.sub.yang_version_stmt;
			var sub_version = sub.sub.yang_version_stmt;
			if (module_version != null && sub_version != null) {
				assertEquals(module_version.arg, sub_version.arg, 'include_stmt ${i.arg} version-error');
			}
			if (sub != null && sub.isValid())
				i.subModule = sub;
		}
	}

	function submodule_stmt(stmt:SubmoduleStmt) {
		var belongsto:BelongsToStmt = cast stmt.sub.belongs_to_stmt;
		assertTrue(belongsto != null, 'include_stmt ${stmt.arg} belongs-to-error');

		var mo:Stmt = stmt.getMo(belongsto.arg);
		assertTrue(mo != null, 'include_stmt ${stmt.arg} belongs-to-error');
		if (mo != null && mo.isValid())
			belongsto.module = mo;

		var subs:List<ImportStmt> = cast stmt.subs.import_stmt;
		for (i in subs) {
			var m = stmt.getMo(i.arg);
			assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
			assertEquals(m.keyword, "module", 'import_stmt ${i.arg} type-error');
			if (m != null && m.isValid())
				i.module = m;
		}
		
		var subs:List<IncludeStmt> = cast stmt.subs.include_stmt;
		for (i in subs) {
			var sub:Stmt = stmt.getMo(i.arg);
			assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
			assertEquals(sub.keyword, "submodule", 'include_stmt ${i.arg} type-error');

			var module_version = stmt.sub.yang_version_stmt;
			var sub_version = sub.sub.yang_version_stmt;
			if (module_version != null && sub_version != null) {
				assertEquals(module_version.arg, sub_version.arg, 'include_stmt ${i.arg} version-error');
			}
			if (sub != null && sub.isValid())
				i.subModule = sub;
		}
	}
}
