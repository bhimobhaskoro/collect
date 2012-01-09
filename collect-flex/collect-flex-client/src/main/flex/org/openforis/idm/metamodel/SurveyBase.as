/**
 * Generated by Gas3 v2.2.0 (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (Survey.as).
 */

package org.openforis.idm.metamodel {

    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    import flash.utils.IExternalizable;
    import mx.collections.ListCollectionView;

    [Bindable]
    public class SurveyBase implements IExternalizable {

        private var _codeLists:ListCollectionView;
        private var _configurationElement:Object;
        private var _cycle:Number;
        private var _descriptions:ListCollectionView;
        private var _id:Number;
        private var _modelVersions:ListCollectionView;
        private var _name:String;
        private var _projectNames:ListCollectionView;
        private var _schema:Schema;
        private var _spatialReferenceSystems:ListCollectionView;
        private var _units:ListCollectionView;

        [Bindable(event="unused")]
        public function get codeLists():ListCollectionView {
            return _codeLists;
        }

        [Bindable(event="unused")]
        public function get configurationElement():Object {
            return _configurationElement;
        }

        [Bindable(event="unused")]
        public function get cycle():Number {
            return _cycle;
        }

        [Bindable(event="unused")]
        public function get descriptions():ListCollectionView {
            return _descriptions;
        }

        public function set id(value:Number):void {
            _id = value;
        }
        public function get id():Number {
            return _id;
        }

        [Bindable(event="unused")]
        public function get name():String {
            return _name;
        }

        [Bindable(event="unused")]
        public function get projectNames():ListCollectionView {
            return _projectNames;
        }

        [Bindable(event="unused")]
        public function get schema():Schema {
            return _schema;
        }

        [Bindable(event="unused")]
        public function get spatialReferenceSystems():ListCollectionView {
            return _spatialReferenceSystems;
        }

        [Bindable(event="unused")]
        public function get units():ListCollectionView {
            return _units;
        }

        public function readExternal(input:IDataInput):void {
            _codeLists = input.readObject() as ListCollectionView;
            _configurationElement = input.readObject() as Object;
            _cycle = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
            _descriptions = input.readObject() as ListCollectionView;
            _id = function(o:*):Number { return (o is Number ? o as Number : Number.NaN) } (input.readObject());
            _modelVersions = input.readObject() as ListCollectionView;
            _name = input.readObject() as String;
            _projectNames = input.readObject() as ListCollectionView;
            _schema = input.readObject() as Schema;
            _spatialReferenceSystems = input.readObject() as ListCollectionView;
            _units = input.readObject() as ListCollectionView;
        }

        public function writeExternal(output:IDataOutput):void {
            output.writeObject(_codeLists);
            output.writeObject(_configurationElement);
            output.writeObject(_cycle);
            output.writeObject(_descriptions);
            output.writeObject(_id);
            output.writeObject(_modelVersions);
            output.writeObject(_name);
            output.writeObject(_projectNames);
            output.writeObject(_schema);
            output.writeObject(_spatialReferenceSystems);
            output.writeObject(_units);
        }
    }
}