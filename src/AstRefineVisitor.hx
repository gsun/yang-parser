import AstVisitor;
import Stmt.StmtStatus;
using Lambda;

class AstRefineVisitor extends AstVisitor {
    var stmt_refine_with_description = ['container_stmt', 'leaf_stmt', 'leaf_list_stmt', 'list_stmt', 'choice_stmt', 'case_stmt', 'anyxml_stmt', 'anydata_stmt'];
    var stmt_refine_with_reference = ['container_stmt', 'leaf_stmt', 'leaf-list_stmt', 'list_stmt', 'choice_stmt', 'case_stmt', 'anyxml_stmt', 'anydata_stmt'];
    var stmt_refine_with_config = ['container_stmt', 'leaf_stmt', 'leaf-list_stmt', 'list_stmt', 'choice_stmt', 'anyxml_stmt', 'anydata_stmt'];
    var stmt_refine_with_presence = ['container_stmt'];
    var stmt_refine_with_must = ['container_stmt', 'leaf_stmt', 'leaf_list_stmt', 'list_stmt', 'anyxml_stmt', 'anydata_stmt'];
    var stmt_refine_with_default = ['leaf_stmt', 'choice_stmt'];
    var stmt_refine_with_mandatory = ['leaf_stmt', 'choice_stmt', 'anyxml_stmt', 'anydata_stmt'];
    var stmt_refine_with_min_elements = ['leaf_list_stmt', 'list_stmt'];
    var stmt_refine_with_max_elements = ['leaf_list_stmt', 'list_stmt'];
    var stmt_refine_with_if_feature = ['container_stmt', 'leaf_stmt', 'leaf_list_stmt', 'list_stmt', 'choice_stmt', 'case_stmt', 'anyxml_stmt', 'anydata_stmt'];

    function refine_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.arg.indexOf('/') == -1) {
            stmt.ref = findRefinedStmt(stmt.parent.ref, stmt.arg);
        } else {
            var path = stmt.arg.split('/');
            stmt.ref = findRefinedStmt2(stmt.parent.ref, path);
        }
        assertTrue(stmt.ref != null, 'refine_stmt ${stmt.arg} target-ref-error');
        for (e in stmt.subList) {
            switch e.type {
                case 'description_stmt':  assertTrue(stmt_refine_with_description.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'reference_stmt':    assertTrue(stmt_refine_with_reference.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'config_stmt':       assertTrue(stmt_refine_with_config.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'presence_stmt':     assertTrue(stmt_refine_with_presence.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'must_stmt':         assertTrue(stmt_refine_with_must.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'default_stmt':      assertTrue(stmt_refine_with_default.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'mandatory_stmt':    assertTrue(stmt_refine_with_mandatory.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'min_elements_stmt': assertTrue(stmt_refine_with_min_elements.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'max_elements_stmt': assertTrue(stmt_refine_with_max_elements.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
                case 'if_feature_stmt':   assertTrue(stmt_refine_with_if_feature.has(stmt.ref.type), '${e.type} refine in ${stmt.ref.type} ${stmt.ref.arg} refine-error');
            }
        }
    }
    
    function findRefinedStmt(stmt:Stmt, arg:String):Null<Stmt> {
        var t = stmt.subList.find(function(ch) { return (ch.arg == arg); });
        if (t != null) return t;
        for (e in stmt.subs.uses_stmt.iterator()) {
            var t = findRefinedStmt(e.ref, arg);
            if (t != null) return t;
        }
        return null;
    }
    
    function findRefinedStmt2(stmt:Stmt, path:Array<String>):Null<Stmt> {
        if (path.length == 1) {
            return stmt.subList.find(function(ch) { return (ch.arg == path[0]); });
        }
        var e = stmt.subs.uses_stmt.find(function(ch) { return (ch.arg == path[0]); });
        if (e == null) return null;
        return findRefinedStmt2(e.ref, path.slice(1));
    }
}