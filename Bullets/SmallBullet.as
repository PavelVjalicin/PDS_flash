package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class SmallBullet extends MovieClip
	{
		var Removed:Boolean;
		private var damage:int;
		private var xPos;
		private var yPos;
		private var xSpeed;
		private var ySpeed;
		public function SmallBullet(_x,_y,XSpeed,YSpeed):void
		{
			Removed = false;
			x=_x;
			y=_y;
			xSpeed = XSpeed;
			ySpeed = YSpeed;
			damage = 2;
			addEventListener("enterFrame",enterFrame);
			
		}
		public function CheckGridCollision(_x,_y)
		{
			var grid:Array = Game.grid;
			for(var q = _x-1;q<=_x+1;q++)
			{
				for(var w = _y-1;w<=_y;w++)
				{
					for(var i in grid[q+2][w+2])
					{
						if(grid[q+2][w+2][i].hitTestObject(this))
						{
							grid[q+2][w+2][i].Damage(damage,this.x,this.y);
							remove();
							break;
						}
					}
				}
			}
		}
		public function enterFrame(e:Event):void
		{
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			CheckGridCollision(xPos,yPos);
			y += ySpeed;
			x += xSpeed;
			if(x < 0)
			{
				remove();
			}
			else if(x>500)
			{
				remove();
			}
			else if(y<0)
			{
				remove();
			}
			else if (y>600)
			{
				remove();
			}
		}
		
		public function remove():void
		{
			if(Removed == false)
			{
				Game.NewBulletParticle(x,y,6);
				removeEventListener("enterFrame",enterFrame);
				parent.removeChild(this);
				Removed = true;
			}
		}
		public function Pause()
		{
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}