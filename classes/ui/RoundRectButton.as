package classes.ui
{
	import flash.display.MovieClip;
	import flash.display.GradientType;
	import flash.display.SimpleButton;
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import fl.motion.Color;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class RoundRectButton extends MovieClip
	{
		private var btn:SimpleButton;
		private var txtContent:TextField;
		
		private var _w:Number;
		private var _h:Number;
		private var _ellipse:Number;
		private var _border:Number;
		private var _txt:String;
		private var _col:uint;
		private var _txtCol:uint;
		private var _downCol:uint;
		private var _overCol:uint;

		private var _colors:Array;
		private var _alphas:Array;
		private var _ratios:Array;
		
		public function RoundRectButton(w:Number,h:Number,color:uint,txt:String,
										ellipse:Number = 0,border:Number=0,
										txtColor:uint = 0x000000):void
		{
			_w = w;
			_h = h;
			_ellipse = ellipse;
			_border = border;
			_txt = txt;
			_txtCol = txtColor;
			_col = color;
			_txtCol = txtColor;
			_downCol = Color.interpolateColor(_col,0x000000,0.3);
			_overCol = Color.interpolateColor(_col,0xffffff,0.3);
			
			_colors = new Array(Color.interpolateColor(_col,0xffffff,0.8), 0x000000);
			_alphas = new Array(1,1);
			_ratios = new Array(50,250);
			
			addButton();
			addText();
		}
		
		private function addButton():void
		{
			btn = new SimpleButton();
			btn.name = _txt;
			btn.tabEnabled =false;
			btn.upState = drawBG(_col);
			btn.downState = drawBG(_downCol);
			btn.overState = drawBG(_overCol);
			btn.hitTestState = btn.upState;
			addChild(btn);
		}
		
		private function addText():void
		{
			txtContent = new TextField();
			txtContent.mouseEnabled = false;
			txtContent.text = _txt;
			txtContent.textColor = _txtCol;
			txtContent.width = _w;
			txtContent.autoSize =  TextFieldAutoSize.CENTER;
			txtContent.scaleY = _h/txtContent.height
			txtContent.y = (_h - txtContent.height)/2
			addChild(txtContent);
		}
		
		public function drawBG(col:uint):Shape
		{
			_colors[1] = col;
			var matrix:Matrix = new Matrix();
			matrix.createGradientBox(_w,_h/2,-Math.PI/2,0,0);
			var rect:Shape = new Shape();
			var p:Graphics = rect.graphics;
			if (_border > 0)
			{
				p.lineStyle(_border, _col);
			}
			p.beginGradientFill(GradientType.LINEAR,_colors,_alphas,_ratios,matrix,"reflect");
			p.drawRoundRect(0,0,_w,_h,_ellipse);
			p.endFill();
			return rect;
		}
		
	}
	
}
