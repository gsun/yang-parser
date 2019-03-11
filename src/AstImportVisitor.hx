import AstVisitor;
using Lambda;

class AstImportVisitor extends AstVisitor {
    public function module_stmt(stmt:Stmt, context:Dynamic) {
        for (i in stmt.findSubs("import_stmt")) {
            var m = stmt.ctx.mo[i.arg];
            assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
            assertTrue(m.keyword == "module", 'import_stmt ${i.arg} type-error');
            i.ref = m;
        }
        
        for (i in stmt.findSubs("include_stmt")) {
            var sub:Stmt = stmt.ctx.mo[i.arg];
            assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
            assertTrue(sub.keyword == "submodule", 'include_stmt ${i.arg} type-error');
            if ((stmt.findSub("yang_version_stmt") != null) && (sub.findSub("yang_version_stmt") != null)) {
                assertTrue(stmt.findSub("yang_version_stmt").arg == sub.findSub("yang_version_stmt").arg, 'include_stmt ${i.arg} version-error');
            }
            if (sub.findSubs("belongs_to_stmt").length == 1) {
                var p:Stmt = stmt.ctx.mo[sub.findSub("belongs_to_stmt").arg];
                assertTrue(stmt == p, 'include_stmt ${i.arg} belongs-to-error');              
            }
            i.ref = sub;
            sub.ref = stmt;
        }
    }
}