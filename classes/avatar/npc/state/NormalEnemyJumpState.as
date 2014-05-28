package classes.avatar.npc.state
{
	import classes.main.Istate;
	import classes.avatar.npc.BaseEnemy;
	import flash.display.MovieClip;

	public class NormalEnemyJumpState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			//move horizontally
			if (a.jumpForce > 0)
			{
				a.VerticalMovement("up");
				a.OnCollision("");
			}
			
			if (a.IsCollide("ground"))
			{
				a.SetState(a.IDLE);
			}
			else
			{
				if (a.jumpForce <= 0)
				{
					a.jumpForce = 0;
					a.VerticalMovement("down");
				}
			}
		}

		public function Enter(a:MovieClip):void
		{
			a.gotoAndStop(a.JUMP_ANIM);
		}

		public function Exit(a:MovieClip):void
		{
			a.dropSpeed = a.moveSpeed;
		}
	}

}