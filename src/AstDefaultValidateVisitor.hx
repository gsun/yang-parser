import AstVisitor;
using Lambda;
using StringTools;

typedef ValueRange<T> = {
    var min:T;
    var max:T;
}

class AstDefaultValidateVisitor extends AstVisitor {

    function default_stmt(stmt:Stmt, context:Dynamic) {
        var type_stmt = stmt.parent.sub.type_stmt;
        if (type_stmt != null) {
            switch type_stmt.arg {
                case "int8"|"int16"|"uint8"|"uint16":
                    validateIntRange(type_stmt, stmt.arg);
                case "int32"|"uint32"|"int64"|"uint64":
                    validateBigIntRange(type_stmt, stmt.arg);
                case "decimal64":
                    validateDecimalRange(type_stmt, stmt.arg);
                case "string":
                case "boolean":
                    assertTrue(stmt.arg == "true" || stmt.arg == "false", 'default_stmt ${stmt.arg} boolean-error');
                case "enumeration":
                case "bits":
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
        var rangeArray:Array<ValueRange<Int>> = [];
        var defautRange:ValueRange<Int> = {min:0, max:0};
        switch stmt.arg {
            case "int8":
                defautRange = {min:-128, max:127};
            case "int16":
                defautRange = {min:-32768, max:32767};
            case "uint8": 
                defautRange = {min:0, max:255};
            case "uint16":
                defautRange = {min:0, max:65535};
        }
        var range_stmt = stmt.sub.range_stmt;
        if (range_stmt != null) {
            var ranges = range_stmt.arg.split("|");
            for (r in ranges) {
                var range = r.split("..");
                if (range.length == 2) {
                    var min = range[0].trim();
                    var max = range[1].trim();
                    var v1 = (min=="min" ? defautRange.min:Std.parseInt(min));
                    var v2 = (max=="max" ? defautRange.max:Std.parseInt(max));
                    assertTrue(v1 < v2, 'type_stmt ${stmt.arg} range-error');
                    rangeArray.push({min:v1, max:v2});
                } else {
                    var v1 = Std.parseInt(range[0].trim());
                    rangeArray.push({min:v1, max:v1});
                }
            }
        }
        var intValue = Std.parseInt(value);
        if (rangeArray.length >0 ) {
            var e = rangeArray.find(function(e) { return e.min <= intValue && e.max >= intValue; });
            assertTrue(e != null, 'type_stmt ${stmt.arg} range-error');
        } else {
            assertTrue(intValue >= defautRange.min && intValue <= defautRange.max, 'type_stmt ${stmt.arg} default-range-error');
        }
    }

    function validateBigIntRange(stmt:Stmt, value:String) {
        var rangeArray:Array<ValueRange<Float>> = [];
        var defautRange:ValueRange<Float>  = {min:0, max:0};
        switch stmt.arg {
            case "int32":
                defautRange = {min:-2147483648, max:2147483647};
            case "uint32": 
                defautRange = {min:0, max:4294967295};
            case "int64":
                defautRange = {min:-9223372036854775808, max:9223372036854775807};
            case "uint64": 
                defautRange = {min:0, max:18446744073709551615};
        }
        var range_stmt = stmt.sub.range_stmt;
        if (range_stmt != null) {
            var ranges = range_stmt.arg.split("|");
            for (r in ranges) {
                var range = r.split("..");
                if (range.length == 2) {
                    var min = range[0].trim();
                    var max = range[1].trim();
                    var v1 = (min=="min" ? defautRange.min:Std.parseFloat(min));
                    var v2 = (max=="max" ? defautRange.max:Std.parseFloat(max));
                    assertTrue(v1 < v2, 'type_stmt ${stmt.arg} range-error');
                    rangeArray.push({min:v1, max:v2});
                } else {
                    var v1 = Std.parseFloat(range[0].trim());
                    rangeArray.push({min:v1, max:v1});
                }
            }
        }
        var intValue = Std.parseFloat(value);
        if (rangeArray.length >0 ) {
            var e = rangeArray.find(function(e) { return e.min <= intValue && e.max >= intValue; });
            assertTrue(e != null, 'type_stmt ${stmt.arg} range-error');
        } else {
            assertTrue(intValue >= defautRange.min && intValue <= defautRange.max, 'type_stmt ${stmt.arg} default-range-error');
        }
    }

    function validateDecimalRange(stmt:Stmt, value:String) {
        var rangeArray:Array<ValueRange<Float>> = [];
        var fraction_digits_stmt = stmt.sub.fraction_digits_stmt;
        assertTrue(fraction_digits_stmt != null, 'type_stmt ${stmt.arg} no-fraction-digits-error');
        var defautRange:ValueRange<Float> = {min:0, max:0};
        if (fraction_digits_stmt != null) {
            var fraction_digits = Std.parseInt(fraction_digits_stmt.arg);
            assertTrue(fraction_digits >= 1 && fraction_digits <= 18, 'type_stmt ${stmt.arg} fraction-digits-range-error');
            switch (fraction_digits) {
                case 1:  defautRange = {min:-922337203685477580.8 , max:922337203685477580.7};
                case 2:  defautRange = {min:-92233720368547758.08 , max:92233720368547758.07};
                case 3:  defautRange = {min:-9223372036854775.808 , max:9223372036854775.807};
                case 4:  defautRange = {min:-922337203685477.5808 , max:922337203685477.5807};
                case 5:  defautRange = {min:-92233720368547.75808 , max:92233720368547.75807};
                case 6:  defautRange = {min:-9223372036854.775808 , max:9223372036854.775807};
                case 7:  defautRange = {min:-922337203685.4775808 , max:922337203685.4775807};
                case 8:  defautRange = {min:-92233720368.54775808 , max:92233720368.54775807};
                case 9:  defautRange = {min:-9223372036.854775808 , max:9223372036.854775807};
                case 10: defautRange = {min:-922337203.6854775808 , max:922337203.6854775807};
                case 11: defautRange = {min:-92233720.36854775808 , max:92233720.36854775807};
                case 12: defautRange = {min:-9223372.036854775808 , max:9223372.036854775807};
                case 13: defautRange = {min:-922337.2036854775808 , max:922337.2036854775807};
                case 14: defautRange = {min:-92233.72036854775808 , max:92233.72036854775807};
                case 15: defautRange = {min:-9223.372036854775808 , max:9223.372036854775807};
                case 16: defautRange = {min:-922.3372036854775808 , max:922.3372036854775807};
                case 17: defautRange = {min:-92.23372036854775808 , max:92.23372036854775807};
                case 18: defautRange = {min:-9.223372036854775808 , max:9.223372036854775807};
            }
        }
        var range_stmt = stmt.sub.range_stmt;
        if (range_stmt != null) {
            var ranges = range_stmt.arg.split("|");
            for (r in ranges) {
                var range = r.split("..");
                if (range.length == 2) {
                    var min = range[0].trim();
                    var max = range[1].trim();
                    var v1 = (min=="min" ? defautRange.min:Std.parseFloat(min));
                    var v2 = (max=="max" ? defautRange.max:Std.parseFloat(max));
                    assertTrue(v1 < v2, 'type_stmt ${stmt.arg} range-error');
                    rangeArray.push({min:v1, max:v2});
                } else {
                    var v1 = Std.parseFloat(range[0].trim());
                    rangeArray.push({min:v1, max:v1});
                }
            }
        }
        var intValue = Std.parseFloat(value);
        if (rangeArray.length >0 ) {
            var e = rangeArray.find(function(e) { return e.min <= intValue && e.max >= intValue; });
            assertTrue(e != null, 'type_stmt ${stmt.arg} fraction-digits-range-error');
        } else {
            assertTrue(intValue >= defautRange.min && intValue <= defautRange.max, 'type_stmt ${stmt.arg} default-range-error');
        }
    }
}