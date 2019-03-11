import AstVisitor;
using Lambda;

class AstStmtCountVisitor extends AstVisitor {
    
    public function anyxml_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("mandatory_stmt").length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
    }
    
    public function argument_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("yin_element_stmt").length <= 1, 'yin_element_stmt count-error');
    }
    
    public function augment_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
    } 
    
    public function bit_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("position_stmt").length <= 1, 'position_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }   
    
    public function case_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
    }   
    
    public function choice_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("default_stmt").length <= 1, 'default_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("mandatory_stmt").length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
    }    
    
    public function container_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("presence_stmt").length <= 1, 'presence_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
    }
    
    public function enum_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("value_stmt").length <= 1, 'value_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }
    
    public function extension_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("argument_stmt").length <= 1, 'argument_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
    }
    
    public function deviation_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("deviate_stmt").length < 1, 'deviate_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }   
    
    public function deviate_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("type_stmt").length <= 1, 'type_stmt count-error');
        assertTrue(stmt.findSubs("units_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("default_stmt").length <= 1, 'default_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
        assertTrue(stmt.findSubs("mandatory_stmt").length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.findSubs("max_elements_stmt").length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.findSubs("min_elements_stmt").length <= 1, 'min_elements_stmt count-error');
    }
    
    public function feature_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
    }
    
    
    public function grouping_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
    }

    public function identity_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
    }
        
    public function import_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("prefix_stmt").length == 1, 'prefix_stmt error');
        assertTrue(stmt.findSubs("revision_date_stmt").length <= 1, 'revision_date_stmt count-error');
    }
    
    public function include_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("revision_date_stmt").length <= 1, 'revision_date_stmt count-error');
    }   
    
    public function leaf_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("type_stmt").length == 1, 'type_stmt count-error');
        assertTrue(stmt.findSubs("units_stmt").length <= 1, 'units_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
        assertTrue(stmt.findSubs("default_stmt").length <= 1, 'default_stmt count-error');
    }
    
    public function leaf_list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("type_stmt").length == 1, 'type_stmt count-error');
        assertTrue(stmt.findSubs("units_stmt").length <= 1, 'units_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("ordered_by_stmt").length <= 1, 'ordered_by_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
        assertTrue(stmt.findSubs("max_elements_stmt").length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.findSubs("min_elements_stmt").length <= 1, 'min_elements_stmt count-error');
    }

    public function length_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("error_message_stmt").length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.findSubs("error_app_tag_stmt").length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }
    
    public function list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("key_stmt").length <= 1, 'key_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("ordered_by_stmt").length <= 1, 'ordered_by_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
        assertTrue(stmt.findSubs("max_elements_stmt").length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.findSubs("min_elements_stmt").length <= 1, 'min_elements_stmt count-error');
    }
    
    public function module_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("yang_version_stmt").length <= 1, 'yang_version_stmt count-error');
        assertTrue(stmt.findSubs("namespace_stmt").length == 1, 'namespace_stmt count-error');
        assertTrue(stmt.findSubs("prefix_stmt").length == 1, 'prefix_stmt count-error');
        assertTrue(stmt.findSubs("organization_stmt").length <= 1, 'organization_stmt count-error');
        assertTrue(stmt.findSubs("contact_stmt").length <= 1, 'contact_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
    }
    
    public function must_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("error_message_stmt").length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.findSubs("error_app_tag_stmt").length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }
        
    public function pattern_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("error_message_stmt").length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.findSubs("error_app_tag_stmt").length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }
    
    public function range_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("error_message_stmt").length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.findSubs("error_app_tag_stmt").length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }
    
    public function refine_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("presence_stmt").length <= 1, 'presence_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("default_stmt").length <= 1, 'default_stmt count-error');
        assertTrue(stmt.findSubs("config_stmt").length <= 1, 'config_stmt count-error');
        assertTrue(stmt.findSubs("mandatory_stmt").length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.findSubs("max_elements_stmt").length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.findSubs("min_elements_stmt").length <= 1, 'min_elements_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
    }   
    
    public function revision_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
    }   
    
    public function rpc_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("input_stmt").length <= 1, 'input_stmt count-error');
        assertTrue(stmt.findSubs("output_stmt").length <= 1, 'output_stmt count-error');
    }   
        
    public function submodule_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("yang_version_stmt").length <= 1, 'yang_version_stmt count-error');
        assertTrue(stmt.findSubs("belongs_to_stmt").length == 1, 'belongs_to_stmt count-error');
        assertTrue(stmt.findSubs("organization_stmt").length <= 1, 'organization_stmt count-error');
        assertTrue(stmt.findSubs("contact_stmt").length <= 1, 'contact_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
    }   
    
    public function type_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("fraction_digits_stmt").length <= 1, 'fraction_digits_stmt count-error');
        assertTrue(stmt.findSubs("range_stmt").length <= 1, 'range_stmt count-error');
        assertTrue(stmt.findSubs("length_stmt").length <= 1, 'length_stmt count-error');
        assertTrue(stmt.findSubs("path_stmt").length <= 1, 'path_stmt count-error');
        assertTrue(stmt.findSubs("require_instance_stmt").length <= 1, 'require_instance_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
    }
    
    public function typedef_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("type_stmt").length == 1, 'type_stmt count-error');
        assertTrue(stmt.findSubs("units_stmt").length <= 1, 'units_stmt count-error');
        assertTrue(stmt.findSubs("default_stmt").length <= 1, 'default_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');

    }    
    
    public function uses_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("when_stmt").length <= 1, 'when_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
        assertTrue(stmt.findSubs("status_stmt").length <= 1, 'status_stmt count-error');
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
    }
        
    public function when_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.findSubs("reference_stmt").length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.findSubs("description_stmt").length <= 1, 'description_stmt count-error');
    }
    
}