import AstVisitor;
using Lambda;

class AstBaseVisitor extends AstVisitor {  
    
    function base_stmt(stmt:Stmt, context:Dynamic) {
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
                stmt.ref = parent.subs.identity_stmt[arg];
                if (stmt.ref != null) {
                    break;
                }
                parent = parent.parent;
            }
            if (stmt.ref ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'base_stmt ${stmt.arg} include-module-error');
                    var ii = sub.subs.identity_stmt[arg];
                    if (ii != null && ii.status == Current) stmt.ref = ii;
                    if (stmt.ref != null) {
                        break;
                    }
                }
            }
            assertTrue(stmt.ref != null, 'base_stmt ${stmt.arg} local-identity-reference-error');
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[prefixName[0]] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'base_stmt ${stmt.arg} global-identity-module-error');
                    var ii = mo.subs.identity_stmt[arg];
                    if (ii != null && ii.status == Current) stmt.ref = ii;
                    if (stmt.ref != null) {
                        break;
                    }
                }
            }
            assertTrue(stmt.ref != null, 'base_stmt ${stmt.arg} global-identity-reference-error');      
        }
    }   
}