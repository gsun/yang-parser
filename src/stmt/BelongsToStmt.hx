package stmt;

class BelongsToStmt extends Stmt {
	public var module:Stmt;

	public function new() {
		super();
		module = null;
	}
}
