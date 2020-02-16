package
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class HomingLaser extends MovieClip
	{
		private var angle:int;
		public var type:String;
		private var cooldown:int;
		public var turret:MovieClip;
		private var time:int;
		var xPos;
		var yPos
		var Online;
		var Target:Object;
		var damage = 2;
		var laserTime:int;
		var laser:Shape;
		var range:int;
		function HomingLaser(_x,_y,Type)
		{
			this.buttonMode = true;
			turret.gotoAndStop(14);
			range = 150;
			cooldown = 22;
			Online = true;
			x = Math.round(_x);
			y = Math.round(_y);
			type = Type;
			angle = 180;
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			addEventListener(Event.ENTER_FRAME,enterFrame);
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener(MouseEvent.MOUSE_OVER,onRollOver);
			addEventListener(MouseEvent.MOUSE_OUT,onRollOut);
		}
		function onClick(e:MouseEvent)
		{
			FakeCannon.DragOn(this,type);
		}
		public function onRollOver(e:MouseEvent)
		{
			Game.range.x = this.x;
			Game.range.y = this.y;
			Game.range.height = range*2;
			Game.range.width = range*2;
		}
		public function onRollOut(e:MouseEvent)
		{
			Game.range.x = 5000;
			Game.range.y = 5000;
		}
		public function enterFrame(e:Event)
		{
			if(turret.currentFrame == 14)
			{
				turret.stop();
			}
			laserTime ++;
			time++;
			if(laser!=null)
			{
				if(laserTime > 2)
				{
					removeChild(laser);
					laser = null;
				}
			}
			if(time >= cooldown)
			{
				if(Target == null)
				{
					GetTarget();
				}else{
					ChangeAngle();
					laser = ShootBullet();
					time = 0;
				}
				
			}
		}
		function ChangeAngle()
		{
			var dx:Number = Target.x - this.x;
			var dy:Number = Target.y - this.y;
			var Angle:Number=  Math.atan2(dx,dy)/Math.PI*180;
			angle = Angle;
			turret.rotation = -angle-180;
		}
		function CheckDistance(ax,ay,bx,by)
		{
			var dx=ax - bx
			var dy=ay - by
			var d:Number=Math.sqrt(dx*dx+dy*dy)
			return d;
		}
		function GetTarget()
		{
			var _x = xPos
			var _y = yPos
			var Distance:int;
			var LowestDistance:int = 9999;
			var grid:Array = Game.grid;
			for(var q = _x+2;q>=_x-2;q--)
			{
				for(var w = _y+2;w>=_y-2;w--)
				{
					for(var i in grid[q+2][w+2])
					{
						Distance = CheckDistance(grid[q+2][w+2][i].x,grid[q+2][w+2][i].y,this.x,this.y);
						if(Distance<range)
						{
							if(Distance < LowestDistance)
							{
								LowestDistance = Distance;
								Target = grid[q+2][w+2][i];
								
							}
						}
					}
				}
			}
		}
		public function ShootBullet()
		{
			Game.NewBulletParticle(Target.x,Target.y,4);
			Sounds.NewSound("homingLaserSFX");
			turret.gotoAndPlay(1);
			var l = DrawLaser();
			Target.Damage(damage,Target.x,Target.y);
			Target = null;
			
			return l;
		}
		public function DrawLaser():Shape
		{
			laserTime = 0;
			var l:Shape = new Shape;
			addChild(l);
			l.x = turret.x+Math.sin((angle)*Math.PI/180)*25;
			l.y = turret.y+Math.cos((angle)*Math.PI/180)*25;
			l.graphics.lineStyle(1, 0xFF0000, 1);
			l.graphics.lineTo(Target.x-x, Target.y-y);
			
			return l;
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
			removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(MouseEvent.MOUSE_OVER,onRollOver);
			removeEventListener(MouseEvent.MOUSE_OUT,onRollOut);
			parent.removeChild(this);
		}
		function GoOffline()
		{
			turret.stop();
			Online = false;
			alpha = 0.50;
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		function GoOnline()
		{
			turret.gotoAndStop(14);
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			Online = true;
			alpha = 1;
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		public function Pause()
		{
			turret.stop();
			removeEventListener(MouseEvent.MOUSE_UP, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			turret.gotoAndStop(14);
			addEventListener(MouseEvent.MOUSE_UP, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}