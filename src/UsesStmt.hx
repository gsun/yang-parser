import Stmt;

class UsesStmt extends Stmt {
    public var grouping:Stmt;
    public function new() {
        super();
        grouping = null;
    }
}