import AstVisitor;
using Lambda;
using StringTools;

typedef ValueRange = {
    var min:String;
    var max:String;
}

class AstDefaultValidateVisitor extends AstVisitor {

    function type_stmt(stmt:Stmt, context:Dynamic) {
        var default_stmt = stmt.parent.sub.default_stmt;
        if (default_stmt != null) {
            switch stmt.arg {
                case "int8"|"int16"|"uint8"|"uint16":
                    validateIntRange(stmt, default_stmt.arg);
                case "int32"|"uint32"|"int64"|"uint64":
                    validateBigIntRange(stmt, default_stmt.arg);
                case "decimal64":
                    validateDecimalRange(stmt, default_stmt.arg);
                case "string":
                case "boolean":
                    assertTrue(default_stmt.arg == "true" || default_stmt.arg == "false", 'default_stmt ${default_stmt.arg} boolean-error');
                case "enumeration":
                    validateEnum(stmt, default_stmt.arg);
                case "bits":
                    validatebit(stmt, default_stmt.arg);
                case "binary":
                case "leafref":
                case "identityref":
                case "instance-identifier":
                case "empty":
                case "union":
            }
        }
    }
    
    function validateIntRange(stmt:Stmt, value:String) {       
        var intValue = Std.parseInt(value);
        assertTrue(intValue != null, 'type_stmt ${stmt.arg} default-parse-error');
        var defautRange:ValueRange = switch stmt.arg {
            case "int8":  {min:"-128", max:"127"};
            case "int16": {min:"-32768", max:"32767"};
            case "uint8": {min:"0", max:"255"};
            case "uint16":{min:"0", max:"65535"};
            default:      {min:"min", max:"max"};
        }
        assertTrue(defautRange.min == "min" || intValue >= Std.parseInt(defautRange.min), 'type_stmt ${stmt.arg} default-min-range-error');
        assertTrue(defautRange.min == "max" || intValue <= Std.parseInt(defautRange.max), 'type_stmt ${stmt.arg} default-max-range-error');
        
        var rangeArray:Array<ValueRange> = buildRanges(stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseInt(e.min) <= intValue) && (e.max == "max" || Std.parseInt(e.max) >= intValue); });
            assertTrue(e != null, 'type_stmt ${stmt.arg} range-error');
        }
    }

    function validateBigIntRange(stmt:Stmt, value:String) {
        var intValue = Std.parseFloat(value);
        assertTrue(intValue != null, 'type_stmt ${stmt.arg} default-parse-error');
        var defautRange:ValueRange = switch stmt.arg {
            case "int32": {min:"-2147483648", max:"2147483647"};
            case "uint32":{min:"0", max:"4294967295"};
            case "int64": {min:"-9223372036854775808", max:"9223372036854775807"};
            case "uint64":{min:"0", max:"18446744073709551615"};
            default:      {min:"min", max:"max"};
        }
        
        assertTrue(defautRange.min == "min" || intValue >= Std.parseFloat(defautRange.min), 'type_stmt ${stmt.arg} default-min-range-error');
        assertTrue(defautRange.min == "max" || intValue <= Std.parseFloat(defautRange.max), 'type_stmt ${stmt.arg} default-max-range-error');
        
        var rangeArray:Array<ValueRange> = buildRanges(stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseFloat(e.min) <= intValue) && (e.max == "max" || Std.parseFloat(e.max) >= intValue); });
            assertTrue(e != null, 'type_stmt ${stmt.arg} range-error');
        }
    }

    function validateDecimalRange(stmt:Stmt, value:String) {
        var intValue = Std.parseFloat(value);
        assertTrue(intValue != null, 'type_stmt ${stmt.arg} default-parse-error');
        var fraction_digits_stmt = stmt.sub.fraction_digits_stmt;
        assertTrue(fraction_digits_stmt != null, 'type_stmt ${stmt.arg} no-fraction-digits-error');

        if (fraction_digits_stmt != null) {
            var fraction_digits = Std.parseInt(fraction_digits_stmt.arg);
            assertTrue(fraction_digits >= 1 && fraction_digits <= 18, 'type_stmt ${stmt.arg} fraction-digits-range-error');
            
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
            assertTrue(defautRange.min == "min" || intValue >= Std.parseFloat(defautRange.min), 'type_stmt ${stmt.arg} default-min-range-error');
            assertTrue(defautRange.min == "max" || intValue <= Std.parseFloat(defautRange.max), 'type_stmt ${stmt.arg} default-max-range-error');
        }
        
        var rangeArray:Array<ValueRange> = buildRanges(stmt);
        if (rangeArray.length > 0) {
            var e = rangeArray.find(function(e) { return (e.min == "min" || Std.parseFloat(e.min) <= intValue) && (e.max == "max" || Std.parseFloat(e.max) >= intValue); });
            assertTrue(e != null, 'type_stmt ${stmt.arg} fraction-digits-range-error');
        }
    }
    
    function buildRanges(stmt:Stmt) {
        var rangeArray:Array<ValueRange> = [];
        var range_stmt = stmt.sub.range_stmt;
        if (range_stmt != null) {
            var ranges = range_stmt.arg.split("|");
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
        assertTrue(e != null, 'type_stmt ${stmt.arg} enum-default-error');
    }
    
    function validatebit(stmt:Stmt, value:String) {
        var valueList = value.split(" ");
        var bit_stmts:List<Stmt> = stmt.subs.bit_stmt;
        for (v in valueList) {
            var e = bit_stmts.find(function(e) { return e.arg == v; });
            assertTrue(e != null, 'type_stmt ${stmt.arg} bit-default-error');
        }
    }
}