package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class PlanetDescriptionMC extends MovieClip
	{
		public var Active:Boolean = true;
		public var level:int;
		public var Difficulty;
		function PlanetDescriptionMC(reversed,Level,difficulty)
		{
			Difficulty = difficulty;
			level = Level;
			if(reversed == true)
			{
				gotoAndStop(2);
			}else{
				gotoAndStop(1);
			}
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		function onEnterFrame(e:Event):void
		{
			if(description.MissionText.Difficulty!=null)
			{
				description.MissionText.Difficulty.gotoAndStop(Difficulty);
			}
			description.MissionText.Name.text = Levels.LevelDescription(level);
			
			if(description.currentFrame < 41)
			{
				if(Active == false)
				{
					description.gotoAndPlay(80-description.currentFrame);
				}
			}
			if(description.currentFrame == 41)
			{
				if(Active == true)
				{
					description.stop();
				}else{
					description.play();
				}
			}
			if(description.currentFrame == description.totalFrames)
			{
				var i = parent.parent;
				i.description = null;
				removeEventListener(Event.ENTER_FRAME,onEnterFrame);
				parent.removeChild(this);
			}
		}
	}
}