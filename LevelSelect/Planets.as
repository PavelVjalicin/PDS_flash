package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class Planets extends MovieClip
	{
		public var level:int;
		public var type:int;
		public var Locked:Boolean;
		public var description:PlanetDescriptionMC;
		public var Difficulty;
		public static const unlockLevels:Array = [2,3,4,5,13,17,16,9,14,18,19,21,24]
		public var hitBox:MovieClip;
		public function spawn(Type,Level,difficulty)
		{
			hitBox.mc.alpha = 0;
			Difficulty = difficulty;
			info.text = "";
			level = Level;
			if(Main.LevelScore[Level] == 0)
			{
				Complete.visible = false;
				for(var i in unlockLevels)
				{
					if(level == unlockLevels[i])
					{
						info.text = "New weapon unlock!";
					}
				}
			}else{
				info.text = "Score: "+String(Main.LevelScore[level])
			}
			type = Type
			if(Main.levelUnlocks[level-1] == true)
			{
				gotoAndStop(type+1);
			}else{
				Locked = true;
				gotoAndStop(1)
			}
			if(Locked != true)
			{
				this.buttonMode = true;
				hitBox.addEventListener(MouseEvent.MOUSE_DOWN,onMouseUp);
				
				
			}
			hitBox.addEventListener(MouseEvent.MOUSE_OVER,onMouseRollOver);
			hitBox.addEventListener(MouseEvent.ROLL_OUT,onMouseRollOut);
			
		}
		private function onMouseRollOver(e:MouseEvent):void
		{
			
			if(description == null)
			{
				if(parent.x+x > 250)
				{
					description = new PlanetDescriptionMC(true,level,Difficulty);
					description.x = -50;
				}else{
					description = new PlanetDescriptionMC(false,level,Difficulty);
					description.x = 50;
				}
				
				description.y = 0
				parent.setChildIndex(this,parent.numChildren-1);
				hitBox.addChild(description);
			}else{
				if(description.description.currentFrame>40)
				{
					description.description.gotoAndPlay(Math.round(81-description.description.currentFrame))
					description.Active = true;
					return;
				}
			}
		}
		private function onMouseRollOut(e:MouseEvent):void
		{
			if(description != null)
			{
				description.Active=false;
			}
		}
		private function onMouseUp(e:MouseEvent)
		{
			/*addEventListener(Event.ENTER_FRAME,Animation);
			removeEventListener(MouseEvent.MOUSE_DOWN,onMouseUp);*/
			var levelSelect = parent.parent;
			Main.level = level;
			Main.PlanetType = type;
			levelSelect.spawnWeaponSelect();
			levelSelect.planet = this;
		}
		private function Animation(e:Event)
		{
			if(height < 1800)
			{
				height *=1.04;
				width *=1.04;
			}
			if(height < 900)
			{
				height *=1.04;
				width *=1.04;
			}
			var dx = 250-parent.x - x;
			var dy = 580-parent.y - y+850;
			var length = Math.sqrt( dx*dx + dy*dy );
			if(length > 40)
			{
				
				dx /= length; dy /= length;
				x += dx/40*length
				y += dy/40*length
			}
		}
	}
}