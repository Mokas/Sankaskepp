package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Leandro
	 */
	public class Tile extends Sprite
	{
		//Tile relaterad
		public static var TILEWIDTH:int;
		public static var TILEHEIGHT:int;
		
		//Image relaterad
		[Embed(source = "../Images/Hit.png")]
		private var HitImage:Class;
		[Embed(source = "../Images/Miss.png")]
		private var MissImage:Class;
		[Embed(source="../Images/Unknown.png")]
		private var UnknownImage:Class;
		
		private var UimabeBit:Bitmap = new UnknownImage();
		private var StatusImageBit:Bitmap;
		
		private var mH:Number;
		private var mW:Number;
		private var glow:GlowFilter = new GlowFilter(0xFFFFFF);
		
		public function Tile() 
		{
			mW = TILEWIDTH / UimabeBit.width;
			mH = TILEHEIGHT / UimabeBit.height;
			
			this.graphics.beginBitmapFill(UimabeBit.bitmapData, new Matrix(mW, 0, 0, mH));
			this.graphics.drawRect(0, 0, TILEWIDTH, TILEHEIGHT);
			this.filters = [glow];
			this.graphics.endFill();
		}
		
		public function Clear(func:Function):void 
		{
			this.graphics.clear();
			this.removeEventListener(MouseEvent.CLICK, func);
		}
		
		public function DrawStatus(hit:Boolean):void 
		{
			if (hit) 
				StatusImageBit = new HitImage();
			else 
				StatusImageBit = new MissImage();
				
			this.graphics.beginBitmapFill(StatusImageBit.bitmapData, new Matrix(mW, 0, 0, mH));
			this.graphics.drawRect(0, 0, TILEWIDTH, TILEHEIGHT);
			this.filters = [glow];
			this.graphics.endFill();
		}
	}
}