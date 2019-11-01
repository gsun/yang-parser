package visitor;

import stmt.BaseStmt;
import stmt.Stmt.NodeId;
using Lambda;

class AstBaseVisitor extends AstVisitor {  
    
    function base_stmt(stmt:BaseStmt) {
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
                var ii = parent.subs.identity_stmt[nid.id];
                if (ii != null && ii.isValid()) stmt.identity = ii;
                if (stmt.identity != null) {
                    break;
                }
                parent = parent.parent;
            }
            if (stmt.identity ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'include-module-error');
                    var ii = sub.subs.identity_stmt[nid.id];
                    if (ii != null && ii.isValid()) stmt.identity = ii;
                    if (stmt.identity != null) {
                        break;
                    }
                }
            }
            assertTrue(stmt.identity != null, 'local-identity-reference-error');
        } else {
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[nid.prefix] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'global-identity-module-error');
                    var ii = mo.subs.identity_stmt[nid.id];
                    if (ii != null && ii.isValid()) stmt.identity = ii;
                    if (stmt.identity != null) {
                        break;
                    }
                }
            }
            assertTrue(stmt.identity != null, 'global-identity-reference-error');      
        }
    }   
}