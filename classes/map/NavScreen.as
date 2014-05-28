package classes.map
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import classes.main.event.GameNavEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	import classes.ui.RoundRectButton;
	import flash.display.Graphics;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class NavScreen extends MovieClip
	{
		public var curtain:Sprite;
		public var lab:TextField;
		private var _w:Number;		
		private var _h:Number;


		public function NavScreen()
		{
			addEventListener(Event.ADDED_TO_STAGE, Init);
		}
		public function Init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Init);
			_w = stage.stageWidth;
			_h = stage.stageHeight;
		}
		
		public function drawStartScreen():void
		{
			addButton("Start").addEventListener(MouseEvent.CLICK, OnClickStart);
		}
		
		public function drawEndScreen():void
		{
			curtain = addCurtain();
			lab = addLabel("You are dead");
			var labTween:Tween = new Tween(lab, "y", Regular.easeOut, lab.y, _h/4, 0.5, true);
			labTween.addEventListener(TweenEvent.MOTION_FINISH, onLabelDown);
			
		}
		
		private function onLabelDown(evt:TweenEvent):void
		{
			var curtainTween:Tween = new Tween(curtain, "y", Bounce.easeOut, -_h, 0, 1, true);
			curtainTween.addEventListener(TweenEvent.MOTION_FINISH, onCurtainDown);
		}
		
		private function onCurtainDown(evt:TweenEvent):void
		{
			addButton("Restart").addEventListener(MouseEvent.CLICK, OnClickStart);
		}
		
		private function addCurtain():Sprite
		{
			var canvas:Sprite = new Sprite();
			var p:Graphics = canvas.graphics;
			p.beginFill(0x111111,0.8);
			p.drawRect(0,0,_w,_h);
			p.endFill();
			canvas.y = -_h;
			addChild(canvas);
			return canvas;
		}
		
		private function addButton(nom:String):RoundRectButton
		{
			var btn:RoundRectButton = new RoundRectButton(80, 20, 0x999999, nom, 10, 2);
			btn.x = (_w - btn.width)/2;
			btn.y = 3*(_h - btn.width)/4;
			addChild(btn);
			return btn;
		}
		
		private function addLabel(nom:String):TextField
		{
			var txt:TextField = new TextField();
			txt.text = nom;
			txt.textColor = 0xffcccc;
			txt.autoSize = TextFieldAutoSize.CENTER;
			txt.scaleY = 5;
			txt.x = (_w - txt.width)/2;
			txt.y = 0 - txt.height;
			addChild(txt);
			return(txt);
		}
		
		private function OnClickStart(evt:MouseEvent):void
		{
			removeEventListener(MouseEvent.CLICK, OnClickStart);
			dispatchEvent( new GameNavEvent( GameNavEvent.ON_START ) );
		}
	
	}
	
}
