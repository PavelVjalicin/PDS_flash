package
{
	import flash.display.MovieClip;
	import flash.events.Event;
		public class BigBullet extends MovieClip
	{
		var Removed:Boolean;
		private const speed:int = 4;
		private var damage:int;
		private var xPos;
		private var yPos;
		private var i:int;
		private var explTrigger:int;
		private const speedConst = speed/Math.sqrt(2);
		public function BigBullet(_x,_y):void
		{
			Removed = false;
			x=_x;
			y=_y;
			explTrigger = 60;
			damage = 16;
			addEventListener("enterFrame",enterFrame);
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
							var dmg:int = this.damage;
							this.damage -= grid[q+2][w+2][i].health;
							grid[q+2][w+2][i].Damage(dmg,this.x,this.y);
							dmg = 0;
							Game.NewBulletParticle(this.x,this.y,1);
							if(this.damage < 1)
							{
								remove();
							}
							SpawnSmallBullets();
							break;
						}
					}
				}
			}
		}
		public function enterFrame(e:Event):void
		{
			i++;
			if(i>explTrigger)
			{
				SpawnSmallBullets()
			}
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			CheckGridCollision(xPos,yPos);
			y -= speed;
			if(y < 0)
			{
				remove();
			}
		}
		public function remove():void
		{
			
			
			
			if(Removed == false)
			{
				Sounds.NewSound("spreadCannonSplitSFX");
				Game.NewBulletParticle(x,y,5);
				removeEventListener("enterFrame",enterFrame);
				parent.removeChild(this);
				Removed = true;
			}
		}
		private function SpawnSmallBullets()
		{
			damage = Math.floor(damage/2);
			if(damage > 0)
				Game.NewSmallBullet(x,y,0,speed);
			if(damage > 1)
				Game.NewSmallBullet(x,y,0,-speed);
			if(damage > 2)
			Game.NewSmallBullet(x,y,speed,0);
			if(damage > 3)
			Game.NewSmallBullet(x,y,-speed,0);
			if(damage > 4)
			Game.NewSmallBullet(x,y,speedConst,-speedConst);
			if(damage > 5)
			Game.NewSmallBullet(x,y,-speedConst,speedConst);
			if(damage > 6)
			
			Game.NewSmallBullet(x,y,speedConst,speedConst);
			if(damage > 7)
			Game.NewSmallBullet(x,y,-speedConst,-speedConst);
			remove();
			
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