package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class SniperCannon extends MovieClip
	{
		private var time:int;
		public var interval:int;
		public var type:String;
		private var angle:int;
		var Online;
		function SniperCannon(_x,_y,Type)
		{
			this.buttonMode = true;
			turret.gotoAndStop(3)
			Online = true;
			x = Math.round(_x);
			y = Math.round(_y);
			type = Type;
			interval = 6;
			time = interval;
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
			if(turret.currentFrame == 3)
			{
				turret.stop();
			}
			turret.rotation = -angle-180
			ChangeAngle();
			time++;
			if(time > interval)
			{
				ShootBullet();
				
				time = 0;
			}
		}
		public function ShootBullet()
		{
			turret.gotoAndPlay(1);
			Sounds.NewSound("weapon1SFX");
			Game.NewBullet(x,y,type,angle);
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
			turret.play();
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
			turret.play();
			addEventListener(MouseEvent.MOUSE_UP, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}