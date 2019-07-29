package stmt;

class TypeStmt extends Stmt {
    //point to the typedef stmt, if it's a user define type.
    //the user define type stmt has it's own type stmt, which may be base type or user define type.
    public var typedefine:Stmt;
    public function new() {
        super();
        typedefine = null; 
    }
}