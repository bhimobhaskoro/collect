package org.openforis.collect.util 
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;

	/**
	 * @author S. Ricci
	 */
	public class PopUpUtil {
		
		
		public static const POSITION_RIGHT:String = "right";
		public static const POSITION_ABOVE:String = "top";
		public static const POSITION_BELOW:String = "bottom";
		public static const POSITION_LEFT:String = "left";
		
		public static const POSITIONS:Array = [POSITION_RIGHT, POSITION_ABOVE, POSITION_BELOW, POSITION_LEFT];
		
		public static const VERTICAL_ALIGN_TOP:String = "top";
		public static const VERTICAL_ALIGN_BOTTOM:String = "bottom";
		public static const VERTICAL_ALIGN_MIDDLE:String = "middle";
		
		public static const HORIZONTAL_ALIGN_LEFT:String = "left";
		public static const HORIZONTAL_ALIGN_RIGHT:String = "right";
		public static const HORIZONTAL_ALIGN_CENTER:String = "center";
		
		
		public static function center(parent:DisplayObject, popup:UIComponent):void {
			var pt:Point = new Point(0, 0);
			pt = parent.localToGlobal(pt); // Convert refAnchor's local 0,0 into global coordinate
			//pt = popup.globalToLocal(pt); // Convert the result into local coordinate of myPop
			var popupX:Number = Math.round((parent.width - popup.width) / 2) + pt.x;
			var popupY:Number = Math.round((parent.height - popup.height) / 2) + pt.y;
			popup.move(popupX, popupY);
		}
		
		/**
		 * Try to position the popUp in the specified preferredPosition.
		 * If at the end the popUp will exceed the viewPort, than try to position the popUp in other possible positions,
		 * according to the order of POSITIONS array.
		 */
		public static function alignToField(popUp:DisplayObject, inputField:DisplayObject, 
				preferredPosition:String = "right", verticalAlign:String = "middle", horizontalAlign:String = "left",
				ensureVisibility:Boolean = true):String {
			var positions:ArrayCollection = new ArrayCollection(POSITIONS);
			CollectionUtil.moveItem(positions, preferredPosition, 0);
			
			for each (var pos:String in positions) {
				internalAlignToField(popUp, inputField, pos, verticalAlign, horizontalAlign, false);
				if(! exceedViewport(popUp)) {
					return pos;
				}
			}
			if(ensureVisibility) {
				PopUpUtil.ensureVisibility(popUp);
			}
			return pos;
		}
		
		protected static function internalAlignToField(popUp:DisplayObject, inputField:DisplayObject, 
				position:String = "right", verticalAlign:String = "middle", horizontalAlign:String = "left",
				ensureVisibility:Boolean = true):void {
			//auto positioning tooltip (first on right, then below, otherwiese on top) 
			var componentBounds:Rectangle = inputField.getBounds(inputField.stage);
			
			var x:Number, y:Number;
			switch(position) {
				case POSITION_RIGHT:
					x = componentBounds.x + inputField.width;
					switch(verticalAlign) {
						case VERTICAL_ALIGN_MIDDLE:
							y = componentBounds.y + (inputField.height - popUp.height) / 2;
							break;
						case VERTICAL_ALIGN_TOP:
							y = componentBounds.y + inputField.height - popUp.height;
							break;
						case VERTICAL_ALIGN_BOTTOM:
							y = componentBounds.y;
							break;
					}
					break;
				case POSITION_LEFT:
					x = componentBounds.x - popUp.width;
					switch(verticalAlign) {
						case VERTICAL_ALIGN_MIDDLE:
							y = componentBounds.y + (inputField.height - popUp.height) / 2;
							break;
						case VERTICAL_ALIGN_TOP:
							y = componentBounds.y + inputField.height - popUp.height;
							break;
						case VERTICAL_ALIGN_BOTTOM:
							y = componentBounds.y;
							break;
					}
					break;
				case POSITION_BELOW:
					switch(horizontalAlign) {
						case HORIZONTAL_ALIGN_LEFT:
							x = componentBounds.x;
							break;
						case HORIZONTAL_ALIGN_RIGHT:
							x = componentBounds.x + inputField.width - popUp.width;
							break;
						case HORIZONTAL_ALIGN_CENTER:
							x = componentBounds.x + (inputField.width - popUp.width) / 2;
							break;
					}
					y = componentBounds.y + inputField.height;
					break;
				case POSITION_ABOVE:
					switch(horizontalAlign) {
						case HORIZONTAL_ALIGN_LEFT:
							x = componentBounds.x;
							break;
						case HORIZONTAL_ALIGN_RIGHT:
							x = componentBounds.x + inputField.width - popUp.width;
							break;
						case HORIZONTAL_ALIGN_CENTER:
							x = componentBounds.x + (inputField.width - popUp.width) / 2;
							break;
					}
					y = componentBounds.y - (inputField.height + popUp.height);
					break;
			}
			popUp.x = x;
			popUp.y = y;
			
			if(ensureVisibility) {
				PopUpUtil.ensureVisibility(popUp);
			}
		}
		
		public static function alignToMousePoint(popUp:DisplayObject, xOffset:Number = NaN, yOffset:Number = NaN, ensureVisibility:Boolean = true):void {
			var alignmentPoint:Point = new Point(FlexGlobals.topLevelApplication.mouseX, FlexGlobals.topLevelApplication.mouseY);
			if(! isNaN(xOffset))
				alignmentPoint.x += xOffset;
			if(! isNaN(yOffset))
				alignmentPoint.y += yOffset;
			
			alignToPoint(popUp, alignmentPoint, ensureVisibility);
		}
		
		public static function alignToPoint(popUp:DisplayObject, alignmentPoint:Point, ensureVisibility:Boolean = true):void {
			popUp.x = alignmentPoint.x;
			popUp.y = alignmentPoint.y;
			
			if(ensureVisibility) {
				PopUpUtil.ensureVisibility(popUp);
			}
		}

		public static function ensureVisibility(popUp:DisplayObject):void {
			var adjustedCoordinates:Point = getAdjustedCoordinatesInScreen(popUp);
			
			popUp.x = adjustedCoordinates.x;
			popUp.y = adjustedCoordinates.y;
		}
		
		public static function getAdjustedCoordinatesInScreen(popUp:DisplayObject, startingPoint:Point = null):Point {
			if(startingPoint == null) {
				startingPoint = new Point(popUp.x, popUp.y);
			}
			var x:Number = startingPoint.x;
			var y:Number = startingPoint.y;
			
			var screenHeight:Number = FlexGlobals.topLevelApplication.screen.height;
			var screenWidth:Number = FlexGlobals.topLevelApplication.screen.width;
			
			if(x + popUp.width > screenWidth) {
				x = screenWidth - popUp.width;
			} else if(x < 0) {
				x = 0;
			}
			if(y + popUp.height > screenHeight) {
				y = screenHeight - popUp.height;
			} else if(y < 0) {
				y = 0;
			}
			
			return new Point(x, y);
		}
		
		public static function exceedViewport(popUp:DisplayObject):Boolean {
			var popUpBounds:Rectangle = popUp.getBounds(popUp.stage);
			var popUpTopLeft:Point = popUpBounds.topLeft;
			var x:Number = popUpTopLeft.x;
			var y:Number = popUpTopLeft.y;
			
			var screenHeight:Number = FlexGlobals.topLevelApplication.screen.height;
			var screenWidth:Number = FlexGlobals.topLevelApplication.screen.width;
			
			var result:Boolean = x < 0 || (x + popUp.width > screenWidth)
				|| y < 0 || (y + popUp.height > screenHeight);
			return result;
		}
		
	}
}