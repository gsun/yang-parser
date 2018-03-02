import AstVisitor;

class AstGrammerVisitor extends AstVisitor {
    
    public function anyxml_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function argument_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function augment_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function base_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function belongs_to_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function bit_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function case_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function choice_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function config_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function contact_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function container_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function default_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function description_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function enum_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function error_app_tag_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function error_message_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function extension_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function deviation_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function deviate_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function feature_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function fraction_digits_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function identity_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function if_feature_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function import_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.prefix_stmt.length != 1) trace('prefix_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function include_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function input_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function key_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function leaf_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function leaf_list_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function length_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function list_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function mandatory_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function max_elements_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function min_elements_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.namespace_stmt.length != 1) trace('namespace_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.prefix_stmt.length != 1) trace('prefix_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function must_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function namespace_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function notification_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function ordered_by_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function organization_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function output_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function path_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function pattern_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function position_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function prefix_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function presence_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function range_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function reference_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function refine_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function require_instance_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function revision_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function revision_date_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function status_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.belongs_to_stmt.length != 1) trace('belongs_to_stmt error ${stmt.arg} location ${stmt.location}');
    }   
    
    public function type_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function typedef_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function unique_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function units_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function uses_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function value_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function when_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function yang_version_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function yin_element_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function unknown_stmt(stmt:Stmt, context:Dynamic) {
    
    }
}