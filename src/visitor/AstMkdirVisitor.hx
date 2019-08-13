package visitor;

import stmt.Stmt;
import stmt.UsesStmt;
import stmt.IncludeStmt;
using Lambda;

class AstMkdirVisitor extends AstVisitor {

    public function choice_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir(stmt.arg, stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function case_stmt(stmt:Stmt, context:Dynamic) {
        stmt.ctx.mkDir(stmt.arg, stmt);
    } 
    
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir(stmt.arg, stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function input_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir("input", stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function output_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir("output", stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function container_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir(stmt.arg, stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function leaf_stmt(stmt:Stmt, context:Dynamic) {
        stmt.ctx.mkDir(stmt.arg, stmt);
    }   
    
    public function leaf_list_stmt(stmt:Stmt, context:Dynamic) {
        stmt.ctx.mkDir(stmt.arg, stmt);
    }   
    
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir(stmt.arg, stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function anyxml_stmt(stmt:Stmt, context:Dynamic) {
        stmt.ctx.mkDir(stmt.arg, stmt);
    }   
        
    public function uses_stmt(stmt:UsesStmt, context:Dynamic) {
        var visitor = new AstMkdirVisitor();
        visitor.visit(stmt.grouping);
        yield();
    }   

    public function module_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir(stmt.arg, stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
    
    public function include_stmt(stmt:IncludeStmt, context:Dynamic) {
        var visitor = new AstMkdirVisitor();
        visitor.visit(stmt.subModule);
        yield();
    }   
    
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.ctx.pwd() == stmt.ctx.root) return;

        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        yield();
    }   

    public function notification_stmt(stmt:Stmt, context:Dynamic) {
        var de = stmt.ctx.mkDir(stmt.arg, stmt);
        stmt.ctx.cdDir(de);
        for (s in stmt.getSubs()) {
            var visitor = new AstMkdirVisitor();
            visitor.visit(s);
        }
        stmt.ctx.cdDir(de.parent);
        yield();
    }   
}