package classes.main
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Document extends Sprite
	{
		private var loopTimer:Timer;
		private var dessin:Dessin;
		
		public function Document():void
		{
			if (stage)
			{
				Initiation();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, Initiation);
			}
		}

		public function Initiation(evt:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Initiation);
			dessin = new Dessin();
			addChild(dessin);
			loopTimer = new Timer(20);
			loopTimer.addEventListener(TimerEvent.TIMER, MainLoop);
			loopTimer.start();
		}


		public function MainLoop(evt:TimerEvent):void
		{
			dessin.Update();
		}
		
	}
}