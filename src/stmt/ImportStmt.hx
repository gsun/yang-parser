package stmt;

class ImportStmt extends Stmt {
	public var module:Stmt;

	public function new() {
		super();
		module = null;
	}
}
