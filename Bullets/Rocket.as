package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.*;
	public class Rocket extends MovieClip
	{
		var Removed:Boolean;
		private const speed:Number = 6;
		public var xSpeed:Number =0;
		public var ySpeed:Number=0;
		var rSpeed:Number = 1;
		private var damage:int;
		private var xPos;
		private var yPos;
		var Target:MovieClip;
		var time:int;
		var cooldown:int;
		var removeTime:int;
		private const priority:Array = ["[object MotherShip]","[object Carrier]","[object SuperHeavy]","[object HeavyShip]",
										"[object InvisibleShip]","[object Trickster]","[object Teleporter]","[object Bomber]",
										"[object MediumShip]","[object LightShip]","[object Asteroid]","[object ClusterUnit]"];
		

		public function Rocket(_x,_y):void
		{
			removeTime = 150;
			time = 0;
			cooldown = 30;
			Removed = false;
			x=_x;
			y=_y;
			
			damage = 10;
			addEventListener("enterFrame",enterFrame);
		}
		public function CheckCollision()
		{
			if(Target.hitTestPoint(this.x,this.y,true))
			{
				Target.Damage(damage,this.x,this.y);
				remove()
				return;
			}
		}
		
		public function enterFrame(e:Event):void
		{
			removeTime --;
			if(removeTime == 0)
			{
				remove();
			}
			x += xSpeed;
			y += ySpeed;
			time ++;
			if(time >= cooldown)
			{
				Target = null;
				GetTarget();
				time = 0;
			}
			if(Target == null)
			{
				GetTarget()
				xSpeed = Math.sin(rotation*Math.PI/180)*speed;
				ySpeed = -Math.cos(rotation*Math.PI/180)*speed;
			}else{
				CheckCollision();
				ChaseTarget(Target);
			}
			if(y < -100)
			{
				remove();
			}
			if(y > 700)
			{
				remove();
			}
			if(x<-100)remove();
			if(x>600)remove();
		}
		function GetTarget()
		{
			var grid:Array = Game.grid;
			for(var q in priority)
			{
				for(var _y=9;_y>0;_y--)
				{
					for(var _x in grid)
					{
					
						
						for(var i in grid[_x][_y])
						{
							if(String(grid[_x][_y][i])==priority[q])
							{
								Target = grid[_x][_y][i];
								return;
							}
						}
					}
				}
			}
			Target = null;
			return;
		}
		function CheckDistance(ax,ay,bx,by)
		{
			var dx=ax - bx
			var dy=ay - by
			var d:Number=Math.sqrt(dx*dx+dy*dy)
			return d;
		}
		


		function ChaseTarget(target:MovieClip) {
			
			//calculate distance between follower and target
			var distanceX:Number = target.x-x;
			var distanceY:Number = target.y-y;
			
			//get total distance as one number
			var distanceTotal = Math.sqrt(distanceX*distanceX+distanceY*distanceY);
			
			//check if target is within agro range
				//calculate how much to move
			var moveDistanceX:Number = rSpeed*distanceX/distanceTotal;
			var moveDistanceY:Number = rSpeed*distanceY/distanceTotal;
			
			//increase current speed
			xSpeed += moveDistanceX;
			ySpeed += moveDistanceY;
			
			//get total move distance
			var totalmove = Math.sqrt(xSpeed*xSpeed+ySpeed*ySpeed);
			
			//apply easing
			xSpeed = speed*xSpeed/totalmove;
			ySpeed = speed*ySpeed/totalmove;
			//move follower
			
			
			//rotate follower toward target
			rotation = 180*Math.atan2(ySpeed, xSpeed)/Math.PI+90;
		}
		public function remove():void
		{
			if(Removed == false)
			{
				Game.NewBulletParticle(this.x,this.y,3);
				removeEventListener("enterFrame",enterFrame);
				parent.removeChild(this);
				Removed = true;
			}
		}
		public function Pause()
		{
			stop();
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			if(currentFrame != 1)
			{
				play();
			}
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}