import AstVisitor;

class AstReduceGroupingRecursionVisitor extends AstVisitor {  
    public var group:List<Stmt>;
    
    public function new() {
        super();
        group = new List();
    }      
    
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        var subList = new List();
        for (s in stmt.subList) {
            switch s.type {
                case 'uses_stmt': {
                    var visitor = new AstReduceGroupingRecursionVisitor();
                    visitor.visit(s.ref);
                    for (e in visitor.group) {
                        for (ss in s.subList) {  //add uses substmts to all group substmts
                            e.addSub(ss);        //check refine_stmt and uses_augment_stmt in next loop
                        }
                        subList.push(e);
                    }
                }
                default: subList.push(s);
            }
        }
        stmt.subList = subList;
    }   
}