package stmt;

class IfFeatureStmt extends Stmt {
    public var feature:Stmt;
    public function new() {
        super();
        feature = null;
    }
}