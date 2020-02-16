package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class SniperBullet extends MovieClip
	{
		var Removed:Boolean;
		private const speed:int = 25;
		private var xSpeed:Number;
		private var ySpeed:Number;
		private var damage:int;
		private var xPos;
		private var yPos;
		private var Angle;
		private var lifeTime;
		private var life;
		public function SniperBullet(_x,_y,angle):void
		{
			Removed = false;
			x=_x;
			y=_y;
			rotation = -angle;
			Angle = angle;
			damage = 1;
			addEventListener("enterFrame",enterFrame);
			xSpeed = Math.sin(Angle*Math.PI/180)*speed;
			ySpeed = Math.cos(Angle*Math.PI/180)*speed;
		}
		
		public function CheckGridCollision(_x,_y)
		{
			var grid:Array = Game.grid;
			for(var q = _x-1;q<=_x+1;q++)
			{
				for(var w = _y-1;w<=_y+1;w++)
				{
					for(var i in grid[q+2][w+2])
					{
						if(grid[q+2][w+2][i].hitTestObject(this))
						{
							grid[q+2][w+2][i].Damage(damage,this.x,this.y);
							Game.NewBulletParticle(this.x,this.y,1);
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
			if(y < 0)
			{
				remove();
			}
			if(y > 600)
			{
				remove();
			}
			if(x < 0)remove();
			if(x > 500)remove();
		}
		public function remove():void
		{
			if(Removed == false)
			{
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