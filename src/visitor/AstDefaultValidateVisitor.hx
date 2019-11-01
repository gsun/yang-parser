package visitor;

import stmt.Stmt;
import stmt.TypeStmt;
using Lambda;
using StringTools;

typedef ValueRange = {
    var min:String;
    var max:String;
}


class AstDefaultValidateVisitor extends AstVisitor {
    public var validUnionBranch : Bool;
    public var isUnionBranch : Bool;
    public var default_stmt : Stmt;
    
    public function new() {
        super();
        validUnionBranch = true;
        isUnionBranch = false;
        default_stmt = null;
    }
    
    function type_stmt(stmt:TypeStmt) {
        var default_stmt = default_stmt!=null?default_stmt:stmt.parent.sub.default_stmt;
        if (default_stmt != null) {
            switch stmt.arg {
                case "int8"|"int16"|"uint8"|"uint16"|"int32"|"uint32": validateIntRange(stmt, default_stmt.arg);
                case "int64"|"uint64": validateInt64Range(stmt, default_stmt.arg);
                case "decimal64": validateDecimalRange(stmt, default_stmt.arg);
                case "string": validateString(stmt, default_stmt.arg);
                case "boolean": assertTrue(default_stmt.arg == "true" || default_stmt.arg == "false", 'default_stmt ${default_stmt.arg} boolean-error');
                case "enumeration": validateEnum(stmt, default_stmt.arg);
                case "bits": validatebit(stmt, default_stmt.arg);
                case "binary": validateBinary(stmt, default_stmt.arg);
                case "leafref": if (isUnionBranch) validUnionBranch = false;
                case "identityref": if (isUnionBranch) validUnionBranch = false;
                case "instance-identifier": if (isUnionBranch) validUnionBranch = false;
                case "empty": assertTrue(false, 'default_stmt ${default_stmt.arg} empty-error');
                case "union": validateUnion(stmt, default_stmt);
                default: validateUserType(stmt, default_stmt);
            }
            this.default_stmt = null; //reset default_stmt to avoid recheck in sub stmts.
        }
    }
    
    function mandatory_stmt(stmt:Stmt) {
        assertTrue(stmt.parent.sub.default_stmt == null, '${stmt.parent.type} ${stmt.parent.arg} mandatory-error');
    }
    
    function validateIntRange(stmt:Stmt, value:String) {       
        var intValue = Std.parseInt(value);
        assertTrue(intValue != null, 'value ${value} default-parse-error');
        if (intValue == null) return;
        var defautRange:ValueRange = switch stmt.arg {
            case "int8":  {min:"-128", max:"127"};
            case "int16": {min:"-32768", max:"32767"};
            case "uint8": {min:"0", max:"255"};
            case "uint16":{min:"0", max:"65535"};
            case "int32": {min:"-2147483648", max:"2147483647"};
            case "uint32":{min:"0", max:"4294967295"};
            default:      {min:"min", max:"max"};
        }
        assertTrue(defautRange.min == "min" || intValue >= Std.parseInt(defautRange.min), 'value ${value} default-min-range-error');
        assertTrue(defautRange.min == "max" || intValue <= Std.parseInt(defautRange.max), 'value ${value} default-max-range-error');
        
        var rangeArray:Array<ValueRange> = buildRanges(stmt.sub.range_stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseInt(e.min) <= intValue) && (e.max == "max" || Std.parseInt(e.max) >= intValue); });
            assertTrue(e != null, 'value ${value} range-error');
        }
    }

    function validateInt64Range(stmt:Stmt, value:String) {
        var intValue = Std.parseFloat(value);
        assertTrue(!Math.isNaN(intValue), 'type_stmt ${stmt.arg} value ${value} default-parse-error');
        if (Math.isNaN(intValue)) return;
        var defautRange:ValueRange = switch stmt.arg {
            case "int64": {min:"-9223372036854775808", max:"9223372036854775807"};
            case "uint64":{min:"0", max:"18446744073709551615"};
            default:      {min:"min", max:"max"};
        }
        
        assertTrue(defautRange.min == "min" || intValue >= Std.parseFloat(defautRange.min), 'value ${value} default-min-range-error');
        assertTrue(defautRange.min == "max" || intValue <= Std.parseFloat(defautRange.max), 'value ${value} default-max-range-error');
        
        var rangeArray:Array<ValueRange> = buildRanges(stmt.sub.range_stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseFloat(e.min) <= intValue) && (e.max == "max" || Std.parseFloat(e.max) >= intValue); });
            assertTrue(e != null, 'value ${value} range-error');
        }
    }

    function validateDecimalRange(stmt:Stmt, value:String) {
        var intValue = Std.parseFloat(value);
        assertTrue(!Math.isNaN(intValue), 'value ${value} default-parse-error');
        if (Math.isNaN(intValue)) return;
        var fraction_digits_stmt = stmt.sub.fraction_digits_stmt;
        assertTrue(fraction_digits_stmt != null, 'value ${value} no-fraction-digits-error');

        if (fraction_digits_stmt != null) {
            var fraction_digits = Std.parseInt(fraction_digits_stmt.arg);
            assertTrue(fraction_digits >= 1 && fraction_digits <= 18, 'value ${value} fraction-digits-range-error');
            
            var defautRange:ValueRange = switch fraction_digits {
                case 1:  {min:"-922337203685477580.8", max:"922337203685477580.7"};
                case 2:  {min:"-92233720368547758.08", max:"92233720368547758.07"};
                case 3:  {min:"-9223372036854775.808", max:"9223372036854775.807"};
                case 4:  {min:"-922337203685477.5808", max:"922337203685477.5807"};
                case 5:  {min:"-92233720368547.75808", max:"92233720368547.75807"};
                case 6:  {min:"-9223372036854.775808", max:"9223372036854.775807"};
                case 7:  {min:"-922337203685.4775808", max:"922337203685.4775807"};
                case 8:  {min:"-92233720368.54775808", max:"92233720368.54775807"};
                case 9:  {min:"-9223372036.854775808", max:"9223372036.854775807"};
                case 10: {min:"-922337203.6854775808", max:"922337203.6854775807"};
                case 11: {min:"-92233720.36854775808", max:"92233720.36854775807"};
                case 12: {min:"-9223372.036854775808", max:"9223372.036854775807"};
                case 13: {min:"-922337.2036854775808", max:"922337.2036854775807"};
                case 14: {min:"-92233.72036854775808", max:"92233.72036854775807"};
                case 15: {min:"-9223.372036854775808", max:"9223.372036854775807"};
                case 16: {min:"-922.3372036854775808", max:"922.3372036854775807"};
                case 17: {min:"-92.23372036854775808", max:"92.23372036854775807"};
                case 18: {min:"-9.223372036854775808", max:"9.223372036854775807"};
                default: {min:"min", max:"max"};
            }
            assertTrue(defautRange.min == "min" || intValue >= Std.parseFloat(defautRange.min), 'value ${value} default-min-range-error');
            assertTrue(defautRange.min == "max" || intValue <= Std.parseFloat(defautRange.max), 'value ${value} default-max-range-error');
        }
        
        var rangeArray:Array<ValueRange> = buildRanges(stmt.sub.range_stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseFloat(e.min) <= intValue) && (e.max == "max" || Std.parseFloat(e.max) >= intValue); });
            assertTrue(e != null, 'value ${value} fraction-digits-range-error');
        }
    }
    
    function buildRanges(stmt:Stmt) {
        var rangeArray:Array<ValueRange> = [];
        if (stmt != null) {
            var ranges = stmt.arg.split("|");
            for (r in ranges) {
                var range = r.split("..");
                if (range.length == 2) {
                    rangeArray.push({min:range[0].trim(), max:range[1].trim()});
                } else {
                    rangeArray.push({min:range[0].trim(), max:range[0].trim()});
                }
            }
        }
        return rangeArray.copy();
    }
    
    function validateEnum(stmt:Stmt, value:String) {
        var enum_stmts:List<Stmt> = stmt.subs.enum_stmt;
        var e = enum_stmts.find(function(e) { return e.arg == value; });
        assertTrue(e != null, 'enum-default-error');
    }
    
    function validatebit(stmt:Stmt, value:String) {
        var valueList = value.split(" ");
        var bit_stmts:List<Stmt> = stmt.subs.bit_stmt;
        for (v in valueList) {
            var e = bit_stmts.find(function(e) { return e.arg == v; });
            assertTrue(e != null, 'bit-default-error');
        }
    }
    
    function validateUnion(stmt:Stmt, default_stmt:Stmt) {
        var valid = false;
        for (u in stmt.subs.type_stmt.iterator()) {
            var visitor = new AstDefaultValidateVisitor();
            visitor.isUnionBranch = true;
            visitor.default_stmt = default_stmt;
            visitor.visit(u);
            if (visitor.validUnionBranch) {
                valid = true;
                break;
            }
        }
        assertTrue(valid, 'union-error');
    }
    
    function validateUserType(stmt:TypeStmt, default_stmt:Stmt) {
        var type_stmt = stmt.typedefine.sub.type_stmt;
        var visitor = new AstDefaultValidateVisitor();
        visitor.isUnionBranch = isUnionBranch;
        visitor.default_stmt = default_stmt;
        visitor.visit(type_stmt);
    }

    function validateString(stmt:Stmt, value:String) {
        var rangeArray:Array<ValueRange> = buildRanges(stmt.sub.length_stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseInt(e.min) <= value.length) && (e.max == "max" || Std.parseInt(e.max) >= value.length); });
            assertTrue(e != null, 'string-length-error');
        }
        var pattern_stmt = stmt.sub.pattern_stmt;
        if (pattern_stmt != null) {
            var pat = new js.RegExp(pattern_stmt.arg);
            assertTrue(pat.test(value), 'value ${value} pattern-error');
        }
    }

    function validateBinary(stmt:Stmt, value:String) {
        var rangeArray:Array<ValueRange> = buildRanges(stmt.sub.length_stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseInt(e.min) <= value.length) && (e.max == "max" || Std.parseInt(e.max) >= value.length); });
            assertTrue(e != null, 'binary-length-error');
        }
        try {
            haxe.crypto.Base64.decode(value);
        } catch (e:String) {
            assertTrue(false, 'binary-error');
        }
    }
    
    override function assertTrue(b:Bool, msg:String) {
        if (b != true) {
            if (isUnionBranch) {
                validUnionBranch = false;
            } else {
                trace('${msg} in ${stmt}');
            }
        }
    }
}