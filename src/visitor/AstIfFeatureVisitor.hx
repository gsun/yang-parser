package visitor;

import stmt.IfFeatureStmt;
import stmt.Stmt.NodeId;
import stmt.ImportStmt;
import stmt.IncludeStmt;

using Lambda;

class AstIfFeatureVisitor extends AstVisitor {
	function if_feature_stmt(stmt:IfFeatureStmt) {
		var local = true;
		var nid:NodeId = stmt.arg;
		if (nid.prefix != null) {
			if (stmt.top.type == 'module_stmt') {
				if (stmt.top.sub.prefix_stmt.arg != nid.prefix) {
					local = false;
				}
			}
			if (stmt.top.type == 'submodule_stmt') {
				var belongs_to = stmt.top.sub.belongs_to_stmt;
				if (belongs_to.sub.prefix_stmt.arg != nid.prefix) {
					local = false;
				}
			}
		}
		if (local) {
			var parent = stmt.parent;
			while (parent != null) {
				var ff = parent.subs.feature_stmt[nid.id];
				if (ff != null && ff.isValid())
					stmt.feature = ff;
				if (stmt.feature != null) {
					break;
				}
				parent = parent.parent;
			}
			if (stmt.feature == null) { // check the submodule
				var subs:List<IncludeStmt> = cast stmt.top.subs.include_stmt;
				for (i in subs) {
					var sub = stmt.getMo(i.arg);
					assertTrue(sub != null, 'include-module-error');
					var ff = sub.subs.feature_stmt[nid.id];
					if (ff != null && ff.isValid())
						stmt.feature = ff;
					if (stmt.feature != null) {
						break;
					}
				}
			}
			if (stmt.feature == null)
				stmt.parent.status = Prune;
		} else {
			var subs:List<ImportStmt> = cast stmt.top.subs.import_stmt;
			for (m in subs) {
				if (m.subs.prefix_stmt[nid.prefix] != null) {
					var mo = stmt.getMo(m.arg);
					assertTrue(mo != null, 'global-feature-module-error');
					var ff = mo.subs.feature_stmt[nid.id];
					if (ff != null && ff.isValid())
						stmt.feature = ff;
					if (stmt.feature != null) {
						break;
					}
				}
			}
			if (stmt.feature == null)
				stmt.parent.status = Prune;
		}
	}
}
