package  
{
	/**
	 * ...
	 * @author Leandro
	 */
	public class Boat 
	{
		
		public function Boat(TileVector:Vector.<Vector.<Tile>>) 
		{
			//States is boats are going to be vertical(true) or horizontal
			var vertical:Boolean
			//Picks random tiles from the tile vector
			var randomY:int;
			var randomX:int;
			//Holds length of each boat
			var length:int;
			
			for (var i:int = 0; i <= 9; i++) 
			{
				vertical = Math.round(Math.random());
				if (i <= 4)
				{
					if (!vertical)
					{
						randomY = Math.random() * 10;
						randomX = Math.random() * 8;
					}
					else
					{
						randomY = Math.random() * 8;
						randomX = Math.random() * 10;
					}
					length = 2;
				}
				else if ( i > 4 && i <= 6)
				{
					if (!vertical)
					{
						randomY = Math.random() * 10;
						randomX = Math.random() * 7;
					}
					else
					{
						randomY = Math.random() * 7;
						randomX = Math.random() * 10;
					}
					length = 3;
				}
				else if (i > 6 && i <= 8)
				{
					if (!vertical)
					{
						randomY = Math.random() * 10;
						randomX = Math.random() * 6;
					}
					else
					{
						randomY = Math.random() * 6;
						randomX = Math.random() * 10;
					}
					length = 4;
				}
				else if (i == 9)
				{
					if (!vertical)
					{
						randomY = Math.random() * 10;
						randomX = Math.random() * 4;
					}
					else
					{
						randomY = Math.random() * 4;
						randomX = Math.random() * 10;
					}
					length = 6;
				}
				
				TileVector[randomY][randomX].name = "1";
				
				if (vertical)
				{
					for (var j:int = 0; j < length; j++) 
					{
						TileVector[randomY++][randomX].name = "1";
					}
				}
				else if (!vertical)
				{
					for (var p:int = 0; p < length; p++) 
					{
						TileVector[randomY][randomX++].name = "1";
					}
				}
			}
		}
	}
}