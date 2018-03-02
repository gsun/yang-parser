import sys.io.File;
import haxe.io.Path;
import Stmt;

@:jsRequire("./yang")
extern class YangParser {
    static function parse(grammer:String):Stmt;
}

class Parser {
    public var ctx:Context;
    
    public function new(ctx:Context) {
        this.ctx = ctx;
    }

    public function setParent(stmt:Stmt, parent:Stmt=null) {
        stmt.parent = parent;         
        for (s in stmt.subs) {
            setParent(s, stmt);
        } 
    }
    
    function parseFile(infile:String) {
        try {
            var resource = File.getContent(infile);
            
            /*merge multi string into one in yang model before parse for openconfig model*/
            var ereg:EReg = ~/["'][\s\r\n]*\+[\s\r\n]*["']/g;
            resource = ereg.replace(resource, "");            
            var stmt = YangParser.parse(resource);
            
            if (stmt.keyword != "module" && stmt.keyword != "submodule") throw ('$infile does not define module/submodule');    
            if (ctx.mo[stmt.arg] !=  null) throw('${stmt.keyword} ${stmt.arg} in $infile conflict with ${ctx.mo[stmt.arg].i_path}');    
            setParent(stmt);
            stmt.i_path = infile;
            ctx.mo[stmt.arg] = stmt;    
        } catch (e:String) {
            trace(e);
        } catch (e:Dynamic) {
            if (e.location != null) {
                throw(e.location.start.line + ":" + e.location.start.column + ": " + e.message);
            } else {
                throw(e.message);
            }
        }       
    }
    
    public function parse(path:String) {
        try {
            if (sys.FileSystem.isDirectory(path)) {     
                var entries = sys.FileSystem.readDirectory(path);
                for (entry in entries) {
                  parse(path + '/' + entry);
                }
            } else {
                if (Path.extension(path) == "yang") parseFile(path);
            }
        } catch (e:String) {
            trace(e);
        }   
    }
}