package visitor;

import stmt.Stmt;
using Lambda;

class AstGroupingRecursionVisitor extends AstVisitor {  
    var group:List<String>;
    
    public function new() {
        super();
        group = new List();
    }      
    
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        group.push(stmt.arg);
        for (s in stmt.subList) {
            var visitor = new AstGroupingRecursionVisitor();
            visitor.group = group.list();
            visitor.visit(s);
        }
        group.pop();
    } 

    function uses_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.arg.indexOf(':') == -1) {
            assertFalse(group.has(stmt.arg), 'group-recursion-error');
        } else {
            var prefixName = stmt.arg.split(':');
            assertFalse(group.has(prefixName[1]), 'group-recursion-error');            
        }
    }   
}