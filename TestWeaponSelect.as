package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class TestWeaponSelect extends MovieClip
	{
		public var PassiveBoxes:Array = new Array(); 
		public var ActiveBoxes:Array = new Array(); 
		public static var Slot1:String = "HomingLaser";
		public static var Slot2:String = "Cannon";
		public static var Slot3:String = "SniperCannon";
		public static var Slot4:String = "SpreadCannon";
		public static var Slot5:String = "Laser";
		public static var Slot6:String = "HomingCannon";
		public static var Slot7:String = "AOECannon";
		public static var Slot8:String = "RocketLauncher";
		public static var Slot9:String = "ChargingLaser";
		public static var Slot10:String = "FlakCannon";
		public static var Slot11:String = "EnergyPrison";
		public static var Slot12:String = "Shield";
		public function TestWeaponSelect()
		{
			
			CreateActiveBoxes(4)
			CreatePassiveBoxes(12)
			addEventListener(MouseEvent.MOUSE_UP,onBoxPress);
			go.addEventListener(MouseEvent.MOUSE_UP,Go);
		}
		public function CreateActiveBoxes(index)
		{
			for(var i = 1;i <= index; i++)
			{
				var ActiveBox:MovieClip = new WeaponSelectBox();
				ActiveBoxes.push(ActiveBox);
				ActiveBox.x = 8 + (i-1) * (80);
				ActiveBox.y = 70;
				ActiveBox.type = "Empty";
				ActiveBox.gotoAndStop("Empty");
				addChild(ActiveBox);
				ActiveBox = null;
			}
		}
		public function CreatePassiveBoxes(index)
		{
			for(var i = 1;i <= index; i++)
			{
				var PassiveBox:MovieClip = new WeaponSelectBox();
				if(i<7)
				{
					
					PassiveBoxes.push(PassiveBox);
					PassiveBox.x = 8 + (i-1) * (80);
					PassiveBox.y = 200;
					PassiveBox.type = TestWeaponSelect["Slot"+i];
					PassiveBox.gotoAndStop(TestWeaponSelect["Slot"+i]);
					addChild(PassiveBox);
					PassiveBox = null;
				}else{
					PassiveBoxes.push(PassiveBox);
					PassiveBox.x = 8 + (i-7) * (80);
					PassiveBox.y = 280;
					PassiveBox.type = TestWeaponSelect["Slot"+i];
					PassiveBox.gotoAndStop(TestWeaponSelect["Slot"+i]);
					addChild(PassiveBox);
					PassiveBox = null;
				}
			}
		}
		public function Go(e:MouseEvent)
		{
			if(ActiveBoxes[0].type!="Empty")
			{
				var main = Main.main;
				Game.WeaponSlots = [1,ActiveBoxes[0].type,ActiveBoxes[1].type,ActiveBoxes[2].type,ActiveBoxes[3].type];
				main.NewGame(Level.text);
				
				remove();
			}
		}
		public function onBoxPress(e:MouseEvent)
		{
			for(var i in PassiveBoxes)
			{
				if(PassiveBoxes[i].hitTestPoint(stage.mouseX,stage.mouseY))
				{
					if(PassiveBoxes[i].alpha == 1)
					{
						for(var q in ActiveBoxes)
						{
							
							
							if(ActiveBoxes[q].type == "Empty")
							{
								if(ActiveBoxes[q].type!= PassiveBoxes[i].type)
								{
									PassiveBoxes[i].alpha =0.5;
									ActiveBoxes[q].type = PassiveBoxes[i].type;
									ActiveBoxes[q].gotoAndStop(ActiveBoxes[q].type);
									return;
								}
							}
						}
					}
				}
			}
			for (i in ActiveBoxes)
			{
				if(ActiveBoxes[i].hitTestPoint(stage.mouseX,stage.mouseY))
				{
					for(var o in PassiveBoxes)
					{
						if(PassiveBoxes[o].type == ActiveBoxes[i].type)
						{
							PassiveBoxes[o].alpha = 1;
						}
					}
						
					for(var x=0;x<3-i;x++)
					{
						
						ActiveBoxes[i+x].type = ActiveBoxes[i+x+1].type;
						ActiveBoxes[i+x].gotoAndStop(ActiveBoxes[i+x].type);
						
						
					}
					ActiveBoxes[3].type = "Empty"
					ActiveBoxes[3].gotoAndStop("Empty");
				}
			}
		}
		public function remove()
		{
			removeEventListener(MouseEvent.MOUSE_UP,onBoxPress);
			PassiveBoxes = null;
			ActiveBoxes = null;
			while(this.numChildren > 0)
			{
				removeChild(getChildAt(0));
			}
		}
	}
}