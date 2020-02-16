package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Enemy extends MovieClip
	{
		var stunned:Boolean;
		var stunTime:int;
		var isStunnable:Boolean = true;
		var stunnedTime:int= 30;
		public function Stun(time)
		{
			return stunTime = stunnedTime,stunned = true;
		}
		
	}
}