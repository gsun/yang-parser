package stmt;
using Lambda;

class GroupingStmt extends Stmt {
    public var uses:List<Stmt>;
    public var isExpanded:Bool;
    public function new() {
        super();
        uses = new List();
        isExpanded = false;
    }
}