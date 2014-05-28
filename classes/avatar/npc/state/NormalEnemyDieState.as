package classes.avatar.npc.state
{
	import classes.main.Istate;
	import classes.avatar.npc.BaseEnemy;
	import flash.display.MovieClip;

	public class NormalEnemyDieState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			if (a.die.currentFrame < a.die.totalFrames)
			{
				if (a.stopWatch.ElapsedTime(1) > 80 )
				{
					a.stopWatch.SetSplitPoint(1);
					a.die.nextFrame();
				}
			}
			if (a.die.currentFrame == a.die.totalFrames)
			{
				if (a.stopWatch.ElapsedTime(1) > 80 )
				{
					a.SetState(a.IDLE);
					a.SelfDestroy();
				}
				
			}
		}

		public function Enter(a:MovieClip):void
		{
			a.gotoAndStop(a.DIE_ANIM);
			a.die.stop();
			a.stopWatch.SetSplitPoint(1);
		}

		public function Exit(a:MovieClip):void
		{
			
		}
	}

}