package classes.avatar.npc.state
{
	import classes.main.Istate;
	import classes.avatar.npc.BaseEnemy;
	import flash.display.MovieClip;

	public class NormalEnemyHitState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			if (a.hit.currentFrame == 15)
			{
				a.SetState(a.IDLE);
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