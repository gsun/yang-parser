package stmt;

class UsesStmt extends Stmt {
    public var grouping:Stmt;
    public function new() {
        super();
        grouping = null;
    }
    override public function clone():Stmt {
        var c = new UsesStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.grouping = this.grouping;
        return c;
    }
}