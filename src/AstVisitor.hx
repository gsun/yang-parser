import Stmt;

class AstVisitor implements Dynamic<Stmt> {
    
    public function new() {}
    
    public function visit(stmt:Stmt, context:Dynamic=null) {
        var method = Reflect.field(this, stmt.type);
        if (method != null) {
            Reflect.callMethod(this, method, [stmt, context]);
        }
        
        for (s in stmt.subs) {
            visit(s, context);
        }
    }
    
    function assertTrue( b:Bool, msg:String, stmt:Stmt ) {
        if (b != true){
            trace('${msg} in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        }
    }
    
    function assertFalse( b:Bool, msg:String, stmt:Stmt ) {
        if (b == true){
            trace('${msg} in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        }
    }
    
    function assertEquals<T>( expected:T , actual:T,  msg:String, stmt:Stmt) {
        if (expected != actual){
            trace('${msg} in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        }
    }
}
