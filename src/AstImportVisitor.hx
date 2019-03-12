import AstVisitor;
using Lambda;

class AstImportVisitor extends AstVisitor {
    function module_stmt(stmt:Stmt, context:Dynamic) {
        for (i in stmt.findSubs("import_stmt")) {
            var m = stmt.getMo(i.arg);
            assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
            assertEquals(m.keyword, "module", 'import_stmt ${i.arg} type-error');
            i.ref = m;
        }
        
        for (i in stmt.findSubs("include_stmt")) {
            var sub:Stmt = stmt.getMo(i.arg);
            assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
            assertEquals(sub.keyword, "submodule", 'include_stmt ${i.arg} type-error');
            
            var module_version = stmt.findSub("yang_version_stmt");
            var sub_version = sub.findSub("yang_version_stmt");
            if (module_version != null && sub_version != null) {
                assertEquals(module_version.arg, sub_version.arg, 'include_stmt ${i.arg} version-error');
            }
            i.ref = sub;
        }
    }
    
    function submodule_stmt(stmt:Stmt, context:Dynamic) {
        var belongsto = stmt.findSub("belongs_to_stmt");
        assertTrue(belongsto != null, 'include_stmt ${stmt.arg} belongs-to-error');
        
        var mo:Stmt = stmt.getMo(belongsto.arg);
        assertTrue(mo != null, 'include_stmt ${stmt.arg} belongs-to-error');
        belongsto.ref = mo;
        
        for (i in stmt.findSubs("import_stmt")) {
            var m = stmt.getMo(i.arg);
            assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
            assertEquals(m.keyword, "module", 'import_stmt ${i.arg} type-error');
            i.ref = m;
        }
        
        for (i in stmt.findSubs("include_stmt")) {
            var sub:Stmt = stmt.getMo(i.arg);
            assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
            assertEquals(sub.keyword, "submodule", 'include_stmt ${i.arg} type-error');
            
            var module_version = stmt.findSub("yang_version_stmt");
            var sub_version = sub.findSub("yang_version_stmt");
            if (module_version != null && sub_version != null) {
                assertEquals(module_version.arg, sub_version.arg, 'include_stmt ${i.arg} version-error');
            }
            i.ref = sub;
        }
    }
}