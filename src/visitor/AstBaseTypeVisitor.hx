package visitor;

import stmt.Stmt;
using Lambda;

class AstBaseTypeVisitor extends AstVisitor {        
    function typedef_stmt(stmt:Stmt, context:Dynamic) {
        var base_types = ["int8", "int16", "int32", "int64", "uint8", 
                          "uint16", "uint32", "uint64", "decimal64",
                          "string", "boolean", "enumeration", "bits", "binary", 
                          "leafref", "identityref", "instance-identifier",
                          "empty", "union"];
        assertFalse(base_types.has(stmt.arg), 'base-type-error');
    }   
}