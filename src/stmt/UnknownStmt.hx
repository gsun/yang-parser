package stmt;

class UnknownStmt extends Stmt {
    public var extension:Stmt;
    public function new() {
        super();
        extension = null;
    }
    override public function clone():Stmt {
        var c = new UnknownStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.extension = this.extension;
        return c;
    }
}