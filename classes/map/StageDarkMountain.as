package classes.map
{
	import flash.display.MovieClip;
	import classes.map.darkmountain.*;
	import flash.events.Event;
	
	public class StageDarkMountain extends MovieClip
	{
		public var stageH:Number;
		public var stageW:Number;
		public var worldH:Number;
		public var worldW:Number;
		public var startPointX:Number;
		public var startPointY:Number;

		public function StageDarkMountain():void
		{
			addEventListener(Event.ADDED_TO_STAGE,Init);
		}
		public function Init(evt:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			
			stageH = stage.stageHeight;
			stageW = stage.stageWidth;
			worldW = ground.width;
			//worldH = ??;

			startPointX = 50;
			startPointY = 400;
						
			trueGround.alpha = 0;
			
		}

	}
	
}
