package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.net.SharedObject;
	import flash.display.Stage;
	public class Main extends MovieClip
	{
		
		public static var sharedObject:SharedObject;
		public static var optionsData = SharedObject.getLocal( "Options" );
		public static var sounds:Boolean;
		public static var menuMc:MovieClip = new MainMenu();
		public static var game:Game;
		public static var testWeaponSelect:TestWeaponSelect;
		public static var level:int;
		public static var levelUnlocks:Array;
		public static var weaponsUnlocked:Array;
		public static var secondaryWeaponsUnlocked:Array;
		public static var PlanetType:int;
		public static var Score:int;
		public static var LevelScore:Array;
		public static var music:Boolean;
		public static var gfx:Boolean;
		var levelSelect:MovieClip;
		var RestartTimer:int;
		var NextSong:String;
		var weaponSelect:MovieClip;
		var TimeNum;
		var fps;
		public static var main;
		/*function Loading(e:Event)
		{
			trace(this.stage.loaderInfo.bytesLoaded);
			if(this.stage.loaderInfo.bytesLoaded==this.stage.loaderInfo.bytesTotal)
			{
				Begin()
				removeEventListener(Event.ENTER_FRAME,Loading);
			}
		}*/
		function Sobject(object)
		{
			sharedObject = SharedObject.getLocal( object );
		}
		function Main(s:Stage)
		{
			main = this;
			game = null;
			
			RestartTimer = 0;
			//UnlockAll();
			//LoadData();
			LoadOptions();
			Sounds.StartMusic();
			if(music == false)
			{
				Sounds.StopMusic();
			}
			
			level = 1;
			//SpawnLevelSelect();
			//SpawnTestWeaponSelect()
            Fonts.Create();
			if(music == true)
			{
				addEventListener(Event.ENTER_FRAME,fadeIn)
			}
			
			addEventListener(Event.ENTER_FRAME,enterFrame);
			spawnMainMenu();
			Key.initialize(s);
			this.stop();
			//NewGame(1,"Cannon","HomingCannon","SpreadCannon","Laser");//level,weponsSlots1-4
			if(gfx == false)s.quality = "LOW";
		}
		public function ResetData()
		{
			sharedObject.data.levelUnlocks = [true,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false];
				sharedObject.data.weaponsUnlocked =["HomingLaser"];
				sharedObject.data.secondaryWeaponsUnlocked=[];
				LevelScore = [];
				for( var i=0;i<100;i++)
				{
					LevelScore[i] = 0;
				}
				sharedObject.data.LevelScore = LevelScore;
				LoadData();
		}
		public function LoadOptions()
		{
			if(optionsData.data.music == undefined)
			{
				optionsData.data.music = true;
				optionsData.data.sounds = true;
				optionsData.data.gfx = true;
			}
			gfx = optionsData.data.gfx;
			sounds = optionsData.data.sounds;
			music = optionsData.data.music;
		}
		
		public function LoadData()
		{
			if(sharedObject.data.levelUnlocks == undefined)
			{
				
				sharedObject.data.levelUnlocks = [true,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false,
													false,false,false,false,false];
				sharedObject.data.weaponsUnlocked =["HomingLaser"];
				sharedObject.data.secondaryWeaponsUnlocked=[];
				LevelScore = [];
				for( var i=0;i<100;i++)
				{
					LevelScore[i] = 0;
				}
				sharedObject.data.LevelScore = LevelScore;
				
			}
			
			levelUnlocks = sharedObject.data.levelUnlocks;
			weaponsUnlocked = sharedObject.data.weaponsUnlocked;
			secondaryWeaponsUnlocked = sharedObject.data.secondaryWeaponsUnlocked;
			LevelScore = sharedObject.data.LevelScore;
			
		}
		public function SaveOptions()
		{
			optionsData.data.gfx = gfx;
			optionsData.data.music = music;
			optionsData.data.sounds = sounds;
		}
		public function SaveData()
		{

			sharedObject.data.levelUnlocks=levelUnlocks;
			sharedObject.data.weaponsUnlocked=weaponsUnlocked;
			sharedObject.data.secondaryWeaponsUnlocked=secondaryWeaponsUnlocked;
			sharedObject.data.LevelScore = LevelScore;
		}
		public function SpawnLevelSelect()
		{
			

				if(game != null)
				{
					game.RemoveEverything()
					game = null;
					
				}
			
				levelSelect = new LevelSelect()
				addChild(levelSelect);
		}
		public function SpawnWeaponSelect()
		{
			if(weaponSelect == null)
			{
				weaponSelect = new WeaponSelect();
				addChild(weaponSelect);
			}
		}
		public function SpawnTestWeaponSelect()
		{
			testWeaponSelect = null;
			
			testWeaponSelect = new TestWeaponSelect();
			
			addChild(testWeaponSelect);
			
		}
		public function NewGame(Level)
		{
			if(game == null)
			{
				game = new Game(Level);
				//trace(System.totalMemory);
				addChild(game);
				//setChildIndex(TimeNum, numChildren - 1);
				//setChildIndex(fps, numChildren - 1);
				stage.focus= this;
			}else{
				game.RemoveEverything()
				game = new Game(Level);
				//trace(System.totalMemory);
				addChild(game);
				//setChildIndex(TimeNum, numChildren - 1);
				//setChildIndex(fps, numChildren - 1);
				stage.focus= this;
			}
		}
		public function enterFrame(e:Event)
		{
			if(Key.isDown(188)) //<
			{
				UnlockAll();
				levelSelect.remove();
				SpawnLevelSelect()
				stage.focus= this;
			}
			if(Key.isDown(190))// >
			{
				levelSelect.remove();
				ResetData();
				SpawnLevelSelect()
				stage.focus= this;
			}
			if(game != null)
			{
				if(Key.isDown(79))//o
				{
					
					game.ResumeAll();
					stage.focus= this;
				}
				if(Key.isDown(80))//p
				{
					
					game.PauseAll();
					stage.focus= this;
				}
				if(Key.isDown(27))//Esc
				{
					game.PauseAll();
					stage.focus= this;
				}
				if(Key.isDown(82))//r
				{
					RestartTimer ++;
					if(RestartTimer == 30)
					{
						game.RestartLevel();
						
						RestartTimer = 0;
						stage.focus= this;
					}
				}
			}
		}
		function onClick(e:MouseEvent)
		{
			//NewGame();
			removeMainMenu();
		}
		function spawnMainMenu()
		{
			var menuMc = new MainMenu();
			addChild(menuMc);
		}
		function UnlockAll()
		{
			levelUnlocks = [true,true,true,true,true,
												true,true,true,true,true,
												true,true,true,true,true,
												true,true,true,true,true,
												true,true,true,true,true,
												true,true,true,true,true];
			weaponsUnlocked=["HomingLaser","Cannon","SniperCannon","SpreadCannon","EnergyPrison","HomingCannon","RocketLauncher","AOECannon","ChargingLaser","FlakCannon","Laser","Shield"];
			secondaryWeaponsUnlocked=["Battery","SolarPanel","Platform"];
		}
		public function changeSong(name)
		{
			if(name == "MainMenuSong")
			{
				NextSong = "MainMenuSong";
			}else{
				NextSong = "Whatever"
			}
			addEventListener(Event.ENTER_FRAME,fadeOut);
			removeEventListener(Event.ENTER_FRAME,fadeIn);
		}
		public function fadeOut(e:Event)
		{
			if(Sounds.myTransform.volume > 0)
			{
				Sounds.myTransform.volume -= 0.03;
				Sounds.MusicChannel.soundTransform = Sounds.myTransform;
			}else{
				if(NextSong == "MainMenuSong")
				{
					Sounds.MainMenuSong();
				}else{
					Sounds.ChangeSong();
				}
				if(music == true)
				{
					addEventListener(Event.ENTER_FRAME,fadeIn)
				}
				
				removeEventListener(Event.ENTER_FRAME,fadeOut)
			}
		}
		public function fadeIn(e:Event)
		{
			
			if(Sounds.myTransform.volume < 1)
			{
				Sounds.myTransform.volume += 0.03;
				Sounds.MusicChannel.soundTransform = Sounds.myTransform;
			}else{
				removeEventListener(Event.ENTER_FRAME,fadeIn);
			}
		}
		function removeMainMenu()
		{
			removeChild(menuMc);
			menuMc.playButtonMc.removeEventListener(MouseEvent.MOUSE_UP,onClick);
		}
	}
}