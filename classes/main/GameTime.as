package classes.main
{
	import flash.utils.Timer;
	import flash.utils.getTimer;
	import flash.events.TimerEvent;
	
	public class GameTime 
	{
		private static var currentTime:uint;
		private static var prevTime:uint;
		private static var timer:Timer;
		private static var timeRival:uint;

		public static function Init():void
		{
			currentTime = 0;
			prevTime = 0;
			timeRival = 10;
			timer = new Timer(timeRival);  
			timer.addEventListener(TimerEvent.TIMER, OnTic);
			timer.start();
		}
		
		public static function OnTic(evt:TimerEvent):void
		{
			currentTime = getTimer();
		}
		
		public static function Update():void
		{
			prevTime = currentTime;
		}
		
		public static function GetDeltaTime():int
		{
			return currentTime - prevTime;
		}
		public static function GetCurrentTime():int
		{
			return currentTime;
		}
		
	}
	
}
