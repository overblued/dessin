package classes.main
{
	import flash.display.MovieClip;
	import classes.map.Container;
	import classes.map.BaseMap
	//import PffLib_fla.MainTimeline;

	public class SideScroll extends MovieClip
	{
		private var a:MovieClip;
		private var bg:MovieClip;
		private var container:Container;

		public function SideScroll(hero:MovieClip):void
		{
			container = Container.GetInstance();
			a = hero;
			bg = BaseMap.GetMap();
		}

		public function AddMembers():void
		{

		}

		public function UpdateScroll():void
		{
			if ((bg.ground.x <= (-a.moveSpeed)) && (a.x < 2*bg.stageW/5) )
			{
				for (var i = 0; i < container.numChildren; i++)
				{
					container.getChildAt(i).x +=  a.moveSpeed;
				}

				bg.ground.x +=  a.moveSpeed;
				bg.trueGround.x +=  a.moveSpeed;
				bg.bg3.x +=  a.moveSpeed;
				bg.bg2.x +=  a.moveSpeed / 2;
				bg.bg1.x +=  a.moveSpeed / 4;
			}

			if ((bg.ground.x >= (bg.stageW + a.moveSpeed - bg.worldW)) && (a.x > 3*bg.stageW/5))
			{
				for (var j = 0; j < container.numChildren; j++)
				{
					container.getChildAt(j).x -=  a.moveSpeed;
				}
				
				bg.ground.x -=  a.moveSpeed;
				bg.trueGround.x -=  a.moveSpeed;
				bg.bg3.x -=  a.moveSpeed;
				bg.bg2.x -=  a.moveSpeed / 2;
				bg.bg1.x -=  a.moveSpeed / 4;
			}
		}
	}
}