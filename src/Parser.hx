import sys.io.File;
import haxe.io.Path;

typedef Stmt = {
    type:String,
	keyword:String,
	arg:String,
	subs:Array<Stmt>,
}

@:jsRequire("./yang")
extern class YangParser {
    static function parse(grammer:String):Stmt;
}

class Parser {
	public var stmt:Map<String, Stmt>;  //infile=>Data
	
	public function new() {
		stmt = new Map<String, Stmt>();
	}
		
    function parseFile(infile:String) {
        try {
            var resource = File.getContent(infile);
            
            /*merge multi string into one in yang model before parse*/
            var ereg:EReg = ~/["'][\s\r\n]*\+[\s\r\n]*["']/g;
            resource = ereg.replace(resource, "");
            
			stmt[Path.withoutExtension(infile)] = YangParser.parse(resource);            
        } catch (e:Dynamic) {
            trace(infile + " parsed fail");
            if (e.location != null) {
                throw(e.location.start.line + ":" + e.location.start.column + ": " + e.message);
            } else {
                throw(e.message);
            }
        }       
    }
	
    public function parsePath(path:String) {
		try {
			if (sys.FileSystem.isDirectory(path)) {     
				var entries = sys.FileSystem.readDirectory(path);
				for (entry in entries) {
				  parsePath(path + '/' + entry);
				}
			} else {
				if (Path.extension(path) == "yang") parseFile(path);
			}
		} catch (e:String) {
			trace(e);
		}        
    }
}