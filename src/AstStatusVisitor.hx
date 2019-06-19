import AstVisitor;
import stmt.Stmt;
import stmt.Stmt.StmtStatus;

class AstStatusVisitor extends AstVisitor {
    function status_stmt(stmt:Stmt, context:Dynamic) {
        var status:StmtStatus = switch stmt.arg {
            case "obsolete": Obsolete;
            case "deprecated": Deprecated;
            default: Current;
        }
        if (stmt.parent.status == Current) stmt.parent.status = status;
    }
}