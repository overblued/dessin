package classes.main.event
{
	import flash.events.Event;
	
	public class GameNavEvent extends Event 
	{
		public static const ON_START:String = "on_start";
		public static const ON_EXIT:String = "on_exit";
		public static const ON_OVER:String = "on_over";

		public function GameNavEvent(s:String):void
		{
			super(s, true);
		}

	}
	
}