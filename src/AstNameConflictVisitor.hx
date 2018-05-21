import AstVisitor;
using Lambda;

class AstNameConfilctVisitor extends AstVisitor {
        
    public function container_stmt(stmt:Stmt, context:Dynamic) {      
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
        
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
    
    public function input_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
           
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) { 
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.feature_stmt, stmt.feature_stmt, stmt);
        nameConflict(stmt.identity_stmt, stmt.identity_stmt, stmt);
        nameConflict(stmt.extension_stmt, stmt.extension_stmt, stmt);		
    }

    public function notification_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
        
    public function output_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }   
                
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }   
    
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {       
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.feature_stmt, stmt.feature_stmt, stmt);
        nameConflict(stmt.identity_stmt, stmt.identity_stmt, stmt);
        nameConflict(stmt.extension_stmt, stmt.extension_stmt, stmt);
    }   
            
    public function nameConflict(a:Array<Stmt>, b:Array<Stmt>, stmt:Stmt) {
        for (t in a) {
            var count = b.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertTrue((count == 0), '${t.type} ${t.arg} name-conflict-error ', stmt);
        }
    }
}