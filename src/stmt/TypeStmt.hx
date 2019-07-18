package stmt;

class TypeStmt extends Stmt {
    public var typedefine:Stmt;
    public function new() {
        super();
        typedefine = null;
    }
    override public function clone():Stmt {
        var c = new TypeStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.typedefine = this.typedefine;
        return c;
    }
}