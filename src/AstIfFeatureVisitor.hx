import AstVisitor;
using Lambda;

class AstIfFeatureVisitor extends AstVisitor {  
    
    function if_feature_stmt(stmt:Stmt, context:Dynamic) {
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
                stmt.ref = parent.subs.feature_stmt[arg];
                if (stmt.ref != null) {
                    break;
                }
                parent = parent.parent;
            }
            if (stmt.ref ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'if_feature_stmt ${stmt.arg} include-module-error');
                    stmt.ref = sub.subs.feature_stmt[arg];
                    if (stmt.ref != null) {
                        break;
                    }
                }
            }
            if (stmt.ref == null) stmt.parent.status = Prune;
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[prefixName[0]] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'if_feature_stmt ${stmt.arg} global-feature-module-error');
                    stmt.ref = mo.subs.feature_stmt[arg];
                    if (stmt.ref != null) {
                        break;
                    }
                }
            }
            if (stmt.ref == null) stmt.parent.status = Prune;
        }
    }   
}