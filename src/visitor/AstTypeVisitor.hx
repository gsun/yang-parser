package visitor;

import stmt.TypeStmt;
import stmt.Stmt.NodeId;
using Lambda;

class AstTypeVisitor extends AstVisitor {  
    
    function type_stmt(stmt:TypeStmt, context:Dynamic) {
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
        } else {
            var base_types = ["int8", "int16", "int32", "int64", "uint8", 
                              "uint16", "uint32", "uint64", "decimal64",
                              "string", "boolean", "enumeration", "bits", "binary", 
                              "leafref", "identityref", "instance-identifier",
                              "empty", "union"];
            if (base_types.has(stmt.arg)) {
                switch stmt.arg {
                    case "enumeration": {
                        assertTrue(stmt.subs.enum_stmt.length >= 1, 'type_stmt ${stmt.arg} type-error');
                        var value = 0;
                        var valueArray = [];
                        for (e in stmt.subs.enum_stmt.iterator()) {
                            if (e.sub.value_stmt != null) value = Std.parseInt(e.sub.value_stmt.arg);
                            assertTrue(value >= -2147483648 && value <= 2147483647, 'type_stmt ${stmt.arg} value-error');
                            assertFalse(valueArray.has(value), 'type_stmt ${stmt.arg} type-error');
                            valueArray.push(value);
                            value++;
                        }
                    }
                    case "bits": {
                        assertTrue(stmt.subs.bit_stmt.length >= 1, 'type_stmt ${stmt.arg} type-error');
                        var position = 0;
                        var positionArray = [];
                        for (e in stmt.subs.bit_stmt.iterator()) {
                            if (e.sub.position_stmt != null) position = Std.parseInt(e.sub.position_stmt.arg);
                            assertTrue(position >= 0 && position <= 4294967295, 'type_stmt ${stmt.arg} position-error');
                            assertFalse(positionArray.has(position), 'type_stmt ${stmt.arg} position-error');
                            positionArray.push(position);
                            position++;
                        }
                    }
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
                var tt = parent.subs.typedef_stmt[nid.id];
                if (tt != null && tt.isValid()) stmt.typedefine = tt;
                if (stmt.typedefine != null) break;
                parent = parent.parent;
            }
            if (stmt.typedefine ==  null) {  //check the submodule
                for (i in stmt.top.subs.include_stmt.iterator()) {
                    var sub = stmt.getMo(i.arg);
                    assertTrue(sub != null, 'type_stmt ${stmt.arg} include-module-error');
                    var tt = sub.subs.typedef_stmt[nid.id];
                    if (tt != null && tt.isValid()) stmt.typedefine = tt;
                    if (stmt.typedefine != null) break;
                }
            }
            assertTrue(stmt.typedefine != null, 'type_stmt ${stmt.arg} local-typedef-reference-error');
        } else {
            for (m in stmt.top.subs.import_stmt.iterator()) {
                if (m.subs.prefix_stmt[nid.prefix] != null) {
                    var mo = stmt.getMo(m.arg);
                    assertTrue(mo != null, 'type_stmt ${stmt.arg} global-typedef-module-error');
                    var tt = mo.subs.typedef_stmt[nid.id];
                    if (tt != null && tt.isValid()) stmt.typedefine = tt;
                    if (stmt.typedefine != null) break;
                }
            }   
            assertTrue(stmt.typedefine != null, 'type_stmt ${stmt.arg} global-typedf-reference-error');         
        }
    }
}