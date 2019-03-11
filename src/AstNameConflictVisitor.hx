import AstVisitor;
using Lambda;

class AstNameConflictVisitor extends AstVisitor {
        
    function container_stmt(stmt:Stmt, context:Dynamic) {      
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
        
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
    
    function input_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
           
    function list_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
    
    function module_stmt(stmt:Stmt, context:Dynamic) { 
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "feature_stmt");
        nameConflict(stmt, "identity_stmt");
        nameConflict(stmt, "extension_stmt");
    }

    function notification_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
        
    function output_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
    }   
                
    function rpc_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
    }   
    
    function submodule_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "feature_stmt");
        nameConflict(stmt, "identity_stmt");
        nameConflict(stmt, "extension_stmt");
    }   
            
    function nameConflict(stmt:Stmt, type:String) {
        var a = stmt.findSubs(type);
        for (t in a) {
            var count = a.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertTrue((count == 0), '${t.type} ${t.arg} name-conflict-error');
        }
    }
    function nameTopConflict(stmt:Stmt, type:String) {
        var a = stmt.top.findSubs(type);
        var b = stmt.findSubs(type);
        for (t in a) {
            var count = b.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertTrue((count == 0), '${t.type} ${t.arg} name-top-conflict-error');
        }
    }
}