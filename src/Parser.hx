import sys.io.File;
import haxe.io.Path;
import Stmt;

@:jsRequire("./yang")
extern class YangParser {
    static function parse(grammer:String):StmtRaw;
}

typedef StmtRaw = {
    var type:String;
    var keyword:String;
    var arg:String;
    var subs:Array<StmtRaw>;
    var location:Location;
}

class Parser {
    public var ctx:Context;
    
    public function new(ctx:Context) {
        this.ctx = ctx;
    }

    public function buildStmt(raw:StmtRaw):Stmt {
        var stmt = new Stmt();
        stmt.type = raw.type;
        stmt.keyword = raw.keyword;
        stmt.arg = raw.arg;
        stmt.location = raw.location;
		stmt.ctx = ctx;
        for (s in raw.subs) {
            var child = buildStmt(s);
            child.parent = stmt;
            stmt.subs.push(child);
        } 
        return stmt;
    }
    
    function parseYangFile(infile:String) {
        try {
            var resource = File.getContent(infile);
            
            /*merge multi string into one in yang model before parse for openconfig model*/
            var ereg:EReg = ~/["'][\s\r\n]*\+[\s\r\n]*["']/g;
            resource = ereg.replace(resource, "");            
            var stmtRaw = YangParser.parse(resource);
            
            if (stmtRaw.keyword != "module" && stmtRaw.keyword != "submodule") throw ('$infile does not define module/submodule');    
            if (ctx.mo[stmtRaw.arg] !=  null) throw('${stmtRaw.keyword} ${stmtRaw.arg} in $infile conflict with ${ctx.mo[stmtRaw.arg].path}');    
            
            var stmt = buildStmt(stmtRaw);
            stmt.dict["path"] = infile;
            ctx.mo[stmtRaw.arg] = stmt;    
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
	
    function parseYinFile(infile:String) {
        try {
            var resource = File.getContent(infile);
                      
            var stmt = YinParser.parse(Xml.parse(resource));
            
            if (stmt.keyword != "module" && stmt.keyword != "submodule") throw ('$infile does not define module/submodule');    
            if (ctx.mo[stmt.arg] !=  null) throw('${stmt.keyword} ${stmt.arg} in $infile conflict with ${ctx.mo[stmt.arg].dict["path"]}');    
            
            stmt.dict["path"] = infile;
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
				if (ctx.yin == false) {
                    if (Path.extension(path) == "yang") parseYangFile(path);
				} else {
					if (Path.extension(path) == "yin") parseYinFile(path);
				}
            }
        } catch (e:String) {
            trace(e);
        }   
    }
}