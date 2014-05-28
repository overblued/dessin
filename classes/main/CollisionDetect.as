package classes.main
{
	import flash.display.MovieClip;
	import classes.map.BaseMap;
	import classes.map.Container;
	import classes.avatar.npc.MobObject;


	public class CollisionDetect extends Object
	{
		private var container:Container;
		private var a:MovieClip;
		private var bg:MovieClip;
		private var mobObject:MobObject;
		private var mobs:Array;

		public function CollisionDetect(hero:MovieClip):void
		{
			a = hero;
			bg = BaseMap.GetMap().trueGround;
			container = Container.GetInstance();
			mobObject = MobObject.GetInstance();
		}

		public function Update():void
		{
			CheckGround(a);
			for (var i = 0; (i < mobObject.mobs.length); i++)
			{
				if (mobObject.mobs[i].isDead == false)
				{
					mobObject.mobs[i].Update();
					CheckGround(mobObject.mobs[i]);
					CheckCollision(mobObject.mobs[i]);
				}
				else
				{
					mobObject.KillMob(i);
				}

			}

		}

		public function CheckCollision(m:MovieClip):void
		{

			if (a.hitTestObject(m) && (m.hp > 0))
			{
				a.GetHit(m);
			}
			//mobs
			if (a.weapon.released && m.hitTestPoint(a.weapon.currentArrow.x,a.weapon.currentArrow.y,true))
			{
				if (! a.weapon.isHit)
				{
					m.GetHit(a.weapon.currentArrow);
					a.weapon.OnHit();
				}
			}
		}

		public function CheckGround(m:MovieClip):void
		{
			while (bg.hitTestPoint(m.x, m.y - 1, true))
			{
				m.y -=  0.1;
			}

			if (bg.hitTestPoint(m.x,m.y + 3,true))
			{
				m.y +=  3;
			}

			if (bg.hitTestPoint(m.x, m.y, true) && (m.jumpForce <= 0 ))
			{
				m.OnCollision("ground");
			}
			else
			{
				m.OnCollision("");
			}
		}

	}

}