package classes.avatar.player.state
{
	import classes.main.Istate;
	import classes.avatar.player.PlayerCharacter;
	import flash.display.MovieClip;
	import classes.main.KeyObject;

	public class AvatarShootState implements Istate
	{
		public function Update(a:MovieClip):void
		{
			if (a.weapon.currentArrow)
			{
				a.weapon.UpdateLanchPosition(a, a.shoot.currentFrame);
				if (a.shoot.currentFrame == 1)
				{
					a.ChangeDirection();
					if ((! KeyObject.isDown(a.SHOOT_KEY)) || (a.stopWatch.ElapsedTime(2) > 500))
					{
						a.weapon.ChargeUpTime(a.stopWatch.ElapsedTime(2));
						a.stopWatch.SetSplitPoint(2);
						a.shoot.nextFrame();
					}

				}
				if (a.shoot.currentFrame == 2)
				{
					if (KeyObject.isDown(a.SHOOT_KEY))
					{
						a.ChangeDirection();
					}
					
					if (a.stopWatch.ElapsedTime(2) > 100)
					{
						if (! KeyObject.isDown(a.SHOOT_KEY))
						{
							a.weapon.ChargeUpTime(a.stopWatch.ElapsedTime(2));
							a.stopWatch.SetSplitPoint(2);
							a.shoot.nextFrame();
						}
					}

				}
				if (a.shoot.currentFrame == 3)
				{
					if (a.stopWatch.ElapsedTime(2) > 100)
					{
						a.SetState(a.IDLE);
					}
				}

			}
			else
			{
				a.SetState(a.IDLE);
			}
		}

		public function Enter(a:MovieClip):void
		{
			if (a.weapon.currentArrow)
			{
				a.SetState(a.IDLE);
			}
			else
			{
				if (a.cc < Math.random())
				{
					a.gotoAndStop(a.SHOOT_ANIM);
				}
				else
				{
					a.gotoAndStop(a.SHOOTF_ANIM);
				}
				a.shoot.stop();
				a.stopWatch.SetSplitPoint(2);
				a.weapon.SpawnArrow(a);
			}
		}

		public function Exit(a:MovieClip):void
		{
			if (a.weapon.released == false)
			{
				a.weapon.KillArrow();
			}
		}
	}

}