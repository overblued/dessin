package classes.avatar.player
{
	import flash.ui.Keyboard;
	import flash.display.Stage;
	import flash.events.Event;

	import classes.main.KeyObject;
	import classes.main.Istate;
	import classes.main.event.*;
	import classes.avatar.player.state.*;
	import flash.sensors.Accelerometer;
	import classes.avatar.weapon.WeaponObject;
	import classes.avatar.BaseCharacter;
	import flash.display.MovieClip;
	import classes.main.GameTime;
	import classes.main.counter.StopWatch;

	public class PlayerCharacter extends BaseCharacter
	{
		public const IDLE:Istate = new AvatarIdleState();
		public const MOVE:Istate = new AvatarMoveState();
		public const JUMP:Istate = new AvatarJumpState();
		public const PRONE:Istate = new AvatarProneState();
		public const SHOOT:Istate = new AvatarShootState();
		public const HIT:Istate = new AvatarHitState();

		public const MOVELEFT_KEY:uint = 37;
		public const MOVEUP_KEY:uint = 38;
		public const MOVERIGHT_KEY:uint = 39;
		public const MOVEDOWN_KEY:uint = 40;
		public const JUMP_KEY:uint = 32;//space32
		public const SHOOT_KEY:uint = 17;//ctrl17
		private static var instance:PlayerCharacter;

		public var cc:Number = 0.3;

		public var weapon:WeaponObject;
		public var currentWeapon = 3;

		public function PlayerCharacter(keygen:KeyGen = null):void
		{
			if (keygen == null)
			{
				throw new Error("you cant create a character from here");
			}
			else
			{
				
				addEventListener(Event.ADDED_TO_STAGE, Init);
			}
		}

		private function Init(evt:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			stop();
			scalex = scaleX;
			stopWatch = new StopWatch(3);
			
			if ( x < (stage.width / 2) )
			{
				scaleX =  -  scalex;
			}
			else
			{
				scaleX = scalex;
			}
			weapon = new WeaponObject();
			currentState = IDLE;
			moveSpeedMultiply = 10;

		}



		override public function Update():void
		{
			moveSpeed = GameTime.GetDeltaTime() / moveSpeedMultiply;
			stopWatch.AddValue(GameTime.GetDeltaTime());

			if (IsCollide("gethit"))
			{
				dispatchEvent(new AvatarEvent( AvatarEvent.ON_CHANGEHP));
				stopWatch.SetSplitPoint(1);
				invincible = true;
				SetState(HIT);
			}

			if (invincible)
			{
				if (stopWatch.ElapsedTime(1) > 1000)
				{
					invincible = false;
				}

			}

			if (hp < 100)
			{
				if (stopWatch.ElapsedTime(1) > 5000)
				{
					hp +=  GameTime.GetDeltaTime() / 300;
					dispatchEvent(new AvatarEvent( AvatarEvent.ON_CHANGEHP));
				}
				
			}
			if (mp < 100)
			{
				if (stopWatch.ElapsedTime(3) > 5000)
				{
					mp +=  GameTime.GetDeltaTime() / 150;
					dispatchEvent(new AvatarEvent( AvatarEvent.ON_CHANGEMP));
				}
			}
			weapon.Update();
			currentState.Update(this);
		}

		public function ChangeDirection():void
		{
			if (KeyObject.isJustDown(MOVERIGHT_KEY))
			{
				scaleX =  -  scalex;
			}
			else if (KeyObject.isJustDown(MOVELEFT_KEY))
			{
				scaleX = scalex;
			}
		}
		
		override public function GetHit(a:MovieClip):void
		{
			super.GetHit(a);
			if (hp <= 0)
			{
				hp = 100;
				mp = 100;
				dispatchEvent(new GameNavEvent(GameNavEvent.ON_OVER));
			}
			
		}

		public function CheckMana(m:Number):Boolean
		{
			if (mp >= m)
			{
				mp -=  m;
				stopWatch.SetSplitPoint(3);
				//for regeneration;
				dispatchEvent(new AvatarEvent( AvatarEvent.ON_CHANGEMP));
				return true;
			}
			else
			{// add not enough mana alert
				return false;
			}
		}

		public function GetMana():Number
		{
			return mp;
		}

		public function GetHp():Number
		{
			return hp;
		}

		public static function CreateInstance():PlayerCharacter
		{
			if (instance)
			{
				throw new Error("A player character already exists, destroy it before creating a new one.");
			}
			else
			{
				return instance = new PlayerCharacter(new KeyGen());
			}
		}

		public static function GetInstance():PlayerCharacter
		{
			if (instance)
			{
				return instance;
			}
			else
			{
				throw new Error("You have to create a player character first");
			}
		}

	}

}


class KeyGen
{

}