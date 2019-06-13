import AstVisitor;
using Lambda;

class AstImportVisitor extends AstVisitor {
    function module_stmt(stmt:ModuleStmt, context:Dynamic) {
        for (ii in stmt.subs.import_stmt.iterator()) {
            var i:ImportStmt = cast ii;
            var m = stmt.getMo(i.arg);
            assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
            assertEquals(m.keyword, "module", 'import_stmt ${i.arg} type-error');
            if (m != null && m.status == Current) i.module = m;
        }
        
        for (ii in stmt.subs.include_stmt.iterator()) {
            var i:IncludeStmt = cast ii;
            var sub:Stmt = stmt.getMo(i.arg);
            assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
            assertEquals(sub.keyword, "submodule", 'include_stmt ${i.arg} type-error');
            
            var module_version = stmt.sub.yang_version_stmt;
            var sub_version = sub.sub.yang_version_stmt;
            if (module_version != null && sub_version != null) {
                assertEquals(module_version.arg, sub_version.arg, 'include_stmt ${i.arg} version-error');
            }
            if (sub != null && sub.status == Current) i.subModule = sub;
        }
    }
    
    function submodule_stmt(stmt:SubmoduleStmt, context:Dynamic) {
        var belongsto:BelongsToStmt = cast stmt.sub.belongs_to_stmt;
        assertTrue(belongsto != null, 'include_stmt ${stmt.arg} belongs-to-error');
        
        var mo:Stmt = stmt.getMo(belongsto.arg);
        assertTrue(mo != null, 'include_stmt ${stmt.arg} belongs-to-error');
        if (mo != null && mo.status == Current) belongsto.module = mo;
        
        for (ii in stmt.subs.import_stmt.iterator()) {
            var i:ImportStmt = cast ii;
            var m = stmt.getMo(i.arg);
            assertTrue(m != null, 'import_stmt ${i.arg} exist-error');
            assertEquals(m.keyword, "module", 'import_stmt ${i.arg} type-error');
            if (m != null && m.status == Current) i.module = m;
        }
        
        for (ii in stmt.subs.include_stmt.iterator()) {
            var i:IncludeStmt = cast ii;
            var sub:Stmt = stmt.getMo(i.arg);
            assertTrue(sub != null, 'include_stmt ${i.arg} exist-error');
            assertEquals(sub.keyword, "submodule", 'include_stmt ${i.arg} type-error');
            
            var module_version = stmt.sub.yang_version_stmt;
            var sub_version = sub.sub.yang_version_stmt;
            if (module_version != null && sub_version != null) {
                assertEquals(module_version.arg, sub_version.arg, 'include_stmt ${i.arg} version-error');
            }
            if (sub != null && sub.status == Current) i.subModule = sub;
        }
    }
}