package visitor;

import stmt.Stmt;

class AstVisitor {
    var stmt:Stmt;
    var termFlag:Bool;

    public function new() {
        stmt = null;
        termFlag = false;
    }
    
    public function terminate() {
        termFlag = true;
    }
    
    public function visit(stmt:Stmt, context:Dynamic=null) {
        if (!stmt.isValid()) return;
        
        this.stmt = stmt;
        var method = Reflect.field(this, stmt.type);
        if (method != null) {
            Reflect.callMethod(this, method, [stmt, context]);
        }
        /* all the sub stmts are visited by default, and the visit can be terminated manually.*/
        /* the terminate() can be called in stmt.type method for specific AstVisitor.*/
        if (termFlag) {
            termFlag = false;
        } else {
            for (s in stmt.subList) {
                visit(s, context);
            }
        }

        var post = Reflect.field(this, 'post_${stmt.type}');
        if (post != null) {
            Reflect.callMethod(this, post, [stmt, context]);
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
