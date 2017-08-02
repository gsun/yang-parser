import Parser;
import sys.io.File;

class Test {
	static function main(){
		try {
		    var result = Parser.parse(haxe.Resource.getString("yang"));
		    File.saveContent("result.json",  haxe.Json.stringify(result));
		} catch (e:Dynamic) {
			if (e.location != null) {
                trace(e.location.start.line + ":" + e.location.start.column + ": " + e.message);
            } else {
                trace(e.message);
            }
		}		
	}
}