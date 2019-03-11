import AstVisitor;
using Lambda;

class AstUsesGroupVisitor extends AstVisitor {  
    
    function uses_stmt(stmt:Stmt, context:Dynamic) {
        var local = true;
        var prefix;
        var arg = stmt.arg;     
        if (stmt.arg.indexOf(':') != -1) {
            var prefixName:Array<String> = stmt.arg.split(':');
            prefix = prefixName[0];
            arg = prefixName[1];
            if (stmt.top.type == 'module_stmt') {
                if (stmt.top.findSub("prefix_stmt").arg != prefix) {
                    local = false;
                }
            }
            if (stmt.top.type == 'submodule_stmt') {
                var belongs_to = stmt.top.findSub("belongs_to_stmt");
                if (belongs_to.findSub("prefix_stmt").arg != prefix) {
                    local = false;
                }
            }
        }
        if (local) {
            var found = false;
            var parent = stmt.parent;
            while (parent != null) {
                for (g in parent.findSubs("grouping_stmt")) {
                    if (g.arg == arg) {
                        found = true;
                        break;
                    }
                }
                if (found) break;
                parent = parent.parent;
            }
            if (!found) {  //check the submodule
                for (i in stmt.top.findSubs("include_stmt")) {
                    var sub = stmt.ctx.mo[i.arg];
                    if (sub != null) {
                        for (g in sub.findSubs("grouping_stmt")) {
                            if (g.arg == arg) {
                                found = true;
                                break;
                            }
                        }
                    }
                    if (found) break;
                }
            }
            assertTrue(found, 'uses_stmt ${stmt.arg} local-group-reference-error');
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            var found = false;
            for (m in stmt.top.findSubs("import_stmt")) {
                if (m.findSubs("prefix_stmt").length == 1) {
                    if (m.findSub("prefix_stmt").arg == prefixName[0]) {
                        var mo = stmt.ctx.mo[m.arg];
                        assertTrue(mo != null, 'uses_stmt ${stmt.arg} global-group-module-error');
                        for (g in mo.findSubs("grouping_stmt")) {
                            if (g.arg == prefixName[1]) {
                                found = true;
                                break;
                            }
                        }
                    }
                }
                if (found) break;
            }   
            assertTrue(found, 'uses_stmt ${stmt.arg} global-group-reference-error');         
        }
    }   
}