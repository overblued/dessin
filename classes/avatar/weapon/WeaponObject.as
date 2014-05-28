package classes.avatar.weapon
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	import classes.main.counter.StopWatch;
	import classes.main.GameTime;
	import classes.map.Container;
	import flash.display.Sprite;

	/*
	instantiate a weapon
	*/
	public class WeaponObject
	{
		private var container:Container;
		public var currentArrow:MovieClip;
		public var released:Boolean = false;
		private var flyRange:Number;
		public var isHit:Boolean = false;
		
		public var stopWatch:StopWatch;


		public function WeaponObject():void
		{
			container = Container.GetInstance();
			stopWatch = new StopWatch();
			
		}


		public function SpawnArrow(a:MovieClip):void
		{
			switch (Math.round( 2 * Math.random()))
			{
				case 0 :
					currentArrow = new LightArrow();
					break;
				case 1 :
					currentArrow = new FireArrow();
					break;
				case 2 :
					currentArrow = new StormArrow();
					break;
				default :
					break;
			}
			flyRange = 100;
			currentArrow.name = "projetile";
			currentArrow.scaleX = a.scaleX;
			currentArrow.x = a.x - 45*(a.scaleX);
			currentArrow.y = a.y - 30;
			currentArrow.stop();
			container.addChild(currentArrow);
		}

		public function Update():void
		{
			stopWatch.AddValue(GameTime.GetDeltaTime());
			if (currentArrow && released)
			{
				if (isHit)
				{
					if (stopWatch.ElapsedTime() > 10)
					{
						stopWatch.SetSplitPoint();
						currentArrow.explode.nextFrame();
					}
					if (currentArrow.explode.currentFrame == currentArrow.explode.totalFrames)
					{
						KillArrow();
					}
				}
				else if (flyRange > 0)
				{
					currentArrow.x -=  currentArrow.flySpeed;
					flyRange -=  Math.abs(currentArrow.flySpeed);
				}
				else
				{
					KillArrow();
				}
			}
		}

		public function UpdateLanchPosition(a:MovieClip, p:Number = 1):void
		{
			if (! released)
			{
				currentArrow.scaleX = a.scaleX;
				currentArrow.x = a.x - (a.scaleX * Math.abs(currentArrow.x - a.x));
			}
			switch (p)
			{
				case 1 :
					break;
				case 2 :
					currentArrow.x = a.x - 30*(a.scaleX);//15*(currentArrow.scaleX);
					break;
				case 3 :
					LauchArrow(a);
					break;
				default :
			}

		}

		public function KillArrow():void
		{
			if (currentArrow)
			{
				isHit = false;
				released = false;
				container.removeChild(currentArrow);
				currentArrow = null;
			}

		}

		public function LauchArrow(a:MovieClip):void
		{
			//mana check
			if (! released)
			{
				if (a.CheckMana(currentArrow.manaCost))
				{
					currentArrow.flySpeed *=  a.scaleX;
					released = true;
				}
				else
				{
					KillArrow();
					
				}
			}
		}
		//decides how powerful the arrow is(range)
		public function ChargeUpTime(t:uint):void
		{
			flyRange +=  t / 2;
			if (flyRange > 600)
			{
				flyRange = 600;
			}

		}

		public function OnHit():void
		{
			isHit = true;
			currentArrow.nextFrame();
			currentArrow.explode.stop();
			stopWatch.SetSplitPoint();
		}

	}

}