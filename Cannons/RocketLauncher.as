package
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	public class RocketLauncher extends MovieClip
	{
		public var type:String;
		private var cooldown:int;
		private var time:int;
		var xPos;
		var yPos
		var Online;
		function RocketLauncher(_x,_y,Type)
		{
			stop();
			this.buttonMode = true;
			cooldown = 45;
			Online = true;
			x = Math.round(_x);
			y = Math.round(_y);
			type = Type;
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			addEventListener(Event.ENTER_FRAME,enterFrame);
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}
		function onClick(e:MouseEvent)
		{
			FakeCannon.DragOn(this,type);
		}
		public function enterFrame(e:Event)
		{
			if(time == 20)
			{
				play();
			}
			if(currentFrame == 17)
			{
				Sounds.NewSound("rocketLauncherSFX");
			}
			if(currentFrame == totalFrames)
			{
				gotoAndStop(1)
			}
			time++;

			if(time >= cooldown)
			{
				ShootBullet();
				time = 0;
				
			}
		}
		public function ShootBullet()
		{
			
			Game.NewBullet(x,y-50,type,999);
		}
		public function remove()
		{
			removeEventListener(Event.ENTER_FRAME,enterFrame);
			removeEventListener(MouseEvent.CLICK, onClick);
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
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			Online = true;
			alpha = 1;
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		public function Pause()
		{
			removeEventListener(MouseEvent.MOUSE_UP, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			addEventListener(MouseEvent.MOUSE_UP, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}