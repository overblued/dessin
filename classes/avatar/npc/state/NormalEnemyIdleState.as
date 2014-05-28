package classes.avatar.npc.state
{
	import classes.main.Istate;
	import classes.avatar.npc.BaseEnemy;
	import flash.display.MovieClip;

	public class NormalEnemyIdleState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			
			if (Math.abs(a.x - a.chaseTarget.x) < 150)
			{
				a.SetState(a.CHASE);
			}

			if (a.IsCollide("ground"))
			{
				if(Math.random() < 0.01)
				{
					a.SetState(a.MOVE);
				}
				else if(Math.random() > 0.99)
				{
					a.scaleX = -a.scaleX;
					a.SetState(a.MOVE);
				}
			}
			else
			{
				a.SetState(a.JUMP);
			}
		}

		public function Enter(a:MovieClip):void
		{
			a.gotoAndStop(a.IDLE_ANIM);
		}

		public function Exit(a:MovieClip):void
		{

		}
	}

}