import AstVisitor;
using Lambda;

class AstStmtCountVisitor extends AstVisitor {
    
    public function anyxml_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error' , stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
    }
    
    public function argument_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.yin_element_stmt.length <= 1, 'yin_element_stmt count-error ', stmt);
    }
    
    public function augment_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
    } 
    
    public function bit_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.position_stmt.length <= 1, 'position_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }   
    
    public function case_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
    }   
    
    public function choice_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
    }    
    
    public function container_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.presence_stmt.length <= 1, 'presence_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
    }
    
    public function enum_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.value_stmt.length <= 1, 'value_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }
    
    public function extension_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.argument_stmt.length <= 1, 'argument_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
    }
    
    public function deviation_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.deviate_stmt.length < 1, 'deviate_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }   
    
    public function deviate_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.type_stmt.length <= 1, 'type_stmt count-error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt count-error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt count-error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt count-error ', stmt);
    }
    
    public function feature_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
    }
    
    
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
    }

    public function identity_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
    }
    
    public function if_feature_stmt(stmt:Stmt, context:Dynamic) {

    }
    
    public function import_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.prefix_stmt.length == 1, 'prefix_stmt error ', stmt);
        assertTrue(stmt.revision_date_stmt.length <= 1, 'revision_date_stmt count-error ', stmt);
    }
    
    public function include_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.revision_date_stmt.length <= 1, 'revision_date_stmt count-error ', stmt);

    }   
    
    public function leaf_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.type_stmt.length == 1, 'type_stmt count-error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'units_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt count-error ', stmt);
    }
    
    public function leaf_list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.type_stmt.length == 1, 'type_stmt count-error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'units_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.ordered_by_stmt.length <= 1, 'ordered_by_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt count-error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt count-error ', stmt);
    }

    public function length_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt count-error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }
    
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.key_stmt.length <= 1, 'key_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.ordered_by_stmt.length <= 1, 'ordered_by_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt count-error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt count-error ', stmt);
    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.yang_version_stmt.length <= 1, 'yang_version_stmt count-error ', stmt);
        assertTrue(stmt.namespace_stmt.length == 1, 'namespace_stmt count-error ', stmt);
        assertTrue(stmt.prefix_stmt.length == 1, 'prefix_stmt count-error ', stmt);
        assertTrue(stmt.organization_stmt.length <= 1, 'organization_stmt count-error ', stmt);
        assertTrue(stmt.contact_stmt.length <= 1, 'contact_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
    }
    
    public function must_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt count-error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }
        
    public function pattern_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt count-error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }
    
    public function range_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.error_message_stmt.length <= 1, 'error_message_stmt count-error ', stmt);
        assertTrue(stmt.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }
    
    public function refine_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.presence_stmt.length <= 1, 'presence_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt count-error ', stmt);
        assertTrue(stmt.config_stmt.length <= 1, 'config_stmt count-error ', stmt);
        assertTrue(stmt.mandatory_stmt.length <= 1, 'mandatory_stmt count-error ', stmt);
        assertTrue(stmt.max_elements_stmt.length <= 1, 'max_elements_stmt count-error ', stmt);
        assertTrue(stmt.min_elements_stmt.length <= 1, 'min_elements_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
    }   
    
    public function revision_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
    }   
    
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.input_stmt.length <= 1, 'input_stmt count-error ', stmt);
        assertTrue(stmt.output_stmt.length <= 1, 'output_stmt count-error ', stmt);
    }   
        
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.yang_version_stmt.length <= 1, 'yang_version_stmt count-error ', stmt);
        assertTrue(stmt.belongs_to_stmt.length == 1, 'belongs_to_stmt count-error ', stmt);
        assertTrue(stmt.organization_stmt.length <= 1, 'organization_stmt count-error ', stmt);
        assertTrue(stmt.contact_stmt.length <= 1, 'contact_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
    }   
    
    public function type_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.fraction_digits_stmt.length <= 1, 'fraction_digits_stmt count-error ', stmt);
        assertTrue(stmt.range_stmt.length <= 1, 'range_stmt count-error ', stmt);
        assertTrue(stmt.length_stmt.length <= 1, 'length_stmt count-error ', stmt);
        assertTrue(stmt.path_stmt.length <= 1, 'path_stmt count-error ', stmt);
        assertTrue(stmt.require_instance_stmt.length <= 1, 'require_instance_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
    }
    
    public function typedef_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.type_stmt.length == 1, 'type_stmt count-error ', stmt);
        assertTrue(stmt.units_stmt.length <= 1, 'units_stmt count-error ', stmt);
        assertTrue(stmt.default_stmt.length <= 1, 'default_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);

    }    
    
    public function uses_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.when_stmt.length <= 1, 'when_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
        assertTrue(stmt.status_stmt.length <= 1, 'status_stmt count-error ', stmt);
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
    }
        
    public function when_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.reference_stmt.length <= 1, 'reference_stmt count-error ', stmt);
        assertTrue(stmt.description_stmt.length <= 1, 'description_stmt count-error ', stmt);
    }
    
}