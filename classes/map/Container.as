package classes.map
{
	import flash.display.Sprite;
	
	public class Container extends Sprite
	{
		private static var instance:Container;

		public function Container(keygen:KeyGen = null):void
		{
			if (keygen == null)
			{
				throw new Error ("you cant create a container from here");
			}
			
		}
		
		public static function CreateInstance():Container
		{
			if (instance)
			{
				throw new Error ("A container already exists, destroy it before creating a new one.");
			}
			else
			{
				return instance = new Container(new KeyGen());
			}
		}
		
		public static function GetInstance():Container
		{
			if (instance)
			{
				return instance;
			}
			else
			{
				throw new Error  ("You have to create a container first");
			}
		}
	
	}
	
	
}

class KeyGen
{
	
}
