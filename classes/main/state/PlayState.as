package classes.main.state
{
	import classes.map.*;
	import classes.main.*;
	import classes.ui.Hud;
	import flash.display.MovieClip;
	import classes.avatar.npc.Ghost;
	
	public class PlayState implements Istate
	{

		public function Update(a:MovieClip):void
		{		
			a.hero.Update();
			a.mob.Update();
			a.scroller.UpdateScroll();
			a.collisionDetecter.Update();
			
			if (KeyObject.isJustDown(69))
			{
				a.mob.SpawnMob(new Ghost);
			}
			
			if (KeyObject.isJustDown(81))
			{
				a.SetState(Dessin.START);
			}
			
		}
		
		
		public function Enter(a:MovieClip):void
		{
			a.mainScene = BaseMap.CreateMap(new StageDarkMountain);
			a.hud = new Hud();
			a.addChild(a.mainScene);
			a.addChild(a.hud);
			a.addChild(a.container);
			a.hero.x = a.mainScene.startPointX;
			a.hero.y = a.mainScene.startPointY;
			a.container.addChild(a.hero);
			
			a.scroller = new SideScroll(a.hero);
			a.collisionDetecter = new CollisionDetect(a.hero);
			
		}
		public function Exit(a:MovieClip):void
		{
			a.mob.KillAll();
			a.container.removeChild(a.hero);
			a.removeChild(a.container);
			a.removeChild(a.hud);
			a.hud = null;
			//a.removeChild(a.mainScene);
			a.mainScene = BaseMap.DestroyMap();
			a.scroller = null;
			a.collisionDetecter = null;
		}

	}
	
}