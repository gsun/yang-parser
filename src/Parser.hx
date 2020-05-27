import sys.io.File;
import haxe.io.Path;
import stmt.Stmt;

@:jsRequire("./yang")
extern class YangParser {
	static function parse(grammer:String):StmtRaw;
}

class Parser {
	public var ctx:Context;

	public function new(ctx:Context) {
		this.ctx = ctx;
	}

	function parseYangFile(infile:String) {
		try {
			var resource = File.getContent(infile);

			/*merge multi string into one in yang model before parse for openconfig model*/
			var ereg:EReg = ~/["'][\s\r\n]*\+[\s\r\n]*["']/g;
			resource = ereg.replace(resource, "");
			var stmtRaw = YangParser.parse(resource);

			if (stmtRaw.keyword != "module" && stmtRaw.keyword != "submodule")
				throw('$infile does not define module/submodule');
			if (ctx.modules[stmtRaw.arg] != null)
				throw('${stmtRaw.keyword} ${stmtRaw.arg} in $infile conflict with ${ctx.files[stmtRaw.arg]}');
			ctx.files[stmtRaw.arg] = infile;

			var stmt = Stmt.buildStmt(stmtRaw, ctx);
			ctx.modules[stmt.arg] = stmt;
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

			var stmt = YinParser.parse(Xml.parse(resource), ctx);

			if (stmt.keyword != "module" && stmt.keyword != "submodule")
				throw('$infile does not define module/submodule');
			if (ctx.modules[stmt.arg] != null)
				throw('${stmt.keyword} ${stmt.arg} in $infile conflict with ${ctx.files[stmt.arg]}');

			ctx.modules[stmt.arg] = stmt;
			ctx.files[stmt.arg] = infile;
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
					if (Path.extension(path) == "yang")
						parseYangFile(path);
				} else {
					if (Path.extension(path) == "yin")
						parseYinFile(path);
				}
			}
		} catch (e:String) {
			trace(path + " " + e);
		}
	}
}
