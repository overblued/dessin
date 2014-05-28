package classes.main
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.main.state.*;
	import classes.main.event.*;
	import classes.avatar.npc.Ghost;
	import classes.avatar.player.PlayerCharacter;
	import classes.ui.Hud;
	import classes.map.Container;
	import classes.avatar.npc.MobObject;


	
	public class Dessin extends MovieClip
	{
		public static const START:StartState = new StartState();
		public static const PLAY:PlayState = new PlayState();
		public static const END:EndState = new EndState();
		
		private var currentState:Istate;
		private var previousState:Istate;
		
		public var mainScene:MovieClip;
		public var hud:Hud;
		public var hero:PlayerCharacter;
		public var mob:MobObject;
		public var scroller:SideScroll;
		public var collisionDetecter:CollisionDetect;
		public var container:Container;
		
		
		
		public function Dessin()
		{
			if (stage)
			{
				Initiation();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, Initiation);
			}
		}
		
		public function Initiation(evt:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Initiation);
			GameTime.Init();
			KeyObject.Init(stage);
			container = Container.CreateInstance();
			
			hero = PlayerCharacter.CreateInstance();
			mob = MobObject.CreateInstance();
			
			addEventListener(AvatarEvent.ON_CHANGEMP, OnManaChange, false, 0, true);
			addEventListener(AvatarEvent.ON_CHANGEHP, OnHpChange, false, 0, true);
			
			addEventListener(GameNavEvent.ON_START, StartGame, false, 0, true);
			addEventListener(GameNavEvent.ON_EXIT, ExitGame, false, 0, true);
			addEventListener(GameNavEvent.ON_OVER, EndGame, false, 0, true);
			
			SetState(Dessin.START);
		}
		
		public function Update():void
		{
			if(KeyObject.isJustDown(73))
			{
				SetState(Dessin.START);
			}
			if(KeyObject.isJustDown(79))
			{
				SetState(Dessin.PLAY);
			}
			if(KeyObject.isJustDown(80))
			{
				SetState(Dessin.END);
			}
			currentState.Update(this);
			GameTime.Update();
		}
		
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
		
		
		
		public function StartGame(evt:Event):void
		{
			SetState(Dessin.PLAY);
		}
		public function ExitGame(evt:Event):void
		{
			SetState(Dessin.START);
		}
		public function EndGame(evt:Event):void
		{
			SetState(Dessin.END);
		}
		public function OnManaChange(e:AvatarEvent):void
		{
			hud.UpdateMana(hero.GetMana());
		}
		public function OnHpChange(e:AvatarEvent):void
		{
			hud.UpdateHp(hero.GetHp());
		}
		
	}
	
}
