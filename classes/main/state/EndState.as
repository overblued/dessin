package classes.main.state
{
	import classes.main.*;
	import classes.map.*;
	import flash.display.MovieClip;
	
	public class EndState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			
		}
		
		
		public function Enter(a:MovieClip):void
		{
			a.mainScene = BaseMap.CreateMap(new NavScreen);
			a.addChild(a.mainScene);
			a.mainScene.drawEndScreen();
		}
		public function Exit(a:MovieClip):void
		{
			a.mainScene = BaseMap.DestroyMap();
		}
	}
	
}