package classes.ui
{
	import flash.display.Graphics;
	import flash.display.GradientType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.display.Sprite;
	import flash.sensors.Accelerometer;
	import flash.geom.Matrix;
	
	public class Tooltip extends Sprite
	{
		private var pen:Graphics;
		private var txtContent:TextField;
		private var canvas:Sprite;
		private var _content:String;
		private var _bgColor:Number;
		private var _bdColor:Number;
		private var _txtColor:Number;
		
		private var _colors:Array;
		private var _alphas:Array;
		private var _ratios:Array;

		public function Tooltip(txt:String = ""):void
		{
			_content = txt;
			_bgColor = 0x333333;
			_bdColor = 0x999999;
			_txtColor = 0xffffee;
			
			_colors = new Array(0xcccccc, _bgColor);
			_alphas = new Array(1,0.7);
			_ratios = new Array(0,255);
			showText();
			drawBackground();
		}
		
		private function drawBackground():void
		{
			if(canvas)
			{
				removeChild(canvas);
				canvas = null;
			}
			canvas = new Sprite();
			addChildAt(canvas,0);
			pen = canvas.graphics;
			//bg
			pen.lineStyle(1, _bgColor, 0.8);
			pen.beginGradientFill(GradientType.RADIAL, _colors, _alphas, _ratios);
			pen.drawRoundRect(0.5,0.5,txtContent.width+1,txtContent.height+1,2);
			pen.endFill(); 
			//border
			pen.lineStyle(1, _bdColor,0.8);
			pen.drawRoundRect(0,0,txtContent.width+2,txtContent.height+2, 4);
		}
		
		private function showText():void
		{
			txtContent = new TextField();
			txtContent.selectable = false;
			txtContent.text = _content;
			txtContent.textColor = _txtColor;
			txtContent.autoSize =  TextFieldAutoSize.CENTER;
			txtContent.x = txtContent.y = 1;
			addChild(txtContent);
		}
		
		public function set txt(txt:String):void
		{
			txtContent.text = txt;
			txtContent.x = txtContent.y = 1;
			drawBackground();
		}
		
		public function trans():void
		{
			var m:Matrix = canvas.transform.matrix;
			var rat:Number= 0.5;
			m.b = Math.sin(rat);
			m.c = -Math.sin(rat);
			canvas.transform.matrix = m;
			//canvas.transform.matrix.c = Math.tan(0.2);
		}

	}
	
}
