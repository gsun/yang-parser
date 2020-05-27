package stmt;

class IncludeStmt extends Stmt {
	public var subModule:Stmt;

	public function new() {
		super();
		subModule = null;
	}
}
