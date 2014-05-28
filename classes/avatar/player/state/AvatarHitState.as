package classes.avatar.player.state
{
	import classes.main.Istate;
	import classes.avatar.player.PlayerCharacter;
	import flash.display.MovieClip;
	import classes.main.KeyObject;
	
	public class AvatarHitState implements Istate
	{

		public function Update(a:MovieClip):void
		{
			if (a.stopWatch.ElapsedTime(1) >= 250)
			{
				a.SetState(a.IDLE);
			}
			if (a.IsCollide("ground"))
			{
				/*if (KeyObject.isDown(a.MOVELEFT_KEY) || KeyObject.isDown(a.MOVERIGHT_KEY))
				{
					a.SetState(a.MOVE);
				}
				//jump
				if (KeyObject.isJustDown(a.JUMP_KEY) || KeyObject.isJustDown(a.MOVEUP_KEY))
				{
					a.SetState(a.JUMP);
					a.jumpForce = a.jumpForceMax;
				}
				//shoot
				if (KeyObject.isJustDown(a.SHOOT_KEY))
				{
					a.SetState(a.SHOOT);
				}
				//prone
				if (KeyObject.isDown(a.MOVEDOWN_KEY))
				{
					a.SetState(a.PRONE)
				}*/
			}
			else
			{
				a.VerticalMovement("down");
			}
			
		}
		
		public function Enter(a:MovieClip):void
		{
			a.gotoAndStop(a.HIT_ANIM);
		}
		
		public function Exit(a:MovieClip):void
		{

		}

	}
	
}
