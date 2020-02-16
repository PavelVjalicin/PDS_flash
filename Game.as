package 
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName ;
	import flash.text.TextField;
	import flash.system.System;
	public class Game extends MovieClip
	{
		public static var levelEnd:int;
		public static var mainTextField:TextField;
		public static var tutorialTextField:TextField;
		public static var energyTimer:int;
		public static var energy:int;
		public static var maxEnergy:int;
		
		public static var planetHealth:Number;
		public static var planetHealthBar:MovieClip;
		
		public static var bulletsMc:MovieClip;
		public static var cannonsMc:MovieClip;
		public static var options:MovieClip;
		public static var enemiesMc:MovieClip;
		public static var particlesMc:MovieClip;
		public static var grid:Array;
		public static var bigPlanetMask:MovieClip;
		public static var energyTick:int;
		public static var fakeCannon:FakeCannon;
		public static var weaponsMc:Weapons;
		public static var cannons:Array;
		public static var bigPlanet:MovieClip;
		/*public static var gameScreenBitMapData:BitmapData=new BitmapData(500,600,true,0x00000000);
		public static var gameScreenBitMap:Bitmap=new Bitmap(gameScreenBitMapData);*/
		public static var impactBitMapData:BitmapData;
		public static var impactBitMap:Bitmap;
		public static var main;
		private var pauseScreen:MovieClip;
		public static var energyBar:EnergyBar;
		public static const WeaponName:Array  = [0,"HomingLaser","Cannon","SniperCannon","SpreadCannon","Laser","HomingCannon","AOECannon","RocketLauncher","ChargingLaser","EnergyPrison","FlakCannon","Shield"];
		public static const WeaponDelay:Array = [0,40,           90,      70            ,120           ,75            , 80          ,150,          150,              130  ,            45,         100,      90];
		//public static const WeaponDelay:Array = [0,0,           0,      0            ,0           ,0            , 0          ,0,          0,              0  ,            0,         0,      0];
		public static const WeaponCost:Array  = [WeaponName,WeaponDelay];
		public static const SpecialWeapon2Cost:int = 50;
		public static const SpecialWeapon3Cost:int = 25;
		public static var level:int;
		public var levelTimer:Array = new Array();
		public static var time:int;
		public static var EnergyAmount:int;
		public static var levelArray:Array;
		public static var WeaponSlots=[1,"Cannon","HomingCannon","SpreadCannon","Laser"];
		public static var platform:Array;
		public static var platformMc:MovieClip;
		public static var planetShield:Number;
		public static var range:MovieClip;
		public static var unlockedLevel:Array;
		public static var unlockedWeapon:String;
		public static var unlockedSecondaryWeapon:String;
		public static var Ended:Boolean;
		public static var placementArea:MovieClip;
		public static var backGround:MovieClip;
		public static var tutorial:MovieClip;
		public function Game(Level:int)
		{
			tutorial = null;
			Ended = false;
			unlockedLevel = null;
			unlockedWeapon = null;
			unlockedSecondaryWeapon = null;
			planetShield = 0;
			platform = [];
			EnergyAmount = 1;
			level = Level;
			energy = 50;
			EnergyAmount = 1;
			maxEnergy = 100;
			
			grid = [];
			cannons = [];
			planetHealthBar = new PlanetHealthBar();
			planetHealthBar.alpha = 0.5;
			backGround = new BackGround2();
			backGround.scaleX = 0.8;
			backGround.scaleY = 0.8;
			mainTextField = new TextField();
			tutorialTextField = new TextField();
			bulletsMc = new MovieClip();
			cannonsMc = new MovieClip();
			platformMc = new MovieClip();
			enemiesMc = new MovieClip();
			particlesMc = new MovieClip();
			range = new Range();
			range.x = 5000;
			range.y = 5000;
			bigPlanetMask = new BigPlanetMask();
			bigPlanet = new BigPlanet();
			bigPlanet.hitTest.visible = false;
			impactBitMapData=new BitmapData(500,600,true,0x00000000);
			impactBitMap=new Bitmap(impactBitMapData);
			
			energyBar =  new EnergyBar();
			
			
			mainTextField.defaultTextFormat = Fonts.textFormat;
			mainTextField.y = 300;
			mainTextField.width = 500;
			mainTextField.selectable = false;
			mainTextField.textColor = 0xFFFFFF;
			mainTextField.embedFonts = true;
			tutorialTextField.defaultTextFormat = Fonts.textFormat;
			tutorialTextField.y = 200;
			tutorialTextField.width = 500;
			tutorialTextField.selectable = false;
			tutorialTextField.textColor = 0xFFFFFF;
			tutorialTextField.embedFonts = true;
			addEventListener(Event.ENTER_FRAME,tutorialText);
			particlesMc.mouseEnabled = false;
			particlesMc.mouseChildren = false;
			mainTextField.mouseEnabled = false;
			tutorialTextField.mouseEnabled = false;
			planetHealthBar.mouseEnabled = false;
			planetHealthBar.mouseChildren = false;
			planetHealthBar.x = 250;
			planetHealthBar.y = 580;
			
			
			energyBar.x = 475;
			energyBar.y = 15;
			
			
			bigPlanet.y = 600;
			bigPlanet.x = 250;
			bigPlanet.cacheAsBitmap = true;
			
			bigPlanetMask.y = 600;
			bigPlanetMask.x = 250;
			bigPlanetMask.cacheAsBitmap = true;
			
			impactBitMap.mask = bigPlanetMask;
			fakeCannon  = new FakeCannon();
			fakeCannon.mouseEnabled = true;
			fakeCannon.mouseChildren = false;
			weaponsMc = new Weapons();
			NewGame();
			
			levelArray = Levels.TraceLevel(level,this);
		}
		public function tutorialText(e:Event)
		{
			tutorialTextField.alpha -= 0.001;
			if(tutorialTextField.alpha < 0)
			{
				removeEventListener(Event.ENTER_FRAME,tutorialText);
				removeChild(tutorialTextField);
				tutorialTextField = null;
			}
		}
		public function startTutorial()
		{
			tutorial = new Tutorial1();
			addChild(tutorial);
			tutorial.mouseChildren = false;
			tutorial.mouseEnabled = false;
			addEventListener(Event.ENTER_FRAME,tutorialFunction);
		}
		public function tutorialFunction(e:Event)
		{
			if(cannons[0]!= null)
			{
				removeChild(tutorial);
				tutorial = new Tutorial2();
				tutorial.x = cannons[0].x;
				tutorial.y = cannons[0].y;
				addChild(tutorial);
				tutorial.mouseChildren = false;
				tutorial.mouseEnabled = false;
				addEventListener(Event.ENTER_FRAME,tutorialFunction2);
				removeEventListener(Event.ENTER_FRAME,tutorialFunction);
			}
		}
		public function tutorialFunction2(e:Event)
		{
			if(FakeCannon.Drag == true)
			{
				removeChild(tutorial);
				removeEventListener(Event.ENTER_FRAME,tutorialFunction2);
				tutorial = null;
			}
		}
		public function enterFrame(e:Event)
		{
			if((Weapons.currentWeapon != 1) || (FakeCannon.Drag == true))
			{
				addPlacementArea();
			}else{
				removePlacementArea()
			}
			Game.planetHealthBar.ShieldBar.scaleX = Game.planetShield/1000;
			if(Ended == false)
			for(var q in levelArray["from"])
			{
				if(levelArray["from"][q] != -1)
				{
				
					if(time > levelArray["from"][q])
					{
						SpawnEnemyInterval(q,levelArray["enemy"][q],levelArray["interval"][q],levelArray["enemyX"][q],levelArray["enemyY"][q]);
					}
				}
			}
			for(q in levelArray["till"])
			{
				if(time > levelArray["till"][q])
				{
					RemoveFromLevelArray(q);
				}
			}
			if(energy<maxEnergy)
			{
				energyTimer ++;
				if(energyTimer > energyTick)
				{
					energy+=EnergyAmount;
					energyTimer = 0;
				}
			}else{
				energy = maxEnergy;
			}
			time++;
			if(Ended == false)
			if(time > levelEnd)
			{
				var UnlockedWeapon = "None";
				var UnlockedLevel = false;
				if(enemiesMc.numChildren < 1)
				{
					
					if(unlockedLevel!=null)
					{
						for(var p in unlockedLevel)
						{
							
							if(Main.levelUnlocks[unlockedLevel[p]-1]==false)
							UnlockedLevel = true;
							Main.levelUnlocks[unlockedLevel[p]-1]=true;
							
						}
						unlockedLevel = null;
						
					}
					
					if(unlockedWeapon!= null)
					{
						var duplicate = false;
						for(var i in Main.weaponsUnlocked)
						{
							if(Main.weaponsUnlocked[i]==unlockedWeapon)
							{
								duplicate = true;
							}
						}
						if(duplicate == false)
						{
							Main.weaponsUnlocked.push(unlockedWeapon);
							UnlockedWeapon = unlockedWeapon;
						}
					}
					if(unlockedSecondaryWeapon!= null)
					{
						var duplicate2 = false;
						for(var o in Main.secondaryWeaponsUnlocked)
						{
							if(Main.secondaryWeaponsUnlocked[o]==unlockedSecondaryWeapon)
							{
								duplicate2 = true;
							}
						}
						if(duplicate2 == false)
						{
							Main.secondaryWeaponsUnlocked.push(unlockedSecondaryWeapon);
							UnlockedWeapon = unlockedWeapon;
						}
					}
					
					var main = Main.main;
					
					if(Main.LevelScore[level] < planetHealth)
					{
						Main.LevelScore[level] = planetHealth;
						
					}
					var levelComplete:LevelComplete = new LevelComplete(UnlockedWeapon,UnlockedLevel);
					levelComplete.x = 250;
					levelComplete.y = 300;
					addChild(levelComplete)
					main.SaveData();
					Ended = true;
					unlockedLevel = null
					
				}
				
			}
			
			
			
			
		}
		public function RemoveFromLevelArray(index)
		{
			levelArray["from"][index] = -1;
			levelArray["till"][index] = -1;
			levelArray["interval"][index] = -1;
			levelArray["enemy"][index] = -1;
			levelArray["enemyX"][index] = -1;
			levelArray["enemyY"][index] = -1;
			levelTimer[index] = 0;
		}
		public function SpawnEnemyInterval(timer,enemy,interval,_x,_y)
		{
			if(levelTimer[timer] == undefined)
			{
				levelTimer[timer] = 0;
			}
			levelTimer[timer]++;

			if(levelTimer[timer] >= interval)
			{
				NewEnemy(_x,_y,enemy);
				levelTimer[timer] = 0;
			}
		}
		public function PauseAll()
		{
			if(pauseScreen == null)
			{
				pauseScreen = new PauseScreen();
				addChild(pauseScreen);
			}
			var c;
			removeEventListener(Event.ENTER_FRAME,enterFrame);
			fakeCannon.Pause();
			for(var i = 0;i<5;i++)
			{
				
				if(i == 0)
				{
					c = bulletsMc;
				}
				else if(i == 1)
				{
					c = cannonsMc;
				}
				else if(i == 2)
				{
					c = enemiesMc;
				}
				else if(i == 3)
				{
					
					c = weaponsMc;
					
				}
				else if(i == 4)
				{
					c = particlesMc;
				}
				if( c.numChildren > 0)
				{
					for(var q =0;q< c.numChildren;q ++)
					{
						var c2 = c.getChildAt(q)
						c2.Pause();
					}
				}
				c = null;
				c2 = null;
			}
		}
		public function ResumeAll()
		{
			if(pauseScreen!=null)
			{
				pauseScreen.remove();
			}
			pauseScreen = null;
			var c;
			addEventListener(Event.ENTER_FRAME,enterFrame);
			fakeCannon.Resume();
			for(var i = 0;i<5;i++)
			{
				
				if(i == 0)
				{
					c = bulletsMc;
				}
				else if(i == 1)
				{
					c = cannonsMc;
				}
				else if(i == 2)
				{
					c = enemiesMc;
				}
				else if(i == 3)
				{
					
					c = weaponsMc;
					
				}
				else if(i == 4)
				{
					c = particlesMc;
				}
				if( c.numChildren > 0)
				{
					for(var q =0;q< c.numChildren;q ++)
					{
						var c2 = c.getChildAt(q)
						c2.Resume();
					}
				}
				c = null;
				c2 = null;
			}
		}
		function RestartLevel()
		{
			var main = Main.main;
			main.SpawnWeaponSelect();
			Ended = true;
			/*RemoveEverything();
			main.NewGame(level);
			main = null;*/
			
		}
		function NewGame()
		{
			options = new OptionButton();
			
			options.x = 484;
			options.y = 115;
			options.buttonMode = true;
			options.addEventListener(MouseEvent.MOUSE_DOWN,optionsButton);
			enemiesMc.mouseEnabled = false;
			enemiesMc.mouseChildren = false;
			time = 0;
			planetShield = 0;
			energyTimer = 0;
			energyTick = 20;
			
			
			planetHealth = 1000;
			bigPlanet.gotoAndStop(Main.PlanetType);
			
			bigPlanetMask.gotoAndStop(Main.PlanetType);
			
			CreateGrid();
			addChild(backGround);
			addChild(bigPlanet);
			addChild(impactBitMap);
			//addChild(gameScreenBitMap);
			addChild(platformMc);
			addChild(bulletsMc);
			
			addChild(cannonsMc);
			addChild(range);
			addChild(enemiesMc);
			addChild(particlesMc);
			
			
			
			addChild(energyBar);
			addChild(planetHealthBar);
			
			addChild(weaponsMc);
			addChild(options);
			addChild(fakeCannon);
			
			
			
			
			addChild(mainTextField);
			addChild(tutorialTextField);
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		function optionsButton(e:MouseEvent)
		{
			PauseAll();
		}
		public static function ChangePlanetHealth(Damage)
		{
			Game.planetShield -= Damage;
			if(Game.planetShield < 0)
			{
				Game.planetHealth += Game.planetShield;
				Game.planetShield = 0;
			}
			
			if(Game.planetHealth <= 0)
			{
				Game.planetHealth = 0;
				Main.game.Failed();
			}
			Game.planetHealthBar.GreenBar.scaleX = Game.planetHealth/1000;
			
		}
		public function Failed()
		{
			Ended = true;
			var missionFailed:MissionFailed = new MissionFailed();
			missionFailed.x = 250;
			missionFailed.y = 300;
			addChild(missionFailed);
		}
		public function RemoveEverything()
		{
			var c;
			
			for(var i = 0;i<6;i++)
			{
				if(i == 0)
				{
					c = bulletsMc;
				}
				else if(i == 1)
				{
					c = cannonsMc;
				}
				else if(i == 2)
				{
					c = enemiesMc;
				}
				else if(i == 3)
				{
					
					c = weaponsMc;
					
				}
				else if(i == 4)
				{
					c = particlesMc;
				}
				else if(i == 5)
				{
					c = platformMc;
				}
				while(c.numChildren > 0)
				{
					var c2 = c.getChildAt(0)
					c2.remove();
				}
				if(c != weaponsMc)
				{
					removeChild(c);
				}else{
					c.remove();
				}
				c = null;
				c2 = null;
			}
			
			//gameScreenBitMapData.fillRect(gameScreenBitMapData.rect,0);
			//removeChild(gameScreenBitMap);
			platform = [];
			impactBitMapData.fillRect(impactBitMapData.rect,0);
			removeChild(impactBitMap);
			impactBitMap = null;
			cannons = [];
			grid = [];
			cannons = null;
			grid = null;
			fakeCannon.reset();
			fakeCannon.remove()
			fakeCannon = null;
			removeChild(backGround);
			backGround = null;
			removeChild(energyBar);
			energyBar = null;
			removeChild(planetHealthBar);
			planetHealthBar = null;
			options.removeEventListener(MouseEvent.MOUSE_DOWN,optionsButton);
			removeChild(options);
			options = null;
			removeChild(mainTextField);
			mainTextField = null;
			removeEventListener(Event.ENTER_FRAME,enterFrame);
			
			removeChild(bigPlanet);
			bigPlanet = null;
			if(tutorial!= null)
			{
				removeChild(tutorial);
			}
			if(tutorialTextField != null)
			{
				removeChild(tutorialTextField);
				tutorialTextField = null;
			}
			removeEventListener(Event.ENTER_FRAME,tutorialText);
			removeEventListener(Event.ENTER_FRAME,tutorialFunction);
			removeEventListener(Event.ENTER_FRAME,tutorialFunction2);
			Weapons.WeaponSlots= [1,"Empty","Empty","Empty","Empty"];
			parent.removeChild(this);
			levelTimer = null;
			levelArray = null;
			
		}
		function CreateGrid()
		{
			for(var _x = -2;_x<7;_x++)
			{
				var gridY = [];
				for(var _y = -2;_y<8;_y++)
				{
					
					var enemies = [];
					gridY.push(enemies);
				}
				grid.push(gridY);
			}
		}
		public static function NewEnemy(_x,_y,type):void
		{
			var enemy:MovieClip;
			if(type == "Asteroid1")
			{
				enemy = new Asteroid(_x,_y,1);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Asteroid2")
			{
				enemy = new Asteroid(_x,_y,2);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Asteroid3")
			{
				enemy = new Asteroid(_x,_y,3);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Asteroid4")
			{
				enemy = new Asteroid(_x,_y,4);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "LightShip")
			{
				enemy = new LightShip(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "MediumShip")
			{
				enemy = new MediumShip(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "HeavyShip")
			{
				enemy = new HeavyShip(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "SuperHeavy")
			{
				enemy = new SuperHeavy(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Carrier")
			{
				enemy = new Carrier(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Teleporter")
			{
				enemy = new Teleporter(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Trickster")
			{
				enemy = new Trickster(_x,_y,"default");
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "TricksterLeft")
			{
				enemy = new Trickster(_x,_y,false);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "TricksterRight")
			{
				enemy = new Trickster(_x,_y,true);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "InvisibleShip")
			{
				enemy = new InvisibleShip(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Bomber")
			{
				enemy = new Bomber(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "MotherShip")
			{
				enemy = new MotherShip(_x,_y);
				enemy.cacheAsBitmap=true;
				enemiesMc.addChild(enemy);
				enemy = null;
			}
			if(type == "Cluster")
			{
				enemy = new Cluster(_x,_y);
				enemy.cacheAsBitmap=true;
				
				
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,0);
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,1);
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,2);
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,3);
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,4);
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,5);
				Game.NewClusterUnit(enemy.x,enemy.y,enemy,6);
				enemiesMc.addChild(enemy);
				enemy = null;
			}
		}
		public static function NewClusterUnit(_x,_y,Target,Position):void
		{
			var enemy = new ClusterUnit(_x,_y,Target,Position);
			enemy.cacheAsBitmap=true;
			enemiesMc.addChild(enemy);
			enemy = null;
		}
		public static function NewParticle(_x,_y,type:String,number):void
		{
			if(Main.gfx == true)
			{
				for(var i = number;i>0;i--)
				{
					
					var particle:Particle = new Particle(_x,_y,type);
					particlesMc.addChild(particle);
					particle = null;
				}
			}else{
				return;
			}
		}
		public static function NewShell(_x,_y,angle):void
		{
			var shell:Shell = new Shell(_x,_y,angle);
			particlesMc.addChild(shell);
			shell = null;
		}
		/*public static function NewGameScreenParticle(_x,_y,type,_rotation,scale,frame)
		{
			var drawMc:MovieClip = new MovieClip();
			var clipClass:Class = getDefinitionByName(type) as Class;
	
			var clip = new clipClass();
			clip.gotoAndStop(frame);
			clip.scaleX = scale;
			clip.scaleY = scale;
			clip.x = _x-clip.width/2-1;
			clip.y = _y-clip.height/2-1;
			
			drawMc.addChild(clip);
			gameScreenBitMapData.draw(drawMc);
		}*/
		public static function NewImpactParticle(_x,_y,type,_rotation,scale,frame):void
		{
			var drawMc:MovieClip = new MovieClip();
			var clipClass:Class = getDefinitionByName(type) as Class;
			var clip:MovieClip;
			if(type == "ShellMc")
			{
				clip = new clipClass();
				clip.gotoAndStop(1);
				with(clip)
				{
					x=_x;
					y=_y;
					rotation = _rotation;
				}
				drawMc.addChild(clip);
				impactBitMapData.draw(drawMc);
				clip = null;
				clipClass = null;
				drawMc = null;
				return;
			}
			if(Game.planetShield==0)
			{
				
				
				if(type == "ImpactParticle")
				{
					clip = new clipClass();
					clip.gotoAndStop(1);
					with(clip)
					{
						x=_x;
						y=_y;
						rotation = Math.random()*360;
						scaleX = Math.random()*0.2+0.8
						scaleY = scaleX;
					}
				}
				if(type == "BlueCubeImpact")
				{
					clip = new clipClass();
					clip.gotoAndStop(1);
					with(clip)
					{
						x=_x;
						y=_y;
						ground.rotation = Math.random()*360;
						scaleX = Math.random()*0.2+0.8
						scaleY = scaleX;
					}
				}
				
				drawMc.addChild(clip);
				impactBitMapData.draw(drawMc);
				clip = null;
				clipClass = null;
				drawMc = null;
				return;
			}
			
		}
		public static function NewBulletParticle(_x,_y,type):void
		{
			var bulletParticle:BulletParticle = new BulletParticle(_x,_y,type);
			particlesMc.addChild(bulletParticle);
			bulletParticle = null;
		}
		public static function NewBullet(_x,_y,type:String,angle):void
		{
			if(type == "Cannon")
			{
				var bullet:Bullet = new Bullet(_x,_y);
				bullet.cacheAsBitmap=true;
				bulletsMc.addChild(bullet);
				bullet = null;
			}
			else if(type == "Laser")
			{
				var laser:Laser = new Laser(_x,_y);
				laser.cacheAsBitmap=true;
				bulletsMc.addChild(laser);
				laser = null;
			}
			else if(type == "SpreadCannon")
			{
				var bigBullet:BigBullet = new BigBullet(_x,_y);
				bigBullet.cacheAsBitmap=true;
				bulletsMc.addChild(bigBullet);
				bigBullet=null;
			}
			else if(type == "HomingCannon")
			{
				var homingBullet:HomingBullet = new HomingBullet(_x,_y,angle);
				homingBullet.cacheAsBitmap=true;
				bulletsMc.addChild(homingBullet);
				homingBullet = null;
			}
			else if(type == "SniperCannon")
			{
				var sniperBullet:SniperBullet = new SniperBullet(_x,_y,angle);
				sniperBullet.cacheAsBitmap=true;
				bulletsMc.addChild(sniperBullet);
				sniperBullet = null
			}
			else if(type == "RocketLauncher")
			{
				var rocketLauncher:Rocket = new Rocket(_x,_y);
				rocketLauncher.cacheAsBitmap=true;
				bulletsMc.addChild(rocketLauncher);
				rocketLauncher = null
			}
			else if(type == "FlakCannon")
			{
				var flak:Flak = new Flak(_x,_y);
				flak.cacheAsBitmap=true;
				bulletsMc.addChild(flak);
				flak = null
			}
		}
		public static function NewSmallBullet(_x,_y,xSpeed,ySpeed)
		{
			var smallBullet:SmallBullet = new SmallBullet(_x,_y,xSpeed,ySpeed);
				smallBullet.cacheAsBitmap=true;
				bulletsMc.addChild(smallBullet);
				smallBullet = null;
		}
		public static function NewCannon(_x,_y,type:String)
		{
			var cannon;
			if(type == "HomingCannon")
			{
				
				var homingCannon:HomingCannon = new HomingCannon(_x,_y,type);
				cannonsMc.addChild(homingCannon);
				cannons.push(homingCannon);
				cannon = null;
				return;
			}
			if(type == "HomingLaser")
			{
				
				cannon = new HomingLaser(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "Cannon")
			{
				cannon = new Cannon(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "Laser")
			{
				cannon = new Cannon(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "SpreadCannon")
			{
				
				cannon = new Cannon(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				
				return;
			}
			else if(type == "Battery")
			{
				var battery:Battery = new Battery(_x,_y,type);
				cannonsMc.addChild(battery);
				cannons.push(battery);
				battery = null;
				return;
			}
			else if(type == "SolarPanel")
			{
				cannon = new SolarPanel(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "Platform")
			{
				cannon = new Platform(_x,_y,type);
				platformMc.addChild(cannon);
				
				platform.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "SniperCannon")
			{
				cannon = new SniperCannon(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "AOECannon")
			{
				cannon = new AOECannon(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "RocketLauncher")
			{
				cannon = new RocketLauncher(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "ChargingLaser")
			{
				cannon = new ChargingLaser(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "EnergyPrison")
			{
				cannon = new EnergyPrison(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "FlakCannon")
			{
				cannon = new FlakCannon(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			else if(type == "Shield")
			{
				cannon = new Shield(_x,_y,type);
				cannonsMc.addChild(cannon);
				cannons.push(cannon);
				cannon = null;
				return;
			}
			
			
		}
		public static function CheckDistance(ax,ay,bx,by)
		{
			var dx=ax - bx
			var dy=ay - by
			var d:Number=Math.sqrt(dx*dx+dy*dy)
			return d;
		}
		public function addPlacementArea()
		{
			if(placementArea == null)
			{
				placementArea = new PlacementArea();
				addChild(placementArea);
			}
		}
		public function removePlacementArea()
		{
			if(placementArea != null)
			{
				placementArea.remove();
				placementArea = null;
			}
		}

	}
}