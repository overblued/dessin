package classes.main.event
{
	import flash.events.Event;
	
	public class AvatarEvent extends Event
	{
		public static const ON_CHANGEHP:String = "on_changehp";
		public static const ON_CHANGEMP:String = "on_changemp";

		public function AvatarEvent(s:String):void 
		{
			super(s, true);
		}

	}
	
}
