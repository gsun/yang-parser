import AstVisitor;
using Lambda;

class AstNameConflictVisitor extends AstVisitor {
        
    function container_stmt(stmt:Stmt, context:Dynamic) {      
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }
        
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }
    
    function input_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }
           
    function list_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }
    
    function module_stmt(stmt:Stmt, context:Dynamic) { 
        var types = ["typedef_stmt", "grouping_stmt", "feature_stmt", "identity_stmt", "extension_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
        }
    }

    function notification_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }
        
    function output_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }   
                
    function rpc_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }   
    
    function submodule_stmt(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt", "feature_stmt", "identity_stmt", "extension_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
        }
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