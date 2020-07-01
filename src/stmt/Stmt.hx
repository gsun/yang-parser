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

@:enum
abstract StmtType(String) from String to String {
	var STAnyxml = "anyxml_stmt"; 
	var STArgument = "argument_stmt";
	var STAugment = "augment_stmt"; 
	var STBase = "base_stmt"; 
	var STBelongsTo = "belongs_to_stmt"; 
	var STBit = "bit_stmt"; 
	var STCase = "case_stmt"; 
	var STChoice = "choice_stmt"; 
	var STConfig = "config_stmt"; 
	var STContact = "contact_stmt";
	var STContainer = "container_stmt"; 
	var STDefault = "default_stmt"; 
	var STDescription = "description_stmt"; 
	var STDeviation = "deviation_stmt"; 
	var STDeviate = "deviate_stmt"; 
	var STEnum = "enum_stmt"; 
	var STErrorAppTag = "error_app_tag_stmt"; 
	var STErrorMessage = "error_message_stmt"; 
	var STExtension = "extension_stmt"; 
	var STFeature = "feature_stmt"; 
	var STFractionDigits = "fraction_digits_stmt"; 
	var STGrouping = "grouping_stmt"; 
	var STIdentity = "identity_stmt"; 
	var STIfFeature = "if_feature_stmt"; 
	var STImport = "import_stmt"; 
	var STInclude = "include_stmt"; 
	var STInput = "input_stmt"; 
	var STKey = "key_stmt"; 
	var STLeaf = "leaf_stmt"; 
	var STLeafList = "leaf_list_stmt"; 
	var STLength = "length_stmt"; 
	var STList = "list_stmt"; 
	var STMandatory = "mandatory_stmt"; 
	var STMaxElements = "max_elements_stmt"; 
	var STMinElements = "min_elements_stmt"; 
	var STModule = "module_stmt"; 
	var STMust = "must_stmt"; 
	var STNamespace = "namespace_stmt"; 
	var STNotification = "notification_stmt"; 
	var STOrderedBy = "ordered_by_stmt"; 
	var STOrganization = "organization_stmt"; 
	var STOutput = "output_stmt"; 
	var STPath = "path_stmt"; 
	var STPattern = "pattern_stmt"; 
	var STPosition = "position_stmt"; 
	var STPrefix = "prefix_stmt"; 
	var STPresence = "presence_stmt"; 
	var STRange = "range_stmt"; 
	var STReference = "reference_stmt"; 
	var STRefine = "refine_stmt"; 
	var STRequireInstance = "require_instance_stmt"; 
	var STRevision = "revision_stmt"; 
	var STRevisionDate = "revision_date_stmt"; 
	var STRpc = "rpc_stmt"; 
	var STStatus = "status_stmt"; 
	var STSubmodule = "submodule_stmt"; 
	var STType = "type_stmt"; 
	var STTypedef = "typedef_stmt"; 
	var STUnique = "unique_stmt"; 
	var STUnits = "units_stmt"; 
	var STUses = "uses_stmt"; 
	var STUnknown = "unknown_stmt";
	var STValue = "value_stmt"; 
	var STWhen = "when_stmt"; 
	var STYangVersion = "yang_version_stmt"; 
	var STYinElement = "yin_element_stmt";
}

class Stmt {
	var raw:StmtRaw;

	public var type(get, never):StmtType;

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
		var type:StmtType = raw.type;
		var stmt:Stmt = switch raw.type {
			case STAnyxml: new AnyxmlStmt(); 
			case STArgument: new ArgumentStmt();
			case STAugment: new AugmentStmt();
			case STBase: new BaseStmt(); 
			case STBelongsTo: new BelongsToStmt();
			case STBit: new BitStmt();
			case STCase: new CaseStmt();
			case STChoice: new ChoiceStmt(); 
			case STConfig: new ConfigStmt();
			case STContact: new ContactStmt();
			case STContainer: new ContainerStmt();
			case STDefault: new DefaultStmt();
			case STDescription: new DescriptionStmt();
			case STDeviation: new DeviationStmt();
			case STDeviate: new DeviateStmt(); 
			case STEnum: new EnumStmt();
			case STErrorAppTag: new ErrorAppTagStmt();
			case STErrorMessage: new ErrorMessageStmt();
			case STExtension: new ExtensionStmt();
			case STFeature: new FeatureStmt();
			case STFractionDigits: new FractionDigitsStmt();
			case STGrouping: new GroupingStmt(); 
			case STIdentity: new IdentityStmt();
			case STIfFeature: new IfFeatureStmt();
			case STImport: new ImportStmt(); 
			case STInclude: new IncludeStmt();
			case STInput: new InputStmt();
			case STKey: new KeyStmt();
			case STLeaf: new LeafStmt();
			case STLeafList: new LeafListStmt();
			case STLength: new LengthStmt();
			case STList: new ListStmt();
			case STMandatory: new MandatoryStmt(); 
			case STMaxElements: new MaxElementsStmt();
			case STMinElements: new MinElementsStmt(); 
			case STModule: new ModuleStmt();
			case STMust: new MustStmt(); 
			case STNamespace: new NamespaceStmt();
			case STNotification: new NotificationStmt();
			case STOrderedBy: new OrderedByStmt();
			case STOrganization: new OrganizationStmt();
			case STOutput: new OutputStmt(); 
			case STPath: new PathStmt();
			case STPattern: new PatternStmt(); 
			case STPosition: new PositionStmt();
			case STPrefix: new PrefixStmt();
			case STPresence: new PresenceStmt();
			case STRange: new RangeStmt();
			case STReference: new ReferenceStmt();
			case STRefine: new RefineStmt(); 
			case STRequireInstance: new RequireInstanceStmt(); 
			case STRevision: new RevisionStmt();
			case STRevisionDate: new RevisionDateStmt();
			case STRpc: new RpcStmt();
			case STStatus: new StatusStmt();
			case STSubmodule: new SubmoduleStmt();
			case STType: new TypeStmt();
			case STTypedef: new TypedefStmt();
			case STUnique: new UniqueStmt(); 
			case STUnits: new UnitsStmt();
			case STUses: new UsesStmt();
			case STUnknown: new UnknownStmt();
			case STValue: new ValueStmt();
			case STWhen: new WhenStmt();
			case STYangVersion: new YangVersionStmt();
			case STYinElement: new YinElementStmt();
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

	public function toString() {
		return 'type ${type} keyword ${keyword} arg ${arg} location ${location} file ${file}';
	}
}
