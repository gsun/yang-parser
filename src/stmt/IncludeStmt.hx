package stmt;

class IncludeStmt extends Stmt {
    public var subModule:Stmt;
    public function new() {
        super();
        subModule = null;
    }
    override public function clone():Stmt {
        var c = new IncludeStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.subModule = this.subModule;
        return c;
    }
}