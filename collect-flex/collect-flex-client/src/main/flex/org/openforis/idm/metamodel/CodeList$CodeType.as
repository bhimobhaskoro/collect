/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR.
 */

package org.openforis.idm.metamodel {

    import org.granite.util.Enum;

    [Bindable]
    [RemoteClass(alias="org.openforis.idm.metamodel.CodeList$CodeType")]
    public class CodeList$CodeType extends Enum {

        public static const NUMERIC:CodeList$CodeType = new CodeList$CodeType("NUMERIC", _);
        public static const ALPHANUMERIC:CodeList$CodeType = new CodeList$CodeType("ALPHANUMERIC", _);

        function CodeList$CodeType(value:String = null, restrictor:* = null) {
            super((value || NUMERIC.name), restrictor);
        }

        override protected function getConstants():Array {
            return constants;
        }

        public static function get constants():Array {
            return [NUMERIC, ALPHANUMERIC];
        }

        public static function valueOf(name:String):CodeList$CodeType {
            return CodeList$CodeType(NUMERIC.constantOf(name));
        }
    }
}