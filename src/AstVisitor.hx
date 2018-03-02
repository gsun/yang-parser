import Stmt;

class AstVisitor implements Dynamic<Stmt> {
    
    public function new() {}
    
    public function visit(stmt:Stmt, context:Dynamic=null) {
        var method = Reflect.field(stmt, stmt.type);
        if (method != null) {
            Reflect.callMethod(stmt, method, [stmt, context]);
        }
        
        for (s in stmt.subs) {
            visit(s, context);
        }
    }
}
