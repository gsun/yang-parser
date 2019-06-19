package visitor;

import stmt.BaseStmt;
using Lambda;

class AstBaseVisitor extends AstVisitor {  
    
    function base_stmt(stmt:BaseStmt, context:Dynamic) {
        var local = true;
        var prefix;
        var arg = stmt.arg;     
        if (stmt.arg.indexOf(':') != -1) {
            var prefixName:Array<String> = stmt.arg.split(':');
            prefix = prefixName[0];
            arg = prefixName[1];
            if (stmt.top.type == 'module_stmt') {
                if (stmt.top.subs.prefix_stmt[prefix] == null) {
                    local = false;
                }
            }
            if (stmt.top.type == 'submodule_stmt') {
                if (stmt.top.sub.belongs_to_stmt.subs.prefix_stmt[prefix] == null) {
                    local = false;
                }
            }
        }
        if (local) {
            var parent = stmt.parent;
            while (parent != null) {
                var ii = parent.subs.identity_stmt[arg];
				if (ii != null && ii.status == Current) stmt.identity = ii;
                if (stmt.identity != null) {
                    break;
                }
                parent = parent.parent;
            }
            if (stmt.identity ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'include-module-error');
                    var ii = sub.subs.identity_stmt[arg];
                    if (ii != null && ii.status == Current) stmt.identity = ii;
                    if (stmt.identity != null) {
                        break;
                    }
                }
            }
            assertTrue(stmt.identity != null, 'local-identity-reference-error');
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[prefixName[0]] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'global-identity-module-error');
                    var ii = mo.subs.identity_stmt[arg];
                    if (ii != null && ii.status == Current) stmt.identity = ii;
                    if (stmt.identity != null) {
                        break;
                    }
                }
            }
            assertTrue(stmt.identity != null, 'global-identity-reference-error');      
        }
    }   
}