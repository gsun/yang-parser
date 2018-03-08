import AstVisitor;

class AstGrammerVisitor extends AstVisitor {
    
    public function anyxml_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.mandatory_stmt.length > 1) trace('mandatory_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function argument_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.yin_element_stmt.length > 1) trace('yin_element_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function augment_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function base_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function belongs_to_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function bit_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.position_stmt.length > 1) trace('position_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function case_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function choice_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.default_stmt.length > 1) trace('default_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.mandatory_stmt.length > 1) trace('mandatory_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function config_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function contact_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function container_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.presence_stmt.length > 1) trace('presence_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function default_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function description_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function enum_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.value_stmt.length > 1) trace('value_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }

    public function error_app_tag_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function error_message_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function extension_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.argument_stmt.length > 1) trace('argument_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function deviation_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.deviate_stmt.length < 1) trace('deviate_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function deviate_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.type_stmt.length > 1) trace('type_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.units_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.default_stmt.length > 1) trace('default_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.mandatory_stmt.length > 1) trace('mandatory_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.max_elements_stmt.length > 1) trace('max_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.min_elements_stmt.length > 1) trace('min_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function feature_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function fraction_digits_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }

    public function identity_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function if_feature_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function import_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.prefix_stmt.length != 1) trace('prefix_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.revision_date_stmt.length > 1) trace('revision_date_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function include_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.revision_date_stmt.length > 1) trace('revision_date_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');

    }   
    
    public function input_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function key_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function leaf_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.type_stmt.length != 1) trace('type_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.units_stmt.length > 1) trace('units_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.default_stmt.length > 1) trace('default_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function leaf_list_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.type_stmt.length != 1) trace('type_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.units_stmt.length > 1) trace('units_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.ordered_by_stmt.length > 1) trace('ordered_by_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.max_elements_stmt.length > 1) trace('max_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.min_elements_stmt.length > 1) trace('min_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }

    public function length_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.error_message_stmt.length > 1) trace('error_message_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.error_app_tag_stmt.length > 1) trace('error_app_tag_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.key_stmt.length > 1) trace('key_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.ordered_by_stmt.length > 1) trace('ordered_by_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.max_elements_stmt.length > 1) trace('max_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.min_elements_stmt.length > 1) trace('min_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function mandatory_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function max_elements_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function min_elements_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.yang_version_stmt.length > 1) trace('yang_version_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.namespace_stmt.length != 1) trace('namespace_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.prefix_stmt.length != 1) trace('prefix_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.organization_stmt.length > 1) trace('organization_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.contact_stmt.length > 1) trace('contact_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function must_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.error_message_stmt.length > 1) trace('error_message_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.error_app_tag_stmt.length > 1) trace('error_app_tag_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
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
        if (stmt.error_message_stmt.length > 1) trace('error_message_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.error_app_tag_stmt.length > 1) trace('error_app_tag_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function position_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function prefix_stmt(stmt:Stmt, context:Dynamic) {

    }

    public function presence_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function range_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.error_message_stmt.length > 1) trace('error_message_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.error_app_tag_stmt.length > 1) trace('error_app_tag_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function reference_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function refine_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.presence_stmt.length > 1) trace('presence_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.default_stmt.length > 1) trace('default_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.config_stmt.length > 1) trace('config_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.mandatory_stmt.length > 1) trace('mandatory_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.max_elements_stmt.length > 1) trace('max_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.min_elements_stmt.length > 1) trace('min_elements_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function require_instance_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function revision_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function revision_date_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.input_stmt.length > 1) trace('input_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.output_stmt.length > 1) trace('output_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function status_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.yang_version_stmt.length > 1) trace('yang_version_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.belongs_to_stmt.length != 1) trace('belongs_to_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.organization_stmt.length > 1) trace('organization_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.contact_stmt.length > 1) trace('contact_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }   
    
    public function type_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.fraction_digits_stmt.length > 1) trace('fraction_digits_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.range_stmt.length > 1) trace('range_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.length_stmt.length > 1) trace('length_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.path_stmt.length > 1) trace('path_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.require_instance_stmt.length > 1) trace('require_instance_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function typedef_stmt(stmt:Stmt, context:Dynamic) {
        var base_types = ["int8", "int16", "int32", "int64", "uint8", 
                          "uint16", "uint32", "uint64", "decimal64",
                          "string", "boolean", "enumeration", "bits", "binary", 
                          "leafref", "identityref", "instance-identifier",
                          "empty", "union"];
        for (t in base_types) {
            if (stmt.arg == t) trace('typedef_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        }
        if (stmt.type_stmt.length != 1) trace('type_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.units_stmt.length > 1) trace('units_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.default_stmt.length > 1) trace('default_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');

    }   
    
    public function unique_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function units_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function uses_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.when_stmt.length > 1) trace('when_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.status_stmt.length > 1) trace('status_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function value_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function when_stmt(stmt:Stmt, context:Dynamic) {
        if (stmt.reference_stmt.length > 1) trace('reference_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
        if (stmt.description_stmt.length > 1) trace('description_stmt error in ${stmt.type} ${stmt.arg} location ${stmt.location}');
    }
    
    public function yang_version_stmt(stmt:Stmt, context:Dynamic) {

    }   
    
    public function yin_element_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function unknown_stmt(stmt:Stmt, context:Dynamic) {
    
    }
}