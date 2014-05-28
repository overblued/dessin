package classes.avatar.npc
{
	import flash.display.MovieClip;
	import classes.map.BaseMap;
	import classes.map.Container;
	import classes.avatar.npc.*;
	import classes.main.counter.StopWatch;
	import classes.main.GameTime;
	
	public class MobObject
	{
		private static var instance:MobObject;
		private var container:Container;
		public var mobs:Array;
		private var amountOfMobs:uint;
		private var stopWatch:StopWatch

		public function MobObject(keygen:KeyGen = null):void
		{
			if (keygen == null)
			{
				throw new Error ("you cant create a MobObject from here");
			}
			mobs = new Array();
			container = Container.GetInstance();
			amountOfMobs = 0;
			stopWatch = new StopWatch();
			stopWatch.SetSplitPoint();
		}
		
		public static function CreateInstance():MobObject
		{
			if (instance)
			{
				throw new Error ("A MobObject already exists, destroy it before creating a new one.");
			}
			else
			{
				return instance = new MobObject(new KeyGen());
			}
		}
		
		public static function GetInstance():MobObject
		{
			if (instance)
			{
				return instance;
			}
			else
			{
				throw new Error  ("You have to create a MobObject first");
			}
		}
		
		public function Update():void
		{
			stopWatch.AddValue(GameTime.GetDeltaTime());
			if (stopWatch.ElapsedTime() > 10000)
			{
				stopWatch.SetSplitPoint();
				if (amountOfMobs < 3)
				{
					SpawnMob(new Ghost);
				}
			}
		}
		
		public function SpawnMob(NewEnemy:MovieClip):void
		{
			mobs.push(NewEnemy);
			mobs[amountOfMobs].x = 800 * Math.random();;
			mobs[amountOfMobs].y = 350;
			container.addChildAt(mobs[amountOfMobs++], container.numChildren - 1);
		}
		public function KillMob(n:uint):void
		{
			container.removeChild(mobs[n]);
			mobs[n] = null;
			mobs.splice(n, 1);
			amountOfMobs--;
		}
		public function KillAll():void
		{
			var n = amountOfMobs;
			for (var i = 0; i < n;i++)
			{
				KillMob(0);
			}
			
		}

	}

}
class KeyGen
{
	
}
