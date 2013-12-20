package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import Tile;
	/**
	 * ...
	 * @author Leandro
	 */
	public class Main extends Sprite 
	{
		public var TileVector:Vector.<Vector.<Tile>> = new Vector.<Vector.<Tile>>;
		public const XYTILE:int = 10;
		
		public const TILEWIDTH:int = stage.stageWidth / XYTILE;
		public const TILEHEIGHT:int = stage.stageHeight / XYTILE;
		
		private var TEXT:TextField;
		
		private var score:int = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//Set Default WIDTH AND HEIGHT in the Tile File
			Tile.TILEWIDTH = TILEWIDTH;
			Tile.TILEHEIGHT = TILEHEIGHT;
			
			DrawToStage();
			

			
			var DistributeBoat:Boat = new Boat(TileVector)
			
			TEXT = new TextField();
			TEXT.selectable = false;
			TEXT.wordWrap = true;
			TEXT.autoSize = "left";
			TEXT.x = 0;
			TEXT.y = 0;
			TEXT.textColor = 0x400080;
			TEXT.text = score.toString();
			TileVector[1][1].addChild(TEXT);
		}
		
		private function DrawToStage():void 
		{
			for (var i:int = 0; i < XYTILE; i++) 
			{
				TileVector[i] = new Vector.<Tile>;
				for (var j:int = 0; j < XYTILE; j++) 
				{
					TileVector[i][j] = new Tile();
					TileVector[i][j].x = TILEWIDTH * j;
					TileVector[i][j].y = TILEHEIGHT * i;
					TileVector[i][j].addEventListener(MouseEvent.CLICK, Score);
					stage.addChild(TileVector[i][j]);
				}
			}
		}
		
		private function Score(m:MouseEvent):void
		{
			if (m.target.name == "1")
			{
				m.target.DrawStatus(true);
				score++;
				TEXT.text = score.toString();
			}
			else 
			{
				m.target.DrawStatus(false);
			}
			TEXT.text = score.toString();
		}
	}
}