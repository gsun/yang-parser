package stmt;

class BaseStmt extends Stmt {
    public var identity:Stmt;
    
    public function new() {
        super();
        identity = null;
    }
    override public function clone():Stmt {
        var c = new BaseStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.identity = this.identity;
        return c;
    }
}