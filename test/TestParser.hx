import Parser;
import Context;

class TestParser {
    static function main(){
        var c = new Context();
        var p = new Parser(c);
        p.parse("./models");    
        for (st in c.mo) {
            var visitor = new AstGrammerVisitor();
            visitor.visit(st, c);
        }
    }
}