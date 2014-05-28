package classes.main.counter
{
	
	public class BaseCounter
	{
		public var currentValue:uint;
		
		public function BaseCounter():void
		{
			ResetValue();
		}

		public function ResetValue():void
		{
			currentValue = 0;
		}
		public function AddValue(amount:Number):void
		{
			currentValue += amount;
			DisplayValue();
		}
		
		public function DisplayValue():void
		{

		}
	}
	
}
