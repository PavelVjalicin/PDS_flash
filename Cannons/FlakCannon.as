package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class FlakCannon extends MovieClip
	{
		private var time:int;
		public var interval:int;
		public var type:String;
		private var angle:int;
		var Online;
		function FlakCannon(_x,_y,Type)
		{
			turret.stop();
			this.buttonMode = true;
			Online = true;
			x = Math.round(_x);
			y = Math.round(_y);
			type = Type;
			interval = 10;
			time = 0;
			addEventListener(Event.ENTER_FRAME,enterFrame);
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}
		function ChangeAngle()
		{
			var dx:Number = stage.mouseX - this.x;
			var dy:Number = stage.mouseY - this.y;
			var Angle:Number=  Math.atan2(dx,dy)/Math.PI*180;
			angle = Angle;
		}
		function onClick(e:MouseEvent)
		{
			FakeCannon.DragOn(this,type);
		}
		public function enterFrame(e:Event)
		{
			if(turret.currentFrame == turret.totalFrames)turret.gotoAndStop(1);
			turret.rotation = -angle-180
			ChangeAngle();
			time++;
			if(time > interval)
			{
				ShootBullet();
				interval = Math.random()*8+4
				time = 0;
			}
		}
		public function ShootBullet()
		{
			turret.play();
			var _x = stage.mouseX + Math.random()*30-15;
			var _y = stage.mouseY + Math.random()*30-15;
			Game.NewBullet(_x,_y,type,0);
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
			removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			parent.removeChild(this);
		}
		function GoOffline()
		{
			turret.gotoAndStop(1);
			Online = false;
			alpha = 0.50;
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		function GoOnline()
		{
			Online = true;
			alpha = 1;
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		public function Pause()
		{
			turret.gotoAndStop(1);
			removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}