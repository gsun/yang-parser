import AstVisitor;
using Lambda;

class AstUnknownVisitor extends AstVisitor {  
    
    function unknown_stmt(stmt:Stmt, context:Dynamic) {
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
                stmt.ref = parent.subs.extension_stmt[keyword];
                if (stmt.ref != null) break;
                parent = parent.parent;
            }
            if (stmt.ref ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'type_stmt ${stmt.keyword} include-module-error');
                    stmt.ref = sub.subs.extension_stmt[keyword];
                    if (stmt.ref != null) break;
                }
            }
            assertTrue(stmt.ref != null || stmt.parent.type == 'unknown_stmt', 'unknown_stmt ${stmt.arg} local-extension-reference-error');
        } else {
            var prefixName:Array<String> = stmt.keyword.split(':');
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[prefixName[0]] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'type_stmt ${stmt.keyword} global-extension-module-error');
                    stmt.ref = mo.subs.extension_stmt[keyword];
                    if (stmt.ref != null) break;
                }
            }   
            assertTrue(stmt.ref != null || stmt.parent.type == 'unknown_stmt', 'unknown_stmt ${stmt.keyword} global-extension-reference-error');         
        }
    }
}