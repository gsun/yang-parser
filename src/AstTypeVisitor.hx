import AstVisitor;
using Lambda;

class AstTypeVisitor extends AstVisitor {  
    
    function type_stmt(stmt:Stmt, context:Dynamic) {
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
        } else {
            var base_types = ["int8", "int16", "int32", "int64", "uint8", 
                              "uint16", "uint32", "uint64", "decimal64",
                              "string", "boolean", "enumeration", "bits", "binary", 
                              "leafref", "identityref", "instance-identifier",
                              "empty", "union"];
            if (base_types.has(stmt.arg)) {
                switch stmt.arg {
                    case "enumeration": assertTrue(stmt.subs.enum_stmt.length >= 1, 'type_stmt ${stmt.arg} type-error');
                    case "bits": assertTrue(stmt.subs.bit_stmt.length >= 1, 'type_stmt ${stmt.arg} type-error');
                    case "union": assertTrue(stmt.subs.type_stmt.length >= 1, 'type_stmt ${stmt.arg} type-error');
                    case "identityref": assertEquals(stmt.subs.base_stmt.length, 1, 'type_stmt ${stmt.arg} type-error');
                    case "leafref": assertEquals(stmt.subs.path_stmt.length, 1, 'type_stmt ${stmt.arg} type-error');
                    case "decimal64": assertEquals(stmt.subs.fraction_digits_stmt.length, 1, 'type_stmt ${stmt.arg} type-error');
                }
                return;
            }
        }
        if (local) {
            var parent = stmt.parent;
            while (parent != null) {
                stmt.ref = parent.subs.typedef_stmt[arg];
                if (stmt.ref != null) break;
                parent = parent.parent;
            }
            if (stmt.ref ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'type_stmt ${stmt.arg} include-module-error');
                    stmt.ref = sub.subs.typedef_stmt[arg];
                    if (stmt.ref != null) break;
                }
            }
            assertTrue(stmt.ref != null, 'type_stmt ${stmt.arg} local-typedef-reference-error');
        } else {
            var prefixName:Array<String> = stmt.arg.split(':');
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[prefixName[0]] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'type_stmt ${stmt.arg} global-typedef-module-error');
                    stmt.ref = mo.subs.typedef_stmt[arg];
                    if (stmt.ref != null) break;
                }
            }   
            assertTrue(stmt.ref != null, 'type_stmt ${stmt.arg} global-typedf-reference-error');         
        }
    }   
}