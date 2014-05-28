package classes.ui
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import classes.main.event.*;
	import flash.ui.Mouse;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import fl.controls.Button;
	
	public class Hud extends MovieClip
	{
		private var lab:Tooltip;
		private var btn:RoundRectButton;
		private var btnName:String;
		private var labPostionOffsetX:Number = 0;
		private var labPostionOffsetY:Number = 20;
		
		public function Hud():void
		{
			hp.stop();
			mp.stop();
			AddExitButton();
			addEventListener(MouseEvent.MOUSE_OVER, ShowToolTip);
			addEventListener(MouseEvent.MOUSE_OUT, HideToolTip);
			addEventListener(MouseEvent.MOUSE_MOVE, MoveToolTip);
		}
		
		private function AddExitButton():void
		{
			btnName = "E x i t";
			btn = new RoundRectButton(80,20,0x999999,btnName,10,2);
			btn.x = 250;
			btn.y = 15;
			btn.addEventListener(MouseEvent.CLICK, OnClickExit);
			addChild(btn);
		}
		
		public function UpdateMana(n:Number):void
		{
			mp.gotoAndStop(101 - Math.round(n));
			if (lab && (lab.name == mp.name))
			{
				lab.txt = "You have " + String(101 - mp.currentFrame) + "% mana.";
			}
		}
		
		public function UpdateHp(n:Number):void
		{
			hp.gotoAndStop(101 - Math.round(n));
			if (lab && (lab.name == hp.name))
			{
				lab.txt = "You have " + String(101 - hp.currentFrame) + "% health.";
			}
		}
		
		public function ShowToolTip(e:MouseEvent):void
		{
			//e.stopPropagation();
			lab = new Tooltip();
			lab.name = e.target.name;
			lab.x = mouseX + labPostionOffsetX;
			lab.y = mouseY + labPostionOffsetY;
			switch (lab.name)
			{
				case "hp" :
					lab.txt = "You have " + String(101 - MovieClip(e.target).currentFrame) + "% health.";
					break;
				case "mp" :
					lab.txt = "You have " + String(101 - MovieClip(e.target).currentFrame) + "% mana.";
					break;
				case btnName :
					lab.txt = "Return to start screen";
				default:
			}
			addChild(lab);
		}
		public function MoveToolTip(e:MouseEvent):void
		{
			if (lab)
			{
				lab.x = mouseX + labPostionOffsetX;
				lab.y = mouseY + labPostionOffsetY;
			}
		}
		public function HideToolTip(e:MouseEvent):void
		{
			removeChild(lab);
			lab = null;
		}
		
		private function OnClickExit(e:MouseEvent):void
		{
			removeEventListener(MouseEvent.CLICK, OnClickExit);
			dispatchEvent( new GameNavEvent( GameNavEvent.ON_EXIT ) );
		}

	}
	
}
