package classes.map
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import classes.main.event.GameNavEvent;
	
	public class StartScreen extends MovieClip
	{

		public function StartScreen()
		{
			sButton.mouseFocusEnabled = false;
			sButton.addEventListener(MouseEvent.CLICK, OnClickStart);
		}
		
		public function OnClickStart(evt:MouseEvent):void
		{
			removeEventListener(MouseEvent.CLICK, OnClickStart);
			dispatchEvent( new GameNavEvent( GameNavEvent.ON_START ) );
		}
		
	}
	
}
