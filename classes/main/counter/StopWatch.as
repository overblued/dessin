package classes.main.counter
{
	import classes.main.counter.BaseCounter;
	
	public class StopWatch extends BaseCounter
	{
		private var lapTimes:Vector.<uint>;
		private var amountOfSliptPoint:uint;

		public function StopWatch(NumOfSliptPoint:uint = 1)
		{
			lapTimes = new Vector.<uint>();
			amountOfSliptPoint = NumOfSliptPoint;
			ResetSliptPoint();
			super();
		}
		
		public function SetSplitPoint(p:uint = 1):void
		{
			lapTimes[p - 1] = currentValue;
		}
		public function ResetSliptPoint(p:uint = 0):void
		{
			if (p)
			{
				lapTimes[p - 1] = 0;
				
			}
			else
			{
				for (var i = 0; i < amountOfSliptPoint; i++)
				{
					lapTimes[i] = 0;
				}
				
			}
			
		}
		//elapsed time after split point
		public function ElapsedTime(p:uint = 1):uint
		{
			return currentValue - lapTimes[p-1];
		}
		//elapsed time from the beginning
		public function TotalElapsedTime(p:uint = 0):uint
		{
			if (p)
			{
				return lapTimes[p - 1];
			}
			else
			{
				return currentValue;
			}
			
		}

	}
	
}
