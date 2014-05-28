package classes.main
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;

	public class KeyObject
	{
		private static var keysDown:Vector.<Boolean > ;
		private static var keysJustDown:Vector.<Boolean > ;
		//private static var keysJustUp:Array;

		public static function Init(stage:Stage):void
		{
			keysDown = new Vector.<Boolean>();
			keysJustDown = new Vector.<Boolean>();
			//keysJustUp = new Array();
			for (var i = 1; i<=222; i++)
			{
				keysDown.push(false);
				keysJustDown.push(false);
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyReleased);
		}

		public static function isDown(keyCode:uint):Boolean
		{
			return keysDown[keyCode];
		}

		public static function isJustDown(keyCode:uint):Boolean
		{
			if (keysJustDown[keyCode])
			{
				keysJustDown[keyCode] = false;
				return true;
			}
			else
			{
				return false;
			}
		}

		/*public static function isJustUp(keyCode:uint):Boolean
		{
		if (keysJustUp[keyCode])
		{
		keysJustUp[keyCode] = false;
		return true;
		}
		else
		{
		return false;
		}
		}*/

		private static function KeyPressed(evt:KeyboardEvent):void
		{
			if (keysDown[evt.keyCode] == false)
			{
				keysJustDown[evt.keyCode] = true;
			}
			keysDown[evt.keyCode] = true;
		}

		private static function KeyReleased(evt:KeyboardEvent):void
		{
			keysDown[evt.keyCode] = false;
			keysJustDown[evt.keyCode] = false;
			//keysJustUp[evt.keyCode] = true;
		}
	}
}