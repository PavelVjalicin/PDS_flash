package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class BulletParticle extends MovieClip
	{
		public var particle:MovieClip;
		private var type:int;
		public function BulletParticle(_x,_y,Type)
		{
			gotoAndStop(Type);
			var particle:MovieClip;
			x = _x
			y = _y
			rotation = Math.random()*360
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
		function enterFrame(e:Event)
		{
			if(particle.currentFrame == particle.totalFrames)
			{
				remove();
			}
		}
		public function remove()
		{
			removeEventListener("enterFrame",enterFrame);
			parent.removeChild(this);
					
		}
		public function Pause()
		{
			particle.stop();
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			particle.play();
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}