import AstVisitor;
using Lambda;

class AstBaseTypeVisitor extends AstVisitor {        
    public function typedef_stmt(stmt:Stmt, context:Dynamic) {
        var base_types = ["int8", "int16", "int32", "int64", "uint8", 
                          "uint16", "uint32", "uint64", "decimal64",
                          "string", "boolean", "enumeration", "bits", "binary", 
                          "leafref", "identityref", "instance-identifier",
                          "empty", "union"];
        for (t in base_types) {
            assertTrue(stmt.arg != t, 'typedef_stmt ${stmt.arg} base-type-error ', stmt);
        }
    }   
}