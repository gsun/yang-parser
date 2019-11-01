package visitor;

import stmt.UsesStmt;
import stmt.GroupingStmt;
import stmt.Stmt.NodeId;
using Lambda;

class AstUsesGroupVisitor extends AstVisitor {  
    
    function uses_stmt(stmt:UsesStmt) {
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
                var gg:GroupingStmt = cast parent.subs.grouping_stmt[nid.id];
                if (gg != null && gg.isValid()) {
                        stmt.grouping = gg;
                        gg.uses.add(stmt);
                    }
                if (stmt.grouping != null) break;
                parent = parent.parent;
            }
            if (stmt.grouping ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'uses_stmt ${stmt.arg} include-module-error');
                    var gg:GroupingStmt = cast sub.subs.grouping_stmt[nid.id];
                    if (gg != null && gg.isValid()) {
                        stmt.grouping = gg;
                        gg.uses.add(stmt);
                    }
                    if (stmt.grouping != null) break;
                }
            }
            assertTrue(stmt.grouping != null, 'uses_stmt ${stmt.arg} local-group-reference-error');
        } else {
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[nid.prefix] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'uses_stmt ${stmt.arg} global-group-module-error');
                    var gg:GroupingStmt = cast mo.subs.grouping_stmt[nid.id];
                    if (gg != null && gg.isValid()) {
                        stmt.grouping = gg;
                        gg.uses.add(stmt);
                    }
                    if (stmt.grouping != null) break;
                }
            }   
            assertTrue(stmt.grouping != null, 'uses_stmt ${stmt.arg} global-group-reference-error');         
        }
    }   
}