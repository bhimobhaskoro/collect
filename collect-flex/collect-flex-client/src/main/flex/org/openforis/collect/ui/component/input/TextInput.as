package org.openforis.collect.ui.component.input {
	import flash.events.TextEvent;
	
	import mx.controls.TextInput;
	
	import org.openforis.collect.util.StringUtil;
	
	/***
	 * @author Stefano Ricci
	 * */
	[Style(name="remarksIconVisible",type="Boolean",defaultValue="false")]
	[Style(name="approvedIconVisible",type="Boolean",defaultValue="false")]
	public class TextInput extends mx.controls.TextInput {
		
		private var _restrictPattern:String;
		
		public function TextInput() {
			super();
			minWidth = 0;
			addEventListener(TextEvent.TEXT_INPUT, textInputHandler);
		}
		
		public function selectAll():void {
			if(!StringUtil.isBlank(this.text)){
				this.setSelection(0, this.text.length);
			}
		}
		
		protected function textInputHandler(event:TextEvent):void {
			if(_restrictPattern != null) {
				var begin:String = text.substr(0, selectionBeginIndex);
				var end:String = text.substr(selectionEndIndex);
				var inserted:String = event.text;
				var newText:String = begin + inserted + end;
				var regExp:RegExp = new RegExp(_restrictPattern);
				var valid:Boolean = regExp.test(newText);
				if(! valid) {
					event.preventDefault();
				}
			}
		}
		
		public function get restrictPattern():String {
			return _restrictPattern;
		}

		public function set restrictPattern(value:String):void {
			_restrictPattern = value;
		}
		
		
		
	}
}