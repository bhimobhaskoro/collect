/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (CodeListLabelImpl.as).
 */

package org.openforis.idm.metamodel.impl {

    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import org.granite.util.Enum;
    import org.openforis.idm.metamodel.CodeListLabel;
    import org.openforis.idm.metamodel.CodeListLabel$Type;

    [Bindable]
    public class CodeListLabelImplBase extends LanguageSpecificTextImpl implements CodeListLabel {

        private var _type:CodeListLabel$Type;

        [Bindable(event="unused")]
        public function get type():CodeListLabel$Type {
            return _type;
        }

        override public function readExternal(input:IDataInput):void {
            super.readExternal(input);
            _type = Enum.readEnum(input) as CodeListLabel$Type;
        }

        override public function writeExternal(output:IDataOutput):void {
            super.writeExternal(output);
            output.writeObject(_type);
        }
    }
}