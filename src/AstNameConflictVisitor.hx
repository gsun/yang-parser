import AstVisitor;
using Lambda;

class AstNameConflictVisitor extends AstVisitor {
        
    public function container_stmt(stmt:Stmt, context:Dynamic) {      
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
        
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
    
    public function input_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
           
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) { 
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "feature_stmt");
        nameConflict(stmt, "identity_stmt");
        nameConflict(stmt, "extension_stmt");
    }

    public function notification_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameTopConflict(stmt, "typedef_stmt");
        nameTopConflict(stmt, "grouping_stmt");
    }
        
    public function output_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
    }   
                
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
    }   
    
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt, "typedef_stmt");
        nameConflict(stmt, "grouping_stmt");
        nameConflict(stmt, "feature_stmt");
        nameConflict(stmt, "identity_stmt");
        nameConflict(stmt, "extension_stmt");
    }   
            
    public function nameConflict(stmt:Stmt, type:String) {
        var a = stmt.findSubs(type);
        for (t in a) {
            var count = a.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertTrue((count == 0), '${t.type} ${t.arg} name-conflict-error');
        }
    }
    public function nameTopConflict(stmt:Stmt, type:String) {
        var a = stmt.top.findSubs(type);
        var b = stmt.findSubs(type);
        for (t in a) {
            var count = b.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertTrue((count == 0), '${t.type} ${t.arg} name-top-conflict-error');
        }
    }
}