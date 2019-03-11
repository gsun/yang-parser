import AstVisitor;
using Lambda;

class AstGroupingRecursionVisitor extends AstVisitor {  
    var group:List<String>;
    
    public function new() {
        super();
        group = new List();
    }      
    
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        group.push(stmt.arg);
        for (s in stmt.findSubs("uses_stmt")) {
            var visitor = new AstGroupingRecursionVisitor();
            visitor.group = group.list();
            visitor.visit(s);
        }
        group.pop();
    } 

    function uses_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.arg.indexOf(':') == -1) {
            assertFalse(group.has(stmt.arg), 'uses_stmt ${stmt.arg} group-recursion-error');
        } else {
            var prefixName = stmt.arg.split(':');
            assertFalse(group.has(prefixName[1]), 'uses_stmt ${stmt.arg} group-recursion-error');            
        }
    }   
}