import AstVisitor;
import Stmt.StmtStatus;
using Lambda;

class AstRefineVisitor extends AstVisitor {
    function refine_stmt(stmt:Stmt, context:Dynamic) {
        var t = findSub(stmt.parent.ref, stmt.arg);
        assertTrue(t != null, 'refine_stmt ${stmt.arg} target-ref-error');
    }
    
    function findSub(stmt:Stmt, arg:String):Null<Stmt> {
        var t = stmt.subList.find(function(ch) { return (ch.arg == arg); });
        if (t != null) return t;
        for (e in stmt.subs.uses_stmt.iterator()) {
            var t = findSub(e.ref, arg);
            if (t != null) return t;
        }
        return null;
    }
}