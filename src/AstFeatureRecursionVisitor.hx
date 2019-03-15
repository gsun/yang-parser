import AstVisitor;
using Lambda;

class AstFeatureRecursionVisitor extends AstVisitor {  
    var feature:List<String>;
    
    public function new() {
        super();
        feature = new List();
    }      
    
    function feature_stmt(stmt:Stmt, context:Dynamic) {
        feature.push(stmt.arg);
        for (s in stmt.findSubs("if_feature_stmt")) {
            var visitor = new AstFeatureRecursionVisitor();
            visitor.feature = feature.list();
            visitor.visit(s);
        }
        feature.pop();
    } 

    function if_feature_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.arg.indexOf(':') == -1) {
            assertFalse(feature.has(stmt.arg), 'if_feature_stmt ${stmt.arg} feature-recursion-error');
        } else {
            var prefixName = stmt.arg.split(':');
            assertFalse(feature.has(prefixName[1]), 'if_feature_stmt ${stmt.arg} feature-recursion-error');            
        }
    }   
}