package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class AOECannon extends MovieClip
	{
		private var time:int;
		public var type:String;
		private var cooldown:int;
		var xPos;
		var yPos
		var Online;
		var damage:int = 3;
		var range;
		var rSpeed:Number;
		function AOECannon(_x,_y,Type)
		{
			glow.alpha = 0;
			rSpeed = 0;
			range = 150;
			hitBox.buttonMode = true;
			stop();
			cooldown = 30;
			Online = true;
			x = Math.round(_x);
			y = Math.round(_y);
			type = Type;
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			addEventListener(Event.ENTER_FRAME,enterFrame);
			hitBox.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			hitBox.addEventListener(MouseEvent.MOUSE_OVER,onRollOver);
			hitBox.addEventListener(MouseEvent.MOUSE_OUT,onRollOut);
		}
		function onClick(e:MouseEvent)
		{
			gotoAndStop(0);
			FakeCannon.DragOn(this,type);
		}
		function onRollOver(e:MouseEvent)
		{
			Game.range.x = this.x;
			Game.range.y = this.y;
			Game.range.height = range*2;
			Game.range.width = range*2;
		}
		function onRollOut(e:MouseEvent)
		{
			Game.range.x = 5000;
			Game.range.y = 5000;
		}
		public function enterFrame(e:Event)
		{
			glow.alpha +=0.03;
			if(rSpeed<15)
			{
				rSpeed +=0.5;
			}else{
				rSpeed = 15
			}
			copter.rotation += rSpeed;
			if(currentFrame == totalFrames)
			{
				gotoAndStop(1);
			}
			time++;
			if(time >= cooldown)
			{
				ShootBullet();
				time = 0;
			}
		}
		function CheckDistance(ax,ay,bx,by)
		{
			var dx=ax - bx
			var dy=ay - by
			var d:Number=Math.sqrt(dx*dx+dy*dy)
			return d;
		}
		public function ShootBullet()
		{
			glow.alpha = 0;
			getTargets();
			gotoAndPlay(2);
			Sounds.NewSound("aoeCannonSFX");
			
			
		}
		public function getTargets()
		{
			var _x = xPos
			var _y = yPos
			var Distance:int;
			var grid:Array = Game.grid;
			for(var q = _x+2;q>=_x-2;q--)
			{
				for(var w = _y+2;w>=_y-2;w--)
				{
					for(var i in grid[q+2][w+2])
					{
						Distance = CheckDistance(grid[q+2][w+2][i].x,grid[q+2][w+2][i].y,this.x,this.y);
						if(Distance < range)
						{
							grid[q+2][w+2][i].Damage(damage,grid[q+2][w+2][i].x,grid[q+2][w+2][i].y);
						}
					}
				}
			}
		}
		public function remove()
		{
			
			var cannons:Array = Game.cannons;
			for(var i in cannons)
			{
				if(cannons[i] == this)
				{
					
					cannons.splice(i,1);
					break;
				}
			}
			removeEventListener(Event.ENTER_FRAME,enterFrame);
			hitBox.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			parent.removeChild(this);
		}
		function GoOffline()
		{
			
			Online = false;
			alpha = 0.50;
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		function GoOnline()
		{
			rSpeed = 0;
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			Online = true;
			alpha = 1;
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		public function Pause()
		{
			stop();
			hitBox.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			if(currentFrame!= 1)
			{
				play();
			}
			hitBox.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}