package stmt;

using Lambda;

typedef StmtRevision = {
	var name:String;
	@:optional var revision:String;
}

typedef Loc = {
	var offset:Int;
	var line:Int;
	var column:Int;
}

typedef Location = {
	var start:Loc;
	var end:Loc;
}

typedef StmtRaw = {
	var type:String;
	var keyword:String;
	var arg:String;
	var subs:Array<StmtRaw>;
	var location:Location;
}

enum StmtStatus {
	Current;
	Prune;
	Deprecated;
	Obsolete;
}

@:forward(length)
abstract NodeListAccess(List<Stmt>) from List<Stmt> to List<Stmt> {
	@:op(a.b)
	public function resolve(type:String):NodeListAccess {
		if (!Stmt.validType(type))
			throw('invalid stmt type ${type}');
		return this.filter(function(e) {
			return e.type == type;
		});
	}

	@:arrayAccess
	public inline function get(arg:String):Null<Stmt> {
		return this.find(function(e) {
			return e.arg == arg;
		});
	}
}

private abstract NodeAccess(List<Stmt>) from List<Stmt> {
	@:op(a.b)
	public function resolve(type:String):Null<Stmt> {
		if (!Stmt.validType(type))
			throw('invalid stmt type ${type}');
		return this.find(function(e) {
			return e.type == type;
		});
	}
}

abstract NodeId(String) from String to String {
	public var prefix(get, never):String;
	public var id(get, never):String;

	function get_prefix() {
		var idx = this.indexOf(':');
		return (idx == -1) ? null : this.substring(0, idx);
	}

	function get_id() {
		var idx = this.indexOf(':');
		return (idx == -1) ? this : this.substring(idx + 1);
	}
}

abstract SchemaNodeId(String) from String to String {
	public var absolute(get, never):Bool;
	public var path(get, never):Array<NodeId>;

	function get_absolute() {
		return (this.charAt(0) == '/') ? true : false;
	}

	function get_path() {
		var relative = absolute ? this.substring(1) : this;
		return relative.split('/');
	}
}

class Stmt {
	var raw:StmtRaw;

	public var type(get, never):String;

	function get_type() {
		return raw.type;
	}

	public var keyword(get, never):String;

	function get_keyword() {
		return raw.keyword;
	}

	public var arg(get, never):String;

	function get_arg() {
		return raw.arg;
	}

	public var location(get, never):Location;

	function get_location() {
		return raw.location;
	}

	public var parent:Stmt;

	public var status:StmtStatus;
	public var ctx:Context;

	static var validTypes:Array<String> = [
		"anyxml_stmt", "argument_stmt", "augment_stmt", 
		"base_stmt", "belongs_to_stmt", "bit_stmt", 
		"case_stmt", "choice_stmt", "config_stmt", "contact_stmt","container_stmt", 
		"default_stmt", "description_stmt", "deviation_stmt", "deviate_stmt", 
		"enum_stmt", "error_app_tag_stmt", "error_message_stmt", "extension_stmt", 
		"feature_stmt", "fraction_digits_stmt", 
		"grouping_stmt", "identity_stmt", 
		"if_feature_stmt", "import_stmt", "include_stmt", "input_stmt", 
		"key_stmt", 
		"leaf_stmt", "leaf_list_stmt", "length_stmt", "list_stmt", 
		"mandatory_stmt", "max_elements_stmt", "min_elements_stmt", "module_stmt", "must_stmt", 
		"namespace_stmt", "notification_stmt", 
		"ordered_by_stmt", "organization_stmt", "output_stmt", 
		"path_stmt", "pattern_stmt", "position_stmt", "prefix_stmt", "presence_stmt", 
		"range_stmt", "reference_stmt", "refine_stmt", "require_instance_stmt", "revision_stmt", "revision_date_stmt", "rpc_stmt", 
		"status_stmt", "submodule_stmt", 
		"type_stmt", "typedef_stmt", 
		"unique_stmt", "units_stmt", "uses_stmt", "unknown_stmt",
		"value_stmt", 
		"when_stmt", 
		"yang_version_stmt", "yin_element_stmt"
	];
	
	public var top(get, never):Stmt;

	function get_top() {
		var p = this;
		while (p.parent != null) {
			p = p.parent;
		}
		return p;
	}

	public var config(get, never):Bool;

	function get_config() {
		var p = this;
		while (p != null) {
			var config_stmt = p.sub.config_stmt;
			if (config_stmt != null)
				return (config_stmt.arg == 'true') ? true : false;
			p = p.parent;
		}
		return true;
	}

	public var file(get, never):String;

	function get_file()
		return ctx.files[top.arg];

	public function getMo(type:String):Null<Stmt>
		return ctx.modules[type];

	private var subStmts:List<Stmt>;
	public var subs(get, never):NodeListAccess;

	function get_subs()
		return subStmts;

	public var sub(get, never):NodeAccess;

	function get_sub()
		return subStmts;

	public function getSubs(type:String = null):List<Stmt> {
		return (type == null) ? subStmts : subStmts.filter(function(ch) {
			return ch.type == type;
		});
	}

	public function addSub(sub:Stmt) {
		sub.parent = this;
		subStmts.add(sub);
	}

	public function removeSub(sub:Stmt) {
		sub.parent = null;
		subStmts.remove(sub);
	}
	
	public function isValid() {
		return (status == Current || status == Deprecated) ? true : false;
	}

	public function new() {
		raw = null;
		ctx = null;
		parent = null;
		subStmts = new List();
		status = Current;
	}

	static public function buildStmt(raw:StmtRaw, ctx:Context):Stmt {
		var stmt:Stmt = switch raw.type {
			case "anyxml_stmt": new AnyxmlStmt(); 
			case "argument_stmt": new ArgumentStmt();
			case "augment_stmt": new AugmentStmt();
			case "base_stmt": new BaseStmt(); 
			case "belongs_to_stmt": new BelongsToStmt();
			case "bit_stmt": new BitStmt();
			case "case_stmt": new CaseStmt();
			case "choice_stmt": new ChoiceStmt(); 
			case "config_stmt": new ConfigStmt();
			case "contact_stmt": new ContactStmt();
			case "container_stmt": new ContainerStmt();
			case "default_stmt": new DefaultStmt();
			case "description_stmt": new DescriptionStmt();
			case "deviation_stmt": new DeviationStmt();
			case "deviate_stmt": new DeviateStmt(); 
			case "enum_stmt": new EnumStmt();
			case "error_app_tag_stmt": new ErrorAppTagStmt();
			case "error_message_stmt": new ErrorMessageStmt();
			case "extension_stmt": new ExtensionStmt();
			case "feature_stmt": new FeatureStmt();
			case "fraction_digits_stmt": new FractionDigitsStmt();
			case "grouping_stmt": new GroupingStmt(); 
			case "identity_stmt": new IdentityStmt();
			case "if_feature_stmt": new IfFeatureStmt();
			case "import_stmt": new ImportStmt(); 
			case "include_stmt": new IncludeStmt();
			case "input_stmt": new InputStmt();
			case "key_stmt": new KeyStmt();
			case "leaf_stmt": new LeafStmt();
			case "leaf_list_stmt": new LeafListStmt();
			case "length_stmt": new LengthStmt();
			case "list_stmt": new ListStmt();
			case "mandatory_stmt": new MandatoryStmt(); 
			case "max_elements_stmt": new MaxElementsStmt();
			case "min_elements_stmt": new MinElementsStmt(); 
			case "module_stmt": new ModuleStmt();
			case "must_stmt": new MustStmt(); 
			case "namespace_stmt": new NamespaceStmt();
			case "notification_stmt": new NotificationStmt();
			case "ordered_by_stmt": new OrderedByStmt();
			case "organization_stmt": new OrganizationStmt();
			case "output_stmt": new OutputStmt(); 
			case "path_stmt": new PathStmt();
			case "pattern_stmt": new PatternStmt(); 
			case "position_stmt": new PositionStmt();
			case "prefix_stmt": new PrefixStmt();
			case "presence_stmt": new PresenceStmt();
			case "range_stmt": new RangeStmt();
			case "reference_stmt": new ReferenceStmt();
			case "refine_stmt": new RefineStmt(); 
			case "require_instance_stmt": new RequireInstanceStmt(); 
			case "revision_stmt": new RevisionStmt();
			case "revision_date_stmt": new RevisionDateStmt();
			case "rpc_stmt": new RpcStmt();
			case "status_stmt": new StatusStmt();
			case "submodule_stmt": new SubmoduleStmt();
			case "type_stmt": new TypeStmt();
			case "typedef_stmt": new TypedefStmt();
			case "unique_stmt": new UniqueStmt(); 
			case "units_stmt": new UnitsStmt();
			case "uses_stmt": new UsesStmt();
			case "unknown_stmt": new UnknownStmt();
			case "value_stmt": new ValueStmt();
			case "when_stmt": new WhenStmt();
			case "yang_version_stmt": new YangVersionStmt();
			case "yin_element_stmt": new YinElementStmt();
			default: {
				trace('unsupport stmt type $raw.type'); new Stmt();
			}
		}
		stmt.raw = raw;
		stmt.ctx = ctx;
		ctx.stmts.add(stmt);
		for (s in raw.subs) {
			var child = buildStmt(s, ctx);
			stmt.addSub(child);
		}
		return stmt;
	}

	static public function validType(t:String) {
		return validTypes.has(t);
	}

	public function toString() {
		return 'type ${type} keyword ${keyword} arg ${arg} location ${location} file ${file}';
	}
}
