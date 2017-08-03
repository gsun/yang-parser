import Parser;
import sys.io.File;

class Test {
	static function main(){
		try {
			var resource = haxe.Resource.getString("yang");
			
			/*merge multi string into one in yang model before parse*/
			var ereg:EReg = ~/["'][\s\r\n]*\+[\s\r\n]*["']/g;
			resource = ereg.replace(resource, "");
			
		    var result = Parser.parse(resource);
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