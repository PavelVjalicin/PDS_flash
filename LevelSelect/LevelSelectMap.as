package
{
	import flash.display.MovieClip;
	public class LevelSelectMap extends MovieClip
	{
		var LevelNumber:int = 28
		public function LevelSelectMap()
		{
			for(var i=1;i<LevelNumber+1;i++)
			{
				if(i == 1)
				{
					this["planet"+i].spawn(3,i,1)
				}
				if(i == 2)
				{
					this["planet"+i].spawn(7,i,2)
				}
				if(i == 3)
				{
					this["planet"+i].spawn(1,i,2)
				}
				if(i == 4)
				{
					this["planet"+i].spawn(6,i,2)
				}
				if(i == 5)
				{
					this["planet"+i].spawn(3,i,3)
				}
				if(i == 6)
				{
					this["planet"+i].spawn(7,i,3)
				}
				if(i == 7)
				{
					this["planet"+i].spawn(2,i,3)
				}
				if(i == 8)
				{
					this["planet"+i].spawn(2,i,2)
				}
				if(i == 9)
				{
					this["planet"+i].spawn(6,i,4)
				}
				if(i == 10)
				{
					this["planet"+i].spawn(1,i,5)
				}
				if(i == 11)
				{
					this["planet"+i].spawn(6,i,4)
				}
				if(i == 12)
				{
					this["planet"+i].spawn(1,i,4)
				}
				if(i == 13)
				{
					this["planet"+i].spawn(2,i,5)
				}
				if(i == 14)
				{
					this["planet"+i].spawn(7,i,6)
				}
				if(i == 15)
				{
					this["planet"+i].spawn(6,i,6)
				}
				if(i == 16)
				{
					this["planet"+i].spawn(4,i,7)
				}
				if(i == 17)
				{
					this["planet"+i].spawn(5,i,7)
				}
				if(i == 18)
				{
					this["planet"+i].spawn(6,i,7)
				}
				if(i == 19)
				{
					this["planet"+i].spawn(3,i,7)
				}
				if(i == 20)
				{
					this["planet"+i].spawn(5,i,7)
				}
				if(i == 21)
				{
					this["planet"+i].spawn(2,i,8)
				}
				if(i == 22)
				{
					this["planet"+i].spawn(5,i,8)
				}
				if(i == 23)
				{
					this["planet"+i].spawn(4,i,9)
				}
				if(i == 24)
				{
					this["planet"+i].spawn(7,i,9)
				}
				if(i == 25)
				{
					this["planet"+i].spawn(7,i,9)
				}
				if(i == 26)
				{
					this["planet"+i].spawn(2,i,10)
				}
				if(i == 27)
				{
					this["planet"+i].spawn(3,i,10)
				}
				if(i == 28)
				{
					this["planet"+i].spawn(3,i,11)
				}
			}
		}
		
	}
}