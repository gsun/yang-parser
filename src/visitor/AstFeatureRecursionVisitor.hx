package visitor;

import stmt.Stmt;
using Lambda;

class AstFeatureRecursionVisitor extends AstVisitor {  
    var feature:List<String>;
    
    public function new() {
        super();
        feature = new List();
    }      
    
    function feature_stmt(stmt:Stmt, context:Dynamic) {
        feature.push(stmt.arg);
        for (s in stmt.subs.if_feature_stmt.iterator()) {
            var visitor = new AstFeatureRecursionVisitor();
            visitor.feature = feature.list();
            visitor.visit(s);
        }
        feature.pop();
        yield();
    } 

    function if_feature_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.arg.indexOf(':') == -1) {
            assertFalse(feature.has(stmt.arg), 'feature-recursion-error');
        } else {
            var prefixName = stmt.arg.split(':');
            assertFalse(feature.has(prefixName[1]), 'feature-recursion-error');            
        }
    }   
}