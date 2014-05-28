package classes.main
{	
	import flash.display.MovieClip;

	public interface Istate
	{
		function Update(a:MovieClip):void;
		function Enter(a:MovieClip):void;
		function Exit(a:MovieClip):void;
	}
	
}


/*
public function SetState(newState:Istate):void
		{
			if (currentState == newState)
			{
				return;
			}
			if (currentState)
			{
				currentState.Exit(this);
			}
			previousState = currentState;
			currentState = newState;
			currentState.Enter(this);
		}
*/