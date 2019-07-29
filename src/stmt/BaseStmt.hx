package stmt;

class BaseStmt extends Stmt {
    public var identity:Stmt;
    
    public function new() {
        super();
        identity = null;
    }
}