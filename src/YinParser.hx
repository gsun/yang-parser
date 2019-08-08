import stmt.Stmt;

class YinParser {
    public static function parse(e:Xml, ctx:Context) :Stmt {
        var fast = new haxe.xml.Access(e);
        if (fast.hasNode.module) {
            var raw = { 
                        type:'module_stmt',
                        keyword:'module',
                        arg:fast.node.module.att.name,
                        location:null,
                        subs:[],
                      };
            var stmt = Stmt.buildStmt(raw,ctx);
            parseSubs(fast.node.module.x, stmt);
            return stmt;
        } else if (fast.hasNode.submodule) {
            var raw = { 
                        type:'submodule_stmt',
                        keyword:'submodule',
                        arg:fast.node.module.att.name,
                        location:null,
                        subs:[],
                      };
            var stmt = Stmt.buildStmt(raw,ctx);
            parseSubs(fast.node.submodule.x, stmt);
            return stmt;
        } else {
            throw("fail to find top stmt");
        }
    }
    public static function parseSubs(e:Xml, parent:Stmt) {      
    
        for (ii in e.elements()) {
            var yield = false;
            trace(ii);
            var raw = { 
                        type:'',
                        keyword:ii.nodeName,
                        arg:'',
                        location:null,
                        subs:[],
                      };
            switch (raw.keyword) {
             case "action":
                 raw.type = "action_stmt"; 
                 raw.arg = ii.get("name");
             case "anydata":
                 raw.type = "anydata_stmt"; 
                 raw.arg = ii.get("name");
             case "anyxml":
                 raw.type = "anyxml_stmt"; 
                 raw.arg = ii.get("name");
             case "argument":
                 raw.type = "argument_stmt";
                 raw.arg = ii.get("name");
             case "augment":
                 raw.type = parent.type == "uses_stmt"?"uses_augment_stmt":"augment_stmt";  
                 raw.arg = ii.get("target-node");   
             case "base":
                 raw.type = "base_stmt";
                 raw.arg = ii.get("name");
             case "belongs-to":
                 raw.type = "belongs_to_stmt";
                 raw.arg = ii.get("module");
             case "bit":
                 raw.type = "bit_stmt";
                 raw.arg = ii.get("name");
             case "case":
                 raw.type = "case_stmt";   
                 raw.arg = ii.get("name");
             case "choice":
                 raw.type = "choice_stmt";
                 raw.arg = ii.get("name");
             case "config":
                 raw.type = "config_stmt";    
                 raw.arg = ii.get("value");
             case "contact":
                 raw.type = "contact_stmt";
                 var fast = new haxe.xml.Access(ii);  
                 raw.arg = fast.node.text.innerData;  
                 yield = true;               
             case "container":
                 raw.type = "container_stmt";  
                 raw.arg = ii.get("name"); 
             case "default":
                 raw.type = "default_stmt";
                 raw.arg = ii.get("value");
             case "description":
                 raw.type = "description_stmt";   
                 var fast = new haxe.xml.Access(ii);  
                 raw.arg = fast.node.text.innerData;   
                 yield = true;               
             case "deviate":
                 raw.type = "deviate_stmt";  
                 raw.arg = ii.get("value");
             case "deviation":
                 raw.type = "deviation_stmt";
                 raw.arg = ii.get("target-node");
             case "enum":
                 raw.type = "enum_stmt";
                 raw.arg = ii.get("name");
             case "error-app-tag":
                 raw.type = "error_app_tag_stmt";  
                 raw.arg = ii.get("value");
             case "error-message":
                 raw.type = "error_message_stmt";
                 var fast = new haxe.xml.Access(ii);  
                 raw.arg = fast.node.value.innerData;  
                 yield = true;
             case "extension":
                 raw.type = "extension_stmt";  
                 raw.arg = ii.get("name");
             case "feature":
                 raw.type = "feature_stmt";
                 raw.arg = ii.get("name");
             case "fraction-digits":
                 raw.type = "fraction_digits_stmt";  
                 raw.arg = ii.get("value");
             case "grouping":
                 raw.type = "grouping_stmt";
                 raw.arg = ii.get("name");
             case "identity":
                 raw.type = "identity_stmt";
                 raw.arg = ii.get("name");
             case "if-feature":
                 raw.type = "if_feature_stmt";  
                 raw.arg = ii.get("name");
             case "import":
                 raw.type = "import_stmt";
                 raw.arg = ii.get("module");
             case "include":
                 raw.type = "include_stmt";
                 raw.arg = ii.get("module");
             case "input":
                 raw.type = "input_stmt";
             case "key":
                 raw.type = "key_stmt"; 
                 raw.arg = ii.get("value");
             case "leaf":
                 raw.type = "leaf_stmt";
                 raw.arg = ii.get("name");
             case "leaf-list":
                 raw.type = "leaf_list_stmt";   
                 raw.arg = ii.get("name");
             case "length":
                 raw.type = "length_stmt";
                 raw.arg = ii.get("value");
             case "list":
                 raw.type = "list_stmt";
                 raw.arg = ii.get("name");
             case "mandatory":
                 raw.type = "mandatory_stmt";  
                 raw.arg = ii.get("value");
             case "max-elements":
                 raw.type = "max_elements_stmt";
                 raw.arg = ii.get("value");
             case "min-elements":
                 raw.type = "min_elements_stmt"; 
                 raw.arg = ii.get("value");
             case "modifier":
                 raw.type = "modifier_stmt"; 
                 raw.arg = ii.get("value");
             case "module":
                 raw.type = "module_stmt";
                 raw.arg = ii.get("name");
             case "must":
                 raw.type = "must_stmt";  
                 raw.arg = ii.get("condition");
             case "namespace":
                 raw.type = "namespace_stmt";
                 raw.arg = ii.get("uri");
             case "notification":
                 raw.type = "notification_stmt";  
                 raw.arg = ii.get("name");
             case "ordered-by":
                 raw.type = "ordered_by_stmt";
                 raw.arg = ii.get("value");
             case "organization":
                 raw.type = "organization_stmt";  
                 var fast = new haxe.xml.Access(ii);  
                 raw.arg = fast.node.text.innerData;   
                 yield = true;               
             case "output":
                 raw.type = "output_stmt";
             case "path":
                 raw.type = "path_stmt";  
                 raw.arg = ii.get("value");
             case "pattern":
                 raw.type = "pattern_stmt";
                 raw.arg = ii.get("value");
             case "position":
                 raw.type = "position_stmt";  
                 raw.arg = ii.get("value");
             case "prefix":
                 raw.type = "prefix_stmt";
                 raw.arg = ii.get("value");
             case "presence":
                 raw.type = "presence_stmt";  
                 raw.arg = ii.get("value");
             case "range":
                 raw.type = "range_stmt";
                 raw.arg = ii.get("value");
             case "reference":
                 raw.type = "reference_stmt";   
                 var fast = new haxe.xml.Access(ii);  
                 raw.arg = fast.node.text.innerData;   
                 yield = true;               
             case "refine":
                 raw.type = "refine_stmt";
                 raw.arg = ii.get("target-node");
             case "require-instance":
                 raw.type = "require_instance_stmt"; 
                 raw.arg = ii.get("value");
             case "revision":
                 raw.type = "revision_stmt";
                 raw.arg = ii.get("date");
             case "revision-date":
                 raw.type = "revision_dat_stmt"; 
                 raw.arg = ii.get("date");
             case "rpc":
                 raw.type = "rpc_stmt";
                 raw.arg = ii.get("name");
             case "status":
                 raw.type = "status_stmt";  
                 raw.arg = ii.get("value");
             case "submodule":
                 raw.type = "submodule_stmt";
                 raw.arg = ii.get("name");
             case "type":
                 raw.type = "type_stmt";  
                 raw.arg = ii.get("name");
             case "typedef":
                 raw.type = "typedef_stmt";
                 raw.arg = ii.get("name");
             case "unique":
                 raw.type = "unique_stmt"; 
                 raw.arg = ii.get("tag");
             case "units":
                 raw.type = "units_stmt";
                 raw.arg = ii.get("name");
             case "uses":
                 raw.type = "uses_stmt";  
                 raw.arg = ii.get("name");
             case "value":
                 raw.type = "value_stmt";
                 raw.arg = ii.get("value");
             case "when":
                 raw.type = "when_stmt";  
                 raw.arg = ii.get("condition");
             case "yang-version":
                 raw.type = "yang_version_stmt";
                 raw.arg = ii.get("value");
             case "yin-element":
                 raw.type = "yin_element_stmt";
                 raw.arg = ii.get("value");
             default:
                 raw.type = "unknown_stmt";
                 for (att in ii.attributes()) {
                     raw.arg = ii.get(att);
                     break;
                 }
            }
            var stmt = Stmt.buildStmt(raw, parent.ctx);
            parent.addSub(stmt);
            
            if (yield) continue;

            parseSubs(ii, stmt);
        }   
        
    }
    
}