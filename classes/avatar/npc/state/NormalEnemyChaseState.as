package classes.avatar.npc.state
{
	import classes.main.Istate;
	import classes.avatar.npc.BaseEnemy;
	
	import flash.display.MovieClip;

	public class NormalEnemyChaseState implements Istate
	{
		
		
		public function Update(a:MovieClip):void
		{
			if (a.move.currentFrame < a.move.totalFrames)
			{
				if (a.stopWatch.ElapsedTime() > 60 )
				{
					a.stopWatch.SetSplitPoint();
					a.move.nextFrame();
				}
			}
			else
			{
				if (a.stopWatch.ElapsedTime() > 60 )
				{
					a.stopWatch.SetSplitPoint();
					a.move.gotoAndStop(1);
				}
			}
			if (Math.abs(a.x - a.chaseTarget.x) > 150)
			{
				a.SetState(a.IDLE);
			}
			if (a.x > (a.chaseTarget.x + 25))
			{
				a.HorizontalMovement("left");
			}
			else if (a.x < (a.chaseTarget.x - 25))
			{
				a.HorizontalMovement("right");
			}
			else
			{
				a.HorizontalMovement("");
			}
				
		}

		public function Enter(a:MovieClip):void
		{
			a.moveSpeedMultiply = 15;
			a.gotoAndStop(a.MOVE_ANIM);
			a.move.stop();
			a.stopWatch.SetSplitPoint();
		}

		public function Exit(a:MovieClip):void
		{
			a.moveSpeedMultiply = 20;
		}
	}

}