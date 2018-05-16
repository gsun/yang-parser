import Parser;
import Context;
import Stmt;
import sys.io.File;
import haxe.io.Path;

class TestYinParser {
    static function main(){
        var c = new Context();
		c.yin = true;
        var p = new Parser(c);
        p.parse("./models/Yin/interface.yin");     		
    }
}