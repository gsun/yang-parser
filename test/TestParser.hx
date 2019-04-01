import Parser;
import Context;

class TestParser {
    static function main(){
        var c = new Context();
        var p = new Parser(c);
        p.parse("./models");    
        for (st in c.mo) {
            var visitor = new AstStmtCountVisitor();
            visitor.visit(st);
        }
        for (st in c.mo) {
            var visitor = new AstNameConflictVisitor();
            visitor.visit(st);
        }
        for (st in c.mo) {
            var visitor = new AstImportVisitor();
            visitor.visit(st);
        }
        for (st in c.mo) {
            var visitor = new AstBaseTypeVisitor();
            visitor.visit(st);
        }
        for (st in c.mo) {
            var visitor = new AstUsesGroupVisitor();
            visitor.visit(st);
        }
        for (st in c.mo) {
            var visitor = new AstGroupingRecursionVisitor();
            visitor.visit(st);
        }       
        for (st in c.mo) {
            var visitor = new AstFeatureRecursionVisitor();
            visitor.visit(st);
        }
        for (st in c.mo) {
            var visitor = new AstIfFeatureVisitor();
            visitor.visit(st);
        }       
        for (st in c.mo) {
            var visitor = new AstStatusVisitor();
            visitor.visit(st);
        }       
        for (st in c.mo) {
            var visitor = new AstIdentityRecursionVisitor();
            visitor.visit(st);
        }       
        for (st in c.mo) {
            var visitor = new AstBaseVisitor();
            visitor.visit(st);
        }       
        for (st in c.mo) {
            var visitor = new AstTypeVisitor();
            visitor.visit(st);
        }       
        for (st in c.mo) {
            var visitor = new AstDefaultValidateVisitor();
            visitor.visit(st);
        }       
    }
}