import AstVisitor;
using Lambda;

class AstImportVisitor extends AstVisitor {    
    public function module_stmt(stmt:Stmt, context:Dynamic) {       
        for (i in stmt.import_stmt) {
            var m = stmt.ctx.mo[i.arg];
            assertTrue(m != null, 'import_stmt ${i.arg} exist-error ', stmt);
            assertTrue(m.keyword == "module", 'import_stmt ${i.arg} type-error ', stmt);
            i.ref = m;
        }
        
        for (i in stmt.include_stmt) {
            var sub:Stmt = stmt.ctx.mo[i.arg];
            assertTrue(sub != null, 'include_stmt ${i.arg} exist-error ', stmt);
            assertTrue(sub.keyword == "submodule", 'include_stmt ${i.arg} type-error ', stmt);
            if (stmt.yang_version_stmt[0] != null && sub.yang_version_stmt[0] != null) {
                assertTrue(stmt.yang_version_stmt[0].arg == sub.yang_version_stmt[0].arg, 'include_stmt ${i.arg} version-error ', stmt);
            }
            if (sub.belongs_to_stmt.length == 1) {
                var p:Stmt = stmt.ctx.mo[sub.belongs_to_stmt[0].arg];
                assertTrue(stmt == p, 'include_stmt ${i.arg} belongs-to-error', stmt);              
            }
            i.ref = sub;
            sub.ref = stmt;
        }
    }
}