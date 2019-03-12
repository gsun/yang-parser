import AstVisitor;
using Lambda;

class AstNameConflictVisitor extends AstVisitor {
        
    function container_stmt(stmt:Stmt, context:Dynamic) {      
        check2(stmt, context);
    }
        
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        check2(stmt, context);
    }
    
    function input_stmt(stmt:Stmt, context:Dynamic) {
        check2(stmt, context);
    }
           
    function list_stmt(stmt:Stmt, context:Dynamic) {
        check2(stmt, context);
    }
    
    function module_stmt(stmt:Stmt, context:Dynamic) { 
        check5(stmt, context);
    }

    function notification_stmt(stmt:Stmt, context:Dynamic) {
        check2(stmt, context);
    }
        
    function output_stmt(stmt:Stmt, context:Dynamic) {
        check2(stmt, context);
    }   
                
    function rpc_stmt(stmt:Stmt, context:Dynamic) {
        check2(stmt, context);
    }   
    
    function submodule_stmt(stmt:Stmt, context:Dynamic) {
        check5(stmt, context);
    }   
    
    function check2(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
            nameTopConflict(stmt, i);
        }
    }
    
    function check5(stmt:Stmt, context:Dynamic) {
        var types = ["typedef_stmt", "grouping_stmt", "feature_stmt", "identity_stmt", "extension_stmt"]; 
        for (i in types) {
            nameConflict(stmt, i);
        }
    }
            
    function nameConflict(stmt:Stmt, type:String) {
        var a = stmt.findSubs(type);
        for (t in a) {
            var count = a.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertEquals(count, 0, '${t.type} ${t.arg} name-conflict-error');
        }
    }
    
    function nameTopConflict(stmt:Stmt, type:String) {
        var a = stmt.top.findSubs(type);
        var b = stmt.findSubs(type);
        for (t in a) {
            var count = b.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertEquals(count, 0, '${t.type} ${t.arg} name-top-conflict-error');
        }
    }
}