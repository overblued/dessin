package classes.main.state
{
	import flash.events.MouseEvent;
	import classes.main.Istate;
	import classes.map.BaseMap;
	import classes.map.NavScreen;
	import classes.main.KeyObject;
	import flash.display.MovieClip;
	
	public class StartState implements Istate
	{

		public function Update(a:MovieClip):void
		{
			
		}
		
		
		public function Enter(a:MovieClip):void
		{
			a.mainScene = BaseMap.CreateMap(new NavScreen);
			a.addChild(a.mainScene);
			a.mainScene.drawStartScreen();
		}
		public function Exit(a:MovieClip):void
		{
			a.mainScene = BaseMap.DestroyMap();
		}

	}
	
}
