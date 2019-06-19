package visitor;

import stmt.Stmt;
using Lambda;

class AstStmtCountVisitor extends AstVisitor {
    
    function anyxml_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.mandatory_stmt.length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
    }
    
    function argument_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.yin_element_stmt.length <= 1, 'yin_element_stmt count-error');
    }
    
    function augment_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
    } 
    
    function bit_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.position_stmt.length <= 1, 'position_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }   
    
    function case_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
    }   
    
    function choice_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.default_stmt.length <= 1, 'default_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.mandatory_stmt.length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
    }    
    
    function container_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.presence_stmt.length <= 1, 'presence_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
    }
    
    function enum_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.value_stmt.length <= 1, 'value_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }
    
    function extension_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.argument_stmt.length <= 1, 'argument_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
    }
    
    function deviation_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.deviate_stmt.length < 1, 'deviate_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }   
    
    function deviate_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.type_stmt.length <= 1, 'type_stmt count-error');
        assertTrue(stmt.subs.units_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.default_stmt.length <= 1, 'default_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
        assertTrue(stmt.subs.mandatory_stmt.length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.subs.max_elements_stmt.length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.subs.min_elements_stmt.length <= 1, 'min_elements_stmt count-error');
    }
    
    function feature_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
    }
    
    
    function grouping_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
    }

    function identity_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
    }
        
    function import_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.prefix_stmt.length == 1, 'prefix_stmt error');
        assertTrue(stmt.subs.revision_date_stmt.length <= 1, 'revision_date_stmt count-error');
    }
    
    function include_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.revision_date_stmt.length <= 1, 'revision_date_stmt count-error');
    }   
    
    function leaf_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.type_stmt.length == 1, 'type_stmt count-error');
        assertTrue(stmt.subs.units_stmt.length <= 1, 'units_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
        assertTrue(stmt.subs.default_stmt.length <= 1, 'default_stmt count-error');
    }
    
    function leaf_list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.type_stmt.length == 1, 'type_stmt count-error');
        assertTrue(stmt.subs.units_stmt.length <= 1, 'units_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.ordered_by_stmt.length <= 1, 'ordered_by_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
        assertTrue(stmt.subs.max_elements_stmt.length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.subs.min_elements_stmt.length <= 1, 'min_elements_stmt count-error');
    }

    function length_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.error_message_stmt.length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.subs.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }
    
    function list_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.key_stmt.length <= 1, 'key_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.ordered_by_stmt.length <= 1, 'ordered_by_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
        assertTrue(stmt.subs.max_elements_stmt.length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.subs.min_elements_stmt.length <= 1, 'min_elements_stmt count-error');
    }
    
    function module_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.yang_version_stmt.length <= 1, 'yang_version_stmt count-error');
        assertEquals(stmt.subs.namespace_stmt.length, 1, 'namespace_stmt count-error');
        assertEquals(stmt.subs.prefix_stmt.length, 1, 'prefix_stmt count-error');
        assertTrue(stmt.subs.organization_stmt.length <= 1, 'organization_stmt count-error');
        assertTrue(stmt.subs.contact_stmt.length <= 1, 'contact_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
    }
    
    function must_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.error_message_stmt.length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.subs.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }
        
    function pattern_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.error_message_stmt.length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.subs.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }
    
    function range_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.error_message_stmt.length <= 1, 'error_message_stmt count-error');
        assertTrue(stmt.subs.error_app_tag_stmt.length <= 1, 'error_app_tag_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }
    
    function refine_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.presence_stmt.length <= 1, 'presence_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.default_stmt.length <= 1, 'default_stmt count-error');
        assertTrue(stmt.subs.config_stmt.length <= 1, 'config_stmt count-error');
        assertTrue(stmt.subs.mandatory_stmt.length <= 1, 'mandatory_stmt count-error');
        assertTrue(stmt.subs.max_elements_stmt.length <= 1, 'max_elements_stmt count-error');
        assertTrue(stmt.subs.min_elements_stmt.length <= 1, 'min_elements_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
    }   
    
    function revision_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
    }   
    
    function rpc_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.input_stmt.length <= 1, 'input_stmt count-error');
        assertTrue(stmt.subs.output_stmt.length <= 1, 'output_stmt count-error');
    }   
        
    function submodule_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.yang_version_stmt.length <= 1, 'yang_version_stmt count-error');
        assertTrue(stmt.subs.belongs_to_stmt.length == 1, 'belongs_to_stmt count-error');
        assertTrue(stmt.subs.organization_stmt.length <= 1, 'organization_stmt count-error');
        assertTrue(stmt.subs.contact_stmt.length <= 1, 'contact_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
    }   
    
    function type_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.fraction_digits_stmt.length <= 1, 'fraction_digits_stmt count-error');
        assertTrue(stmt.subs.range_stmt.length <= 1, 'range_stmt count-error');
        assertTrue(stmt.subs.length_stmt.length <= 1, 'length_stmt count-error');
        assertTrue(stmt.subs.path_stmt.length <= 1, 'path_stmt count-error');
        assertTrue(stmt.subs.require_instance_stmt.length <= 1, 'require_instance_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
    }
    
    function typedef_stmt(stmt:Stmt, context:Dynamic) {
        assertEquals(stmt.subs.type_stmt.length, 1, 'type_stmt count-error');
        assertTrue(stmt.subs.units_stmt.length <= 1, 'units_stmt count-error');
        assertTrue(stmt.subs.default_stmt.length <= 1, 'default_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');

    }    
    
    function uses_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.when_stmt.length <= 1, 'when_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
        assertTrue(stmt.subs.status_stmt.length <= 1, 'status_stmt count-error');
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
    }
        
    function when_stmt(stmt:Stmt, context:Dynamic) {
        assertTrue(stmt.subs.reference_stmt.length <= 1, 'reference_stmt count-error');
        assertTrue(stmt.subs.description_stmt.length <= 1, 'description_stmt count-error');
    }
    
}