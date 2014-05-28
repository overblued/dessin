package classes.map
{
	import flash.display.MovieClip;
	
	//all stages/maps are created by this,
	
	public class BaseMap
	{
		private static var map:MovieClip;
		
		public static function CreateMap(newMapName:MovieClip):MovieClip
		{
			if (map)
			{
				throw new Error ("A map already exists, destroy it before creating a new one.");
			}
			else
			{
				return map = newMapName;
			}
		}
		
		
		public static function GetMap():MovieClip
		{
			if (map)
			{
				return map;
			}
			else
			{
				throw new Error ("You have to create a map first");
			}
		}
		
		public static function DestroyMap():MovieClip
		{
			if (map.parent)
			{
				map.parent.removeChild(map);
			}
			return map = null;
		}

	}
	
}
