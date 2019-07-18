package stmt;

class ImportStmt extends Stmt {
    public var module:Stmt;
    public function new() {
        super();
        module = null;
    }
    override public function clone():Stmt {
        var c = new ImportStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.module = this.module;
        return c;
    }
}