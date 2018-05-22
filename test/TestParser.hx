import Parser;
import Context;

class TestParser {
    static function main(){
        var c = new Context();
        var p = new Parser(c);
        p.parse("./models");    
        for (st in c.mo) {
            var visitor = new AstStmtCountVisitor();
            visitor.visit(st, c);
        }
        for (st in c.mo) {
            var visitor = new AstNameConflictVisitor();
            visitor.visit(st, c);
        }
        for (st in c.mo) {
            var visitor = new AstImportVisitor();
            visitor.visit(st, c);
        }
        for (st in c.mo) {
            var visitor = new AstBaseTypeVisitor();
            visitor.visit(st, c);
        }
        for (st in c.mo) {
            var visitor = new AstUsesGroupVisitor();
            visitor.visit(st, c);
        }
        for (st in c.mo) {
            var visitor = new AstGroupingRecursionVisitor();
            visitor.visit(st, c);
        }		
    }
}