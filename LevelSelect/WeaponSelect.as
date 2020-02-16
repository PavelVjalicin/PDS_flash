package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class WeaponSelect extends MovieClip
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
		public static var BlockedWeapons:Array = [];
		public function WeaponSelect()
		{
			
			batBox.gotoAndStop(2);
			genBox.gotoAndStop(2);
			pBox.gotoAndStop(2);
			for(var i in Main.secondaryWeaponsUnlocked)
			{
				if(Main.secondaryWeaponsUnlocked[i] == "Battery")
				{
					batBox.gotoAndStop(1);
				}
				if(Main.secondaryWeaponsUnlocked[i] == "SolarPanel")
				{
					genBox.gotoAndStop(1);
				}
				if(Main.secondaryWeaponsUnlocked[i] == "Platform")
				{
					pBox.gotoAndStop(1);
				}
			}
			WeaponInfo.gotoAndStop(1);
			Warning.alpha = 0;
			Levels.BlockWeapons(Main.level);
			CreateActiveBoxes(4)
			CreatePassiveBoxes(12)
			addEventListener(Event.ENTER_FRAME,enterFrame);
			addEventListener(MouseEvent.MOUSE_DOWN,onBoxPress);
			go.addEventListener(MouseEvent.MOUSE_DOWN,Go);
			back.addEventListener(MouseEvent.MOUSE_DOWN,Return);
			go.buttonMode = true;
			back.buttonMode = true;
			var slots = Weapons.WeaponSlots;
			if(slots!=null)
			{
				ActiveBoxes[0].type = slots[1];
				ActiveBoxes[0].gotoAndStop(ActiveBoxes[0].type);
				ActiveBoxes[1].type = slots[2];
				ActiveBoxes[1].gotoAndStop(ActiveBoxes[1].type);
				ActiveBoxes[2].type = slots[3];
				ActiveBoxes[2].gotoAndStop(ActiveBoxes[2].type);
				ActiveBoxes[3].type = slots[4];
				ActiveBoxes[3].gotoAndStop(ActiveBoxes[3].type);
				for(var o in PassiveBoxes)
				{
					if(PassiveBoxes[o].type == ActiveBoxes[0].type)
					{
						PassiveBoxes[o].alpha =0.5;
						PassiveBoxes[o].Add.alpha = 0;
					}
					if(PassiveBoxes[o].type == ActiveBoxes[1].type)
					{
						PassiveBoxes[o].alpha =0.5;
						PassiveBoxes[o].Add.alpha = 0;
					}
					if(PassiveBoxes[o].type == ActiveBoxes[2].type)
					{
						PassiveBoxes[o].alpha =0.5;
						PassiveBoxes[o].Add.alpha = 0;
					}
					if(PassiveBoxes[o].type == ActiveBoxes[3].type)
					{
						PassiveBoxes[o].alpha =0.5;
						PassiveBoxes[o].Add.alpha = 0;
					}
				}
			}
			
		}
		function enterFrame(e:Event)
		{
			for(var mvp in PassiveBoxes)
			{
				if(PassiveBoxes[mvp].Locked == false)
				if(PassiveBoxes[mvp].hitTestPoint(mouseX,mouseY,true))
				{
					WeaponInfo.gotoAndStop(PassiveBoxes[mvp].type);
				}
			}
			if(genBox.currentFrame == 1)
			if(genBox.hitTestPoint(mouseX,mouseY,true))
			{
				WeaponInfo.gotoAndStop("SolarPanel");
			}
			if(pBox.currentFrame == 1)
			if(pBox.hitTestPoint(mouseX,mouseY,true))
			{
				WeaponInfo.gotoAndStop("Platform");
			}
			if(batBox.currentFrame == 1)
			if(batBox.hitTestPoint(mouseX,mouseY,true))
			{
				WeaponInfo.gotoAndStop("Battery");
			}
			Warning.alpha -= 0.01;
			for(var uk in ActiveBoxes)
			{
				if(ActiveBoxes[uk].type != "Empty")
				{
					ActiveBoxes[uk].buttonMode = true;
					ActiveBoxes[uk].Cancel.alpha= 1
				}else{
					ActiveBoxes[uk].buttonMode = false;
					ActiveBoxes[uk].Cancel.alpha = 0;
				}
			}
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
		public function Return(e:MouseEvent)
		{
			var main = Main.main;
			if(parent != main)
			{
				var levelSelect = parent;
				levelSelect.resume();
				remove();
			}else{
				main.SpawnLevelSelect();
				main.changeSong("MainMenuSong");
				remove();
			}
		}
		public function CreatePassiveBoxes(index)
		{
			for(var i = 1;i <= index; i++)
			{
				var PassiveBox:MovieClip = new WeaponSelectBox();
				PassiveBox.buttonMode = true;
				if(i<7)
				{
					
					PassiveBoxes.push(PassiveBox);
					PassiveBox.x = 8 + (i-1) * (80);
					PassiveBox.y = 200;
					PassiveBox.type = TestWeaponSelect["Slot"+i];
					
					for(var o in Main.weaponsUnlocked)
					{
						if(PassiveBox.type == Main.weaponsUnlocked[o])
						{
							PassiveBox.buttonMode = true;
							PassiveBox.gotoAndStop(TestWeaponSelect["Slot"+i]);
							PassiveBox.Locked = false;
							PassiveBox.Add.alpha = 1;
							for (var w in BlockedWeapons)
							{
								
								if(BlockedWeapons[w] == WeaponSelect["Slot"+i])
								{
									PassiveBox.Locked = true;
									PassiveBox.gotoAndStop("Blocked");
									PassiveBox.buttonMode = false;
									PassiveBox.Add.alpha = 0;
									break;
								}
							}
							
							break;
						}
						PassiveBox.gotoAndStop("Locked");
						PassiveBox.buttonMode = false;
					}
					
					addChild(PassiveBox);
					PassiveBox = null;
				}else{
					PassiveBoxes.push(PassiveBox);
					PassiveBox.x = 8 + (i-7) * (80);
					PassiveBox.y = 280;
					PassiveBox.type = TestWeaponSelect["Slot"+i];
					for(var p in Main.weaponsUnlocked)
					{
						if(PassiveBox.type == Main.weaponsUnlocked[p])
						{
							PassiveBox.buttonMode = true;
							PassiveBox.gotoAndStop(TestWeaponSelect["Slot"+i]);
							PassiveBox.Locked = false;
							PassiveBox.Add.alpha = 1;
							for (var n in BlockedWeapons)
							{
								
								if(BlockedWeapons[n] == WeaponSelect["Slot"+i])
								{
									PassiveBox.Locked = true;
									PassiveBox.gotoAndStop("Blocked");
									PassiveBox.buttonMode = false;
									PassiveBox.Add.alpha = 0;
									break;
								}
							}
							break;
						}
						PassiveBox.gotoAndStop("Locked");
						PassiveBox.buttonMode = false;
					}
					addChild(PassiveBox);
					PassiveBox = null;
				}
			}
		}
		public function Go(e:MouseEvent)
		{
			var main = Main.main;
			if(parent != main)
			{
				if(ActiveBoxes[0].type!="Empty")
				{
					
					Game.WeaponSlots = [1,ActiveBoxes[0].type,ActiveBoxes[1].type,ActiveBoxes[2].type,ActiveBoxes[3].type];
					//main.NewGame(Main.level);
					var levelSelect = parent;
					levelSelect.StartAnimation();
					//levelSelect.remove();
					remove();
					main.changeSong("ChangeSong");
				}
			}else{
				if(ActiveBoxes[0].type!="Empty")
				{
					Game.WeaponSlots = [1,ActiveBoxes[0].type,ActiveBoxes[1].type,ActiveBoxes[2].type,ActiveBoxes[3].type];
					main.NewGame(Game.level);
					remove();
				}
			}
			
			Warning.alpha = 1;
		}
		public function onBoxPress(e:MouseEvent)
		{
			for(var i in PassiveBoxes)
			{
				if(PassiveBoxes[i].hitTestPoint(stage.mouseX,stage.mouseY))
				{
					if(PassiveBoxes[i].alpha == 1)
					{
						if(PassiveBoxes[i].Locked == false)
						{
							for(var q in ActiveBoxes)
							{
								
								
								if(ActiveBoxes[q].type == "Empty")
								{
									if(ActiveBoxes[q].type!= PassiveBoxes[i].type)
									{
										PassiveBoxes[i].alpha =0.5;
										PassiveBoxes[i].Add.alpha = 0;
										ActiveBoxes[q].type = PassiveBoxes[i].type;
										ActiveBoxes[q].gotoAndStop(ActiveBoxes[q].type);
										return;
									}
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
							PassiveBoxes[o].Add.alpha = 1;
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
			var main = Main.main;
			main.weaponSelect = null;
			removeEventListener(Event.ENTER_FRAME,enterFrame);
			go.removeEventListener(MouseEvent.MOUSE_DOWN,Go);
			back.removeEventListener(MouseEvent.MOUSE_DOWN,Return);
			removeEventListener(MouseEvent.MOUSE_DOWN,onBoxPress);
			PassiveBoxes = null;
			ActiveBoxes = null;
			while(this.numChildren > 0)
			{
				removeChild(getChildAt(0));
			}
			parent.removeChild(this);
		}
	}
}