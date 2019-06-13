import Stmt;

class TypeStmt extends Stmt {
    public var typedefine:Stmt;
    public function new() {
        super();
        typedefine = null;
    }
}