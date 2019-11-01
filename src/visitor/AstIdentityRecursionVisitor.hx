package visitor;

import stmt.Stmt;
using Lambda;

class AstIdentityRecursionVisitor extends AstVisitor {  
    var identity:List<String>;
    
    public function new() {
        super();
        identity = new List();
    }      
    
    function identity_stmt(stmt:Stmt) {
        identity.push(stmt.arg);
        for (s in stmt.subs.base_stmt.iterator()) {
            var visitor = new AstIdentityRecursionVisitor();
            visitor.identity = identity.list();
            visitor.visit(s);
        }
        identity.pop();
        yield();
    } 

    function base_stmt(stmt:Stmt) {
        if (stmt.arg.indexOf(':') == -1) {
            assertFalse(identity.has(stmt.arg), 'identity-recursion-error');
        } else {
            var prefixName = stmt.arg.split(':');
            assertFalse(identity.has(prefixName[1]), 'identity-recursion-error');            
        }
    }   
}