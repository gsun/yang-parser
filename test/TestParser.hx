import Parser;

class TestParser {
    static function main(){
        var p = new Parser();
        p.parsePath("./models");	
        for (st in p.stmt.keys()) {
			trace(st);
		}		
    }
}