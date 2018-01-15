import Parser.YangParser;
import sys.io.File;
import haxe.io.Path;

class Test {
    static function parseFile(infile:String) {
        try {
            var resource = File.getContent(infile);
            
            /*merge multi string into one in yang model before parse*/
            var ereg:EReg = ~/["'][\s\r\n]*\+[\s\r\n]*["']/g;
            resource = ereg.replace(resource, "");
            
            var result = YangParser.parse(resource);
            var outfile = infile + ".json";
            File.saveContent(outfile,  haxe.Json.stringify(result, null, " "));
            //trace(infile + " parsed success");
        } catch (e:Dynamic) {
            trace(infile + " parsed fail");
            if (e.location != null) {
                trace(e.location.start.line + ":" + e.location.start.column + ": " + e.message);
            } else {
                trace(e.message);
            }
        }       
    }
    static function parsePath(path:String) {
        if (sys.FileSystem.isDirectory(path)) {     
            var entries = sys.FileSystem.readDirectory(path);
            for (entry in entries) {
              parsePath(path + '/' + entry);
            }
        } else {
            if (Path.extension(path) == "yang") parseFile(path);
        }
        
    }
    static function main(){
        parsePath("./models");      
    }
}