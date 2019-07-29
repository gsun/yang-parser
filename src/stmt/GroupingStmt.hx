package stmt;
using Lambda;

class GroupingStmt extends Stmt {
    public var uses:List<Stmt>;
    public function new() {
        super();
        uses = new List();
    }
}