import AstVisitor;
using Lambda;

class AstGrammerVisitor extends AstVisitor {
    
    public function anyxml_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt number error', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error' , stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
    }
    
    public function argument_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.yin_element_stmt.length <= 1, 'yin_element_stmt error ', stmt);
    }
    
    public function augment_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
    }
    
    public function base_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function belongs_to_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function bit_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.position_stmt.length <= 1, 'position_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }   
    
    public function case_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
    }   
    
    public function choice_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
    }   
    
    public function config_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function contact_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function container_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.presence_stmt.length <= 1, 'presence_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
        
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
    
    public function default_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function description_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function enum_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.value_stmt.length <= 1, 'value_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }

    public function error_app_tag_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function error_message_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function extension_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.argument_stmt.length <= 1, 'argument_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
    }
    
    public function deviation_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.deviate_stmt.length < 1, 'deviate_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }   
    
    public function deviate_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.type_stmt.length <= 1, 'type_stmt error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt error ', stmt);
    }
    
    public function feature_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
    }
    
    public function fraction_digits_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }

    public function identity_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
    }
    
    public function if_feature_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function import_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.prefix_stmt.length == 1, 'prefix_stmt error ', stmt);
        assertTrue(stmt.revision_date_stmt.length <= 1, 'revision_date_stmt error ', stmt);
    }
    
    public function include_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.revision_date_stmt.length <= 1, 'revision_date_stmt error ', stmt);

    }   
    
    public function input_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
    
    public function key_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function leaf_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.type_stmt.length == 1, 'type_stmt error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'units_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt error ', stmt);
    }
    
    public function leaf_list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.type_stmt.length == 1, 'type_stmt error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'units_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.ordered_by_stmt.length <= 1, 'ordered_by_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt error ', stmt);
    }

    public function length_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }
    
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.key_stmt.length <= 1, 'key_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.ordered_by_stmt.length <= 1, 'ordered_by_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt error ', stmt);
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
    
    public function mandatory_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function max_elements_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function min_elements_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.yang_version_stmt.length <= 1, 'yang_version_stmt error ', stmt);
        assertTrue(stmt.namespace_stmt.length == 1, 'namespace_stmt error ', stmt);
        assertTrue(stmt.prefix_stmt.length == 1, 'prefix_stmt error ', stmt);
        assertTrue(stmt.organization_stmt.length <= 1, 'organization_stmt error ', stmt);
        assertTrue(stmt.contact_stmt.length <= 1, 'contact_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.feature_stmt, stmt.feature_stmt, stmt);
        nameConflict(stmt.identity_stmt, stmt.identity_stmt, stmt);
        nameConflict(stmt.extension_stmt, stmt.extension_stmt, stmt);
    }
    
    public function must_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }
    
    public function namespace_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function notification_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }
    
    public function ordered_by_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function organization_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function output_stmt(stmt:Stmt, context:Dynamic) {
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }   
    
    public function path_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function pattern_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }
    
    public function position_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function prefix_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function presence_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function range_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }
    
    public function reference_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function refine_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.presence_stmt.length <= 1, 'presence_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
    }   
    
    public function require_instance_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function revision_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
    }   
    
    public function revision_date_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.input_stmt.length <= 1, 'input_stmt error ', stmt);
        assertTrue(stmt.output_stmt.length <= 1, 'output_stmt error ', stmt);

        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.top.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.top.grouping_stmt, stmt.grouping_stmt, stmt);
    }   
    
    public function status_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.yang_version_stmt.length <= 1, 'yang_version_stmt error ', stmt);
        assertTrue(stmt.belongs_to_stmt.length == 1, 'belongs_to_stmt error ', stmt);
        assertTrue(stmt.organization_stmt.length <= 1, 'organization_stmt error ', stmt);
        assertTrue(stmt.contact_stmt.length <= 1, 'contact_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        
        nameConflict(stmt.typedef_stmt, stmt.typedef_stmt, stmt);
        nameConflict(stmt.grouping_stmt, stmt.grouping_stmt, stmt);
        nameConflict(stmt.feature_stmt, stmt.feature_stmt, stmt);
        nameConflict(stmt.identity_stmt, stmt.identity_stmt, stmt);
        nameConflict(stmt.extension_stmt, stmt.extension_stmt, stmt);
    }   
    
    public function type_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.fraction_digits_stmt.length <= 1, 'fraction_digits_stmt error ', stmt);
        assertTrue(stmt.range_stmt.length <= 1, 'range_stmt error ', stmt);
        assertTrue(stmt.length_stmt.length <= 1, 'length_stmt error ', stmt);
        assertTrue(stmt.path_stmt.length <= 1, 'path_stmt error ', stmt);
        assertTrue(stmt.require_instance_stmt.length <= 1, 'require_instance_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
    }
    
    public function typedef_stmt(stmt:Stmt, context:Dynamic) {
        var base_types = ["int8", "int16", "int32", "int64", "uint8", 
                          "uint16", "uint32", "uint64", "decimal64",
                          "string", "boolean", "enumeration", "bits", "binary", 
                          "leafref", "identityref", "instance-identifier",
                          "empty", "union"];
        for (t in base_types) {
            assertTrue(stmt.arg != t, 'typedef_stmt error ', stmt);
        }
        assertTrue(stmt.type_stmt.length == 1, 'type_stmt error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'units_stmt error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);

    }   
    
    public function unique_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function units_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function uses_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
    }
    
    public function value_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function when_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt error ', stmt);
    }
    
    public function yang_version_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function yin_element_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function unknown_stmt(stmt:Stmt, context:Dynamic) {
    
    }
    
    public function nameConflict(a:Array<Stmt>, b:Array<Stmt>, stmt:Stmt) {
        for (t in a) {
            var count = b.count(function(x) { return ((t != x) && (t.arg == x.arg));});
            assertTrue((count == 0), '${t.type} error: name overlap ', stmt);
        }
    }
}