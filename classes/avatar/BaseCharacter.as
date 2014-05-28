package classes.avatar
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import classes.main.GameTime;
	import classes.main.Istate;
	import classes.main.counter.StopWatch;

	public class BaseCharacter extends MovieClip
	{
		protected var previousState:Istate;
		public var currentState:Istate;
		
		public const IDLE_ANIM:String = "idle";
		public const MOVE_ANIM:String = "move";
		public const JUMP_ANIM:String = "jump";
		public const PRONE_ANIM:String = "prone";
		public const SHOOT_ANIM:String = "shoot1";
		public const SHOOTF_ANIM:String = "shoot2";
		public const HIT_ANIM:String = "hit";
		public const DIE_ANIM:String = "die";

		protected var scalex;
		public var obstacle:String;
		public var gravity:Number = 3;
		
		public var dropSpeed:Number = 1;
		public var jumpForce:Number = 0;
		public var jumpForceMax:Number = 80;
		public var isDead:Boolean = false;
		public var invincible:Boolean = false;
		
		public var hp:Number = 100;
		public var mp:Number = 100;
		public var moveSpeed:Number = 0;
		public var moveSpeedMultiply = 10;

		public var stopWatch:StopWatch;

		public function BaseCharacter()
		{
			stop();
			scalex = scaleX;
			stopWatch = new StopWatch(3);

		}

		public function Update():void
		{
			moveSpeed = GameTime.GetDeltaTime() / moveSpeedMultiply;
			currentState.Update(this);
		}

		public function SetState(newState:Istate):void
		{
			if (currentState == newState)
			{
				return;
			}
			if (currentState)
			{
				currentState.Exit(this);
			}
			previousState = currentState;
			currentState = newState;
			currentState.Enter(this);
		}

		public function HorizontalMovement(direct:String = null):void
		{


			if (direct == "right")
			{
				scaleX =  -  scalex;
				if (x < stage.stageWidth)
				{
					x +=  moveSpeed;
				}
			}
			else if (direct == "left")
			{
				scaleX = scalex;
				if (x > 0)
				{
					x -=  moveSpeed;
				}
			}
			else
			{
				x -=  scaleX * moveSpeed;
			}

		}
		public function VerticalMovement(direct:String):void
		{
			//dropSpeed = GameTime.GetDeltaTime() / 5;

			if (direct == "up")
			{
				y -=  jumpForce / gravity;
				if (jumpForce > (1 / gravity))
				{
					jumpForce -=  jumpForce / gravity;// moveSpeed * gravity;
				}
				else
				{
					jumpForce = 0;
				}
			}
			else if (direct == "down")
			{
				y +=  dropSpeed;
				if (dropSpeed < (jumpForceMax / 10) )
				{
					dropSpeed +=  0.1 + GameTime.GetDeltaTime() / 100;
				}
			}
		}

		public function OnCollision(obs:String):void
		{
			obstacle = obs;
		}

		public function IsCollide(obs:String):Boolean
		{
			if (obstacle == obs)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		public function GetHit(a:MovieClip):void
		{
			if ((hp > 0) && (! invincible))
			{
				hp -=  a.ap;
				OnCollision("gethit");
			}
		}

		public function SelfDestroy():void
		{
			isDead = true;
		}

		
		

	}

}