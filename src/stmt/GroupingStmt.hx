package stmt;
using Lambda;

class GroupingStmt extends Stmt {
    public var uses:List<Stmt>;
    public function new() {
        super();
        uses = new List();
    }
    override public function clone():Stmt {
        var c = new GroupingStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.origin = this;
        c.uses = this.uses.list();
        return c;
    }
}