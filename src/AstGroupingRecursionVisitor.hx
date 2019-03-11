import AstVisitor;
using Lambda;

class AstGroupingRecursionVisitor extends AstVisitor {  
    var group:List<String>;
    
    public function new() {
        super();
        group = new List();
    }      
    
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        group.push(stmt.arg);
        for (s in stmt.findSubs("uses_stmt")) {
            var visitor = new AstGroupingRecursionVisitor();
            visitor.group = group.list();
            visitor.visit(s);
        }
        group.pop();
    } 

    public function uses_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.arg.indexOf(':') == -1) {
            assertTrue(group.has(stmt.arg) == false, 'uses_stmt ${stmt.arg} group-recursion-error');
        } else {
            var prefixName = stmt.arg.split(':');
            assertTrue(group.has(prefixName[1]) == false, 'uses_stmt ${stmt.arg} group-recursion-error');            
        }
    }   
}