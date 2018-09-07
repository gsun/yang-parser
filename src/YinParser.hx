import Stmt;

class YinParser {
	public static function parse(e:Xml, path:String) :Stmt {
		var fast = new haxe.xml.Fast(e);
		if (fast.hasNode.module) {
	        var stmt = new Stmt();
	        stmt.keyword = 'module';
			stmt.type = 'module_stmt';
			stmt.arg = fast.node.module.att.name;
			stmt.path = path;
			parseSubs(fast.node.module.x, stmt);
			return stmt;
		} else if (fast.hasNode.submodule) {
	        var stmt = new Stmt();
	        stmt.keyword = 'submodule';
			stmt.type = 'submodule_stmt';
			stmt.arg = fast.node.submodule.att.name;
			stmt.path = path;
			parseSubs(fast.node.submodule.x, stmt);
			return stmt;
		} else {
			throw("fail to find top stmt");
		}
	}
	public static function parseSubs(e:Xml, parent:Stmt) {     	
	
		for (ii in e.elements()) {
			trace(ii);
			var stmt = new Stmt();
			stmt.parent = parent;
			stmt.keyword = ii.nodeName;
			stmt.path = parent.path;
			
			switch (stmt.keyword) {
			 case "action":
				 stmt.type = "action_stmt"; 
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "anydata":
				 stmt.type = "anydata_stmt"; 
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "anyxml":
				 stmt.type = "anyxml_stmt"; 
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "argument":
				 stmt.type = "argument_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "augment":
				 stmt.type = parent.type == "uses_stmt"?"uses_augment_stmt":"augment_stmt";  
				 stmt.arg = ii.get("target-node");
				 parent.subs.push(stmt);			 
			 case "base":
				 stmt.type = "base_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "belongs-to":
				 stmt.type = "belongs_to_stmt";
				 stmt.arg = ii.get("module");
				 parent.subs.push(stmt);			 
			 case "bit":
				 stmt.type = "bit_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "case":
				 stmt.type = "case_stmt";   
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "choice":
				 stmt.type = "choice_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "config":
				 stmt.type = "config_stmt";    
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "contact":
				 stmt.type = "contact_stmt";
				 var fast = new haxe.xml.Fast(ii);	
				 stmt.arg = fast.node.text.innerData;	
				 parent.subs.push(stmt);
				 continue;
			 case "container":
				 stmt.type = "container_stmt";  
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "default":
				 stmt.type = "default_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "description":
				 stmt.type = "description_stmt";   
				 var fast = new haxe.xml.Fast(ii);	
				 stmt.arg = fast.node.text.innerData;	
				 parent.subs.push(stmt);
                 continue;				 
			 case "deviate":
				 stmt.type = "deviate_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt); 	
			 case "deviation":
				 stmt.type = "deviation_stmt";
				 stmt.arg = ii.get("target-node");
				 parent.subs.push(stmt);		 
			 case "enum":
				 stmt.type = "enum_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "error-app-tag":
				 stmt.type = "error_app_tag_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "error-message":
				 stmt.type = "error_message_stmt";
				 var fast = new haxe.xml.Fast(ii);	
				 stmt.arg = fast.node.value.innerData;	
				 parent.subs.push(stmt);
				 continue;
			 case "extension":
				 stmt.type = "extension_stmt";  
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);		       
			 case "feature":
				 stmt.type = "feature_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "fraction-digits":
				 stmt.type = "fraction_digits_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "grouping":
				 stmt.type = "grouping_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "identity":
				 stmt.type = "identity_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "if-feature":
				 stmt.type = "if_feature_stmt";  
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "import":
				 stmt.type = "import_stmt";
				 stmt.arg = ii.get("module");
				 parent.subs.push(stmt);
			 case "include":
				 stmt.type = "include_stmt";
				 stmt.arg = ii.get("module");
				 parent.subs.push(stmt);			 
			 case "input":
				 stmt.type = "input_stmt";
				 parent.subs.push(stmt);
			 case "key":
				 stmt.type = "key_stmt"; 
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "leaf":
				 stmt.type = "leaf_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "leaf-list":
				 stmt.type = "leaf_list_stmt";   
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "length":
				 stmt.type = "length_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "list":
				 stmt.type = "list_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "mandatory":
				 stmt.type = "mandatory_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "max-elements":
				 stmt.type = "max_elements_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "min-elements":
				 stmt.type = "min_elements_stmt"; 
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "modifier":
				 stmt.type = "modifier_stmt"; 
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "module":
				 stmt.type = "module_stmt";
				 stmt.arg = ii.get("name");
			 case "must":
				 stmt.type = "must_stmt";  
				 stmt.arg = ii.get("condition");
				 parent.subs.push(stmt);			 
			 case "namespace":
				 stmt.type = "namespace_stmt";
				 stmt.arg = ii.get("uri");
				 parent.subs.push(stmt);
			 case "notification":
				 stmt.type = "notification_stmt";  
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "ordered-by":
				 stmt.type = "ordered_by_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "organization":
				 stmt.type = "organization_stmt";  
				 var fast = new haxe.xml.Fast(ii);	
				 stmt.arg = fast.node.text.innerData;	
				 parent.subs.push(stmt);	
                 continue;				 
			 case "output":
				 stmt.type = "output_stmt";
				 parent.subs.push(stmt);
			 case "path":
				 stmt.type = "path_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "pattern":
				 stmt.type = "pattern_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "position":
				 stmt.type = "position_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "prefix":
				 stmt.type = "prefix_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "presence":
				 stmt.type = "presence_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "range":
				 stmt.type = "range_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "reference":
				 stmt.type = "reference_stmt";   
				 var fast = new haxe.xml.Fast(ii);	
				 stmt.arg = fast.node.text.innerData;	
				 parent.subs.push(stmt);	
                 continue;				 
			 case "refine":
				 stmt.type = "refine_stmt";
				 stmt.arg = ii.get("target-node");
				 parent.subs.push(stmt);
			 case "require-instance":
				 stmt.type = "require_instance_stmt"; 
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "revision":
				 stmt.type = "revision_stmt";
				 stmt.arg = ii.get("date");
				 parent.subs.push(stmt);
			 case "revision-date":
				 stmt.type = "revision_dat_stmt"; 
				 stmt.arg = ii.get("date");
				 parent.subs.push(stmt);			 
			 case "rpc":
				 stmt.type = "rpc_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "status":
				 stmt.type = "status_stmt";  
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);			 
			 case "submodule":
				 stmt.type = "submodule_stmt";
				 stmt.arg = ii.get("name");
			 case "type":
				 stmt.type = "type_stmt";  
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "typedef":
				 stmt.type = "typedef_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);	
			 case "unique":
				 stmt.type = "unique_stmt"; 
				 stmt.arg = ii.get("tag");
				 parent.subs.push(stmt);			 
			 case "units":
				 stmt.type = "units_stmt";
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);
			 case "uses":
				 stmt.type = "uses_stmt";  
				 stmt.arg = ii.get("name");
				 parent.subs.push(stmt);			 
			 case "value":
				 stmt.type = "value_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "when":
				 stmt.type = "when_stmt";  
				 stmt.arg = ii.get("condition");
				 parent.subs.push(stmt);			 
			 case "yang-version":
				 stmt.type = "yang_version_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 case "yin-element":
				 stmt.type = "yin_element_stmt";
				 stmt.arg = ii.get("value");
				 parent.subs.push(stmt);
			 default:
				 stmt.type = "unknown_stmt";
				 for (att in ii.attributes()) {
					 stmt.arg = ii.get(att);
					 break;
				 }
				 parent.subs.push(stmt);
			}

			parseSubs(ii, stmt);
		
	    }	
		
    }
	
}