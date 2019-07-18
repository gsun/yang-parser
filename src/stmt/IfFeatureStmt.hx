package stmt;

class IfFeatureStmt extends Stmt {
    public var feature:Stmt;
    public function new() {
        super();
        feature = null;
    }
    override public function clone():Stmt {
        var c = new IfFeatureStmt();
        c.type = this.type;
        c.keyword = this.keyword;
        c.arg = this.arg;
        c.location = this.location;
        c.ctx = this.ctx;
        c.feature = this.feature;
        return c;
    }
}