import stmt.Stmt;

class AstVisitor {
    var stmt:Stmt;

    public function new() {}
    
    public function visit(stmt:Stmt, context:Dynamic=null) {
        if (stmt.status != Current) return;
        
        this.stmt = stmt;
        var method = Reflect.field(this, stmt.type);
        if (method != null) {
            Reflect.callMethod(this, method, [stmt, context]);
        }
        
        for (s in stmt.subList) {
            visit(s, context);
        }
    }
    
    function assertTrue(b:Bool, msg:String) {
        if (b != true){
            trace('${msg} in ${stmt}');
        }
    }
    
    function assertFalse(b:Bool, msg:String) {
        if (b == true){
            trace('${msg} in ${stmt}');
        }
    }
    
    function assertEquals<T>(expected:T , actual:T,  msg:String) {
        if (expected != actual){
            trace('${msg} in ${stmt}');
        }
    }
}
