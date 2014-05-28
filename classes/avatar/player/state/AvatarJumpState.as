package classes.avatar.player.state
{
	import classes.main.Istate;
	import classes.avatar.player.PlayerCharacter;
	import flash.display.MovieClip;
	import classes.main.KeyObject;

	public class AvatarJumpState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			//move horizontally
			if (KeyObject.isDown(a.MOVERIGHT_KEY))
			{
				a.HorizontalMovement("right");
			}
			else if (KeyObject.isDown(a.MOVELEFT_KEY))
			{
				a.HorizontalMovement("left");
			}
			

			if (a.jumpForce > 0)
			{
				a.VerticalMovement("up");
				a.OnCollision("");
			}
			
			
			if (a.IsCollide("ground"))
			{
				if (KeyObject.isDown(a.MOVERIGHT_KEY) || KeyObject.isDown(a.MOVELEFT_KEY))
				{
					a.SetState(a.MOVE);
				}
				else
				{
					a.SetState(a.IDLE);
				}
			}
			else
			{
				if ((a.jumpForce <= 0) || (false == (KeyObject.isDown(a.JUMP_KEY) || KeyObject.isDown(a.MOVEUP_KEY))))
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