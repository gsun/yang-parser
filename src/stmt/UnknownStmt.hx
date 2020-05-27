package stmt;

class UnknownStmt extends Stmt {
	public var extension:Stmt;

	public function new() {
		super();
		extension = null;
	}
}
