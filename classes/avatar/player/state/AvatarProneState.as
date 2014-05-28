package classes.avatar.player.state
{
	import classes.main.Istate;
	import classes.avatar.player.PlayerCharacter;
	import flash.display.MovieClip;
	import classes.main.KeyObject;
	
	public class AvatarProneState implements Istate
	{

		public function Update(a:MovieClip):void
		{
			a.ChangeDirection();
			if (a.IsCollide("ground"))
			{
				if (false == KeyObject.isDown(a.MOVEDOWN_KEY))
				{
					a.SetState(a.IDLE);
				}
				else if (KeyObject.isJustDown(a.JUMP_KEY))
				{
					a.OnCollision("");
					a.y += 10;
				}
			}
			else
			{
				a.SetState(a.JUMP);
			}
			
		}
		
		public function Enter(a:MovieClip):void
		{
			a.gotoAndStop(a.PRONE_ANIM);
		}
		
		public function Exit(a:MovieClip):void
		{

		}

	}
	
}
