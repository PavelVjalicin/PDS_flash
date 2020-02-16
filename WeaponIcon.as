package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.motion.Color;
	import flash.events.Event;
	public class WeaponIcon extends MovieClip
	{
		private var weaponNumber:int;
		public var delay:int;
		public var Ready:Boolean = false;
		public var delayMC:MovieClip;
		public var type:String;
		public var active:Boolean
		public function WeaponIcon(WeaponNumber,name,Active:Boolean)
		{
			this.buttonMode = true;
			active = Active;
			type = name;
			var anim:MovieClip;
			if(active == false) this.visible = false;
			
			
			gotoAndStop(2);
			
			
			
			for( var v in Game.WeaponCost[0])
			{
				if(type == Game.WeaponCost[0][v])
				{
					delay=Game.WeaponCost[1][v];
					break;
				}
			}
			
			cost.text = delay.toString();
			if(WeaponNumber == 21)
			{
				delay = Game.maxEnergy/2;
				cost.text = String(Game.maxEnergy/2);
			}
			if(WeaponNumber == 22)
			{
				delay = 50;
				cost.text = "50";
			}
			if(WeaponNumber == 23)
			{
				delay = 25;
				cost.text = "25";
			}
			weaponNumber = WeaponNumber;
			ChangeWeaponNumberText(weaponNumber);
			
			Icon.gotoAndStop(type);
			selectedFrame.visible = false;
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
		function ChangeWeaponNumberText(index)
		{
			if(index <= 20)
			{
				num.text = index.toString();
			}else{
				if(index == 21)
				{
					num.text = "Q";
				}
				if(index == 22)
				{
					num.text = "W";
				}
				if(index == 23)
				{
					num.text = "E";
				}
			}
		}
		function enterFrame(e:Event)
		{
			if(weaponNumber == 21)
			{
				delay = Game.maxEnergy/2;
				cost.text = String(Game.maxEnergy/2);
			}
			if(Ready == false)
			{
				select(false);
			}
			if(Game.energy >= delay)
			{
				Online();
				delayMC.scaleX = 1;
			}else{
				Offline();
				delayMC.scaleX = 1 - ((delay-Game.energy)/delay);
			}
		}
		function Online()
		{
			Ready = true;
			gotoAndStop(1);
			Icon.gotoAndStop(type);
			ChangeWeaponNumberText(weaponNumber);
		}
		public function Offline()
		{
			Ready = false;
			gotoAndStop(2);
			Icon.gotoAndStop(type);
			ChangeWeaponNumberText(weaponNumber);
		}
		public function select(index):void
		{
			if(index == true)
			{
				selectedFrame.visible = true;
				Icon.gotoAndStop(type);
			}else{
				selectedFrame.visible = false;
				Icon.gotoAndStop(type);
			}
		}
		public function onClick(e:MouseEvent)
		{
			if(active == true)
			{
				if(FakeCannon.Drag == false)
				{
					if(Ready == true)
					{
						
						Game.fakeCannon.WeaponSelect(weaponNumber);
					}
				}
			}
		}
		public function remove()
		{
			removeChild(anim);
			anim = null;
			removeChild(num);
			num = null;
			removeChild(Icon);
			Icon = null;
			removeChild(selectedFrame);
			selectedFrame = null;
			removeChild(delayMC);
			delayMC = null;
			removeEventListener(MouseEvent.CLICK, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
			parent.removeChild(this);
		}
		public function Pause()
		{
			
			anim.stop();
			removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			anim.play();
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}