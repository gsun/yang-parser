package visitor;

import stmt.UsesStmt;
using Lambda;

class AstUsesGroupVisitor extends AstVisitor {  
    
    function uses_stmt(stmt:UsesStmt, context:Dynamic) {
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
                var belongs_to = stmt.top.sub.belongs_to_stmt;
                if (belongs_to.subs.prefix_stmt[prefix] == null) {
                    local = false;
                }
            }
        }
        if (local) {
            var parent = stmt.parent;
            while (parent != null) {
                var gg = parent.subs.grouping_stmt[arg];
                if (gg != null && gg.isValid()) stmt.grouping = gg;
                if (stmt.grouping != null) break;
                parent = parent.parent;
            }
            if (stmt.grouping ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'uses_stmt ${stmt.arg} include-module-error');
                    var gg = sub.subs.grouping_stmt[arg];
                    if (gg != null && gg.isValid()) stmt.grouping = gg;
                    if (stmt.grouping != null) break;
                }
            }
            assertTrue(stmt.grouping != null, 'uses_stmt ${stmt.arg} local-group-reference-error');
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[prefixName[0]] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'uses_stmt ${stmt.arg} global-group-module-error');
                    var gg = mo.subs.grouping_stmt[arg];
                    if (gg != null && gg.isValid()) stmt.grouping = gg;
                    if (stmt.grouping != null) break;
                }
            }   
            assertTrue(stmt.grouping != null, 'uses_stmt ${stmt.arg} global-group-reference-error');         
        }
    }   
}