package classes.avatar.npc
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import classes.main.Istate;
	import classes.avatar.npc.state.*;
	import classes.avatar.BaseCharacter;
	import classes.main.GameTime;
	import classes.avatar.player.PlayerCharacter;
	
	public class BaseEnemy extends BaseCharacter
	{
		public const IDLE:Istate= new NormalEnemyIdleState();
		public const MOVE:Istate = new NormalEnemyMoveState();
		public const JUMP:Istate = new NormalEnemyJumpState();
		public const HIT:Istate = new NormalEnemyHitState();
		public const DIE:Istate = new NormalEnemyDieState();
		public const CHASE:Istate = new NormalEnemyChaseState();
		
		public var chaseTarget:PlayerCharacter;
		
		public function BaseEnemy()
		{
			super();
			currentState = IDLE;
			hp = 100;
			mp = 100;
			moveSpeed = 0;
			moveSpeedMultiply = 20;
			chaseTarget = PlayerCharacter.GetInstance();
		}
		
		override public function Update():void
		{
			moveSpeed = GameTime.GetDeltaTime() / moveSpeedMultiply ;
			stopWatch.AddValue(GameTime.GetDeltaTime());
			
			if (hp <= 0)
			{
				SetState(DIE);
			}
			else if (IsCollide("gethit"))
			{
				SetState(HIT);
			}
			
			currentState.Update(this);
		}
		
		
	}
	
}
