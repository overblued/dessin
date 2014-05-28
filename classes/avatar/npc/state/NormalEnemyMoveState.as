package classes.avatar.npc.state
{
	import classes.main.Istate;
	import classes.avatar.npc.BaseEnemy;
	import flash.display.MovieClip;

	public class NormalEnemyMoveState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			if (a.move.currentFrame < a.move.totalFrames)
			{
				if (a.stopWatch.ElapsedTime() > 120 )
				{
					a.stopWatch.SetSplitPoint();
					a.move.nextFrame();
				}
			}
			else
			{
				if (a.stopWatch.ElapsedTime() > 120 )
				{
					a.stopWatch.SetSplitPoint();
					a.move.gotoAndStop(1);
				}
			}
			if (Math.abs(a.x - a.chaseTarget.x) < 150)
			{
				a.SetState(a.CHASE);
			}
			
			if (a.x >750)
			{
				a.HorizontalMovement("left");
			}
			else if (a.x <50)
			{
				
				a.HorizontalMovement("right");
			}
			else
			{
				
				a.HorizontalMovement();
			}
				
			
		
			if (Math.random() > 0.99)
			{
				a.SetState(a.IDLE);
			}
		}

		public function Enter(a:MovieClip):void
		{
			a.gotoAndStop(a.MOVE_ANIM);
			a.move.stop();
		}

		public function Exit(a:MovieClip):void
		{

		}
	}

}