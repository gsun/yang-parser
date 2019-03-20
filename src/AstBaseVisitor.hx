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
                if (stmt.top.findSub("prefix_stmt", prefix) == null) {
                    local = false;
                }
            }
            if (stmt.top.type == 'submodule_stmt') {
                var belongs_to = stmt.top.findSub("belongs_to_stmt");
                if (belongs_to.findSub("prefix_stmt", prefix) == null) {
                    local = false;
                }
            }
        }
        if (local) {
            var parent = stmt.parent;
            while (parent != null) {
                stmt.ref = parent.findSub("identity_stmt", arg);
                if (stmt.ref != null) {
                    stmt.ref.addRefed(stmt);
                    break;
                }
                parent = parent.parent;
            }
            if (stmt.ref ==  null) {  //check the submodule
                for (i in stmt.top.findSubs("include_stmt")) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'base_stmt ${stmt.arg} include-module-error');
                    stmt.ref = sub.findSub("identity_stmt", arg);
                    if (stmt.ref != null) {
                        stmt.ref.addRefed(stmt);
                        break;
                    }
                }
            }
            assertTrue(stmt.ref != null, 'base_stmt ${stmt.arg} local-identity-reference-error');
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            for (m in stmt.top.findSubs("import_stmt")) {
                if (m.findSub("prefix_stmt", prefixName[0]) != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'base_stmt ${stmt.arg} global-identity-module-error');
                    stmt.ref = mo.findSub("identity_stmt", arg);
                    if (stmt.ref != null) {
                        stmt.ref.addRefed(stmt);
                        break;
                    }
                }
            }
            assertTrue(stmt.ref != null, 'base_stmt ${stmt.arg} global-identity-reference-error');      
        }
    }   
}