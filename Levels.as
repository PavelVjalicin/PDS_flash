package
{
	public class Levels
	{
		//Enemies Asteroid1-3, LightShip, MediumShip, HeavyShip, SuperHeavy, Bomber, Trickster, Teleporter
		//InvisibleShip, Cluster, Carrier, MotherShip.
		//SpawnEnemyInterval(timer,enemy,interval,from,till,_x,_y)
		public static function BlockWeapons(index)
		{
			if(index == 11)
			{
				WeaponSelect.BlockedWeapons = ["HomingLaser","Cannon","SpreadCannon","EnergyPrison","HomingCannon","RocketLauncher","AOECannon","ChargingLaser","FlakCannon","Laser","Shield"];
			}
			else if(index == 15)
			{
				WeaponSelect.BlockedWeapons = ["HomingLaser"];
			}
			else if(index == 16)
			{
				WeaponSelect.BlockedWeapons = ["SniperCannon"];
			}
			else if(index == 20)
			{
				WeaponSelect.BlockedWeapons = ["SniperCannon","HomingLaser","Cannon","SpreadCannon","HomingCannon","RocketLauncher","ChargingLaser","FlakCannon","Laser","Shield"];
			}
			else if(index == 21)
			{
				WeaponSelect.BlockedWeapons = ["Cannon","SpreadCannon","RocketLauncher","ChargingLaser"];
			}
			else if(index == 22)
			{
				WeaponSelect.BlockedWeapons = ["HomingLaser","HomingCannon","ChargingLaser","AOECannon"];
			}
			else if(index == 23)
			{
				WeaponSelect.BlockedWeapons = ["RocketLauncher"];
			}
			else if(index == 24)
			{
				WeaponSelect.BlockedWeapons = ["HomingLaser","Cannon","SpreadCannon","EnergyPrison","HomingCannon","RocketLauncher","AOECannon","Laser"];
			}
			else if(index == 28)
			{
				WeaponSelect.BlockedWeapons = ["FlakCannon"];
			}
			else{
				WeaponSelect.BlockedWeapons = [];
			}
		}
		public static function LevelDescription(index):String
		{
			if(index == 1)
			{
				return "Name: Level1\nStarting Energy: 50\nMax Energy: 100\nEnergy gain: 2\nReward: Piercing Cannon";
			}
			if(index == 2)
			{
				return "Name: Level5\nStarting Energy: 50\nMax Energy: 100\nEnergy gain: 1\nReward: Machine Gun";
			}
			if(index == 3)
			{
				return "Name: Level3\nStarting Energy: 50\nMax Energy: 100\nEnergy gain: 1\nReward: Battery";
			}
			if(index == 4)
			{
				return "Name: Level4\nStarting Energy: 70\nMax Energy: 100\nEnergy gain: 1\nReward: Annihilator";
			}
			if(index == 5)
			{
				return "Name: Level6\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: Generator";
			}
			if(index == 6)
			{
				return "Name: Level8\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 1\nReward: None";
			}
			if(index == 7)
			{
				return "Name: Level7\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 5\nReward: None";
			}
			if(index == 8)
			{
				return "Name: Level2\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: None";
			}
			if(index == 9)
			{
				return "Name: Level9\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 1\nReward: Piercing Laser";
			}
			if(index == 10)
			{
				return "Name: Level10\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 1\nReward: None";
			}
			if(index == 11)
			{
				return "Name: Level11\nStarting Energy: 210\nMax Energy: 210\nEnergy gain: 0\nReward: None";
			}
			if(index == 12)
			{
				return "Name: Level12\nStarting Energy: 400\nMax Energy: 400\nEnergy gain: 0\nReward: None";
			}
			if(index == 13)
			{
				return "Name: Level13\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: Destroyer";
			}
			if(index == 14)
			{
				return "Name: Level14\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: Capacitor X";
			}
			if(index == 15)
			{
				return "Name: Level15\nStarting Energy: 90\nMax Energy: 100\nEnergy gain: 2\nReward: None";
			}
			if(index == 16)
			{
				return "Name: Level16\nStarting Energy: 200\nMax Energy: 200\nEnergy gain: 2\nReward: Platform";
			}
			if(index == 17)
			{
				return "Name: Level17\nStarting Energy: 200\nMax Energy: 200\nEnergy gain: 2\nReward: Sonic Pitch";
			}
			if(index == 18)
			{
				return "Name: Level18\nStarting Energy: 50\nMax Energy: 100\nEnergy gain: 10\nReward: Energy Prison";
			}
			if(index == 19)
			{
				return "Name: Level19\nStarting Energy: 200\nMax Energy: 200\nEnergy gain: 1\nReward: Hornet";
			}
			if(index == 20)
			{
				return "Name: Level20\nStarting Energy: 295\nMax Energy: 195\nEnergy gain: 0\nReward: None";
			}
			if(index == 21)
			{
				return "Name: Level21\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: Flak";
			}
			if(index == 22)
			{
				return "Name: Level22\nStarting Energy: 150\nMax Energy: 150\nEnergy gain: 2\nReward: None";
			}
			if(index == 23)
			{
				return "Name: Level23\nStarting Energy: 300\nMax Energy: 300\nEnergy gain: 0\nReward: None";
			}
			if(index == 24)
			{
				return "Name: Level24\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: Ravelin";
			}
			if(index == 25)
			{
				return "Name: Level25\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: None";
			}
			if(index == 26)
			{
				return "Name: Level26\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: None";
			}
			if(index == 27)
			{
				return "Name: Level27\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: None";
			}
			if(index == 28)
			{
				return "Name: Final defense\nStarting Energy: 100\nMax Energy: 100\nEnergy gain: 2\nReward: None";
			}
			
			return "Level description not found."
		}
		public static function TraceLevel(index,game):Array
		{
			/*if(index == Number)
			{
				levelArray["from"] =     [Num];
				levelArray["till"] =     [Num];
				levelArray["interval"] = [Num];
				levelArray["enemy"] =    [Num];
				levelArray["enemyX"] =   [Num];
				levelArray["enemyY"] =   [Num];
			}*/
			var levelArray:Array = new Array();
			
			if(index == 1)//Weapons: only homing laser. Secondary:Nothing. Energy = 50
			{
				levelArray["from"] =     [60,          800        ,1600       ];
				levelArray["till"] =     [2200,       2200       ,2200       ];
				levelArray["interval"] = [90 ,        60         ,90         ];
				levelArray["enemy"] =    ["LightShip","LightShip","LightShip"];
				levelArray["enemyX"] =   ["default"  ,"default"   ,250       ];
				levelArray["enemyY"] =   ["default",  "default"   ,"default" ];
				addUnit(2400,"MediumShip",250,"default")
				game.startTutorial();
				Game.EnergyAmount = 2;
				Game.levelEnd = 2401;
				Game.unlockedWeapon = "Cannon";
				Game.unlockedLevel = [8,3];
			}
			if(index == 2)//Weapons:Homing+Pierce. Energy = 50;
			{
				levelArray["from"] =     [0,          1200       ,2800       ];
				levelArray["till"] =     [3800,       3800       ,3800       ];
				levelArray["interval"] = [80 ,        60         ,30         ];
				levelArray["enemy"] =    ["LightShip","LightShip","LightShip"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,250        ];
				levelArray["enemyY"] =   ["default",  "default"  ,"default"  ];
				Game.unlockedWeapon = "SniperCannon";
				Game.tutorialTextField.text= 'Recycle 66% of energy cost\n by droping cannon on trash icon';
				Game.levelEnd = 3801;
				Game.unlockedLevel = [8,5];
			}
			if(index == 3)//Weapons:Homing+Pierce. Energy = 50;
			{
				
				levelArray["from"] =     [0,          70         ,840        ,1610       ,1610       ,2500];
				levelArray["till"] =     [1610,       1610       ,2500       ,2500       ,2500       ,3800];
				levelArray["interval"] = [140 ,       140        ,70         ,70         ,70         ,110];
				levelArray["enemy"] =    ["LightShip","LightShip","LightShip","LightShip","LightShip","MediumShip"];
				levelArray["enemyX"] =   [50         ,450        ,250        ,50         ,450        ,250];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default"  ,"default"  ,"default"  ,"default"];
				addUnit(70,"LightShip",450,"default");
				Game.levelEnd = 3801;
				Game.tutorialTextField.text= 'You can press and hold "R" to Restart Level';
				Game.unlockedSecondaryWeapon="Battery";
				Game.unlockedLevel = [1,4];
			}
			if(index == 4)//Weapons:3 cannons. Energy = 70;
			{
				levelArray["from"] =     [0,           1300];
				levelArray["till"] =     [2000,        2000];
				levelArray["interval"] = [30,          80];
				levelArray["enemy"] =    ["Asteroid1","Asteroid2"];
				levelArray["enemyX"] =   ["default","default"];
				levelArray["enemyY"] =   ["default","default"];
				addUnit(2100,"Asteroid3",250,"default");
				addUnit(2300,"Asteroid3",250,"default");
				for(var i = 0;i<=10;i++)
				addUnit(2500,"Asteroid1","default","default");
				for(i = 0;i<=10;i++)
				addUnit(2800,"Asteroid1","default","default");
				for(i = 0;i<=10;i++)
				addUnit(3100,"Asteroid1","default","default");
				
				Game.tutorialTextField.text= 'You can use "1,2,3,4" keys to place cannons';
				Game.energy = 70;
				Game.levelEnd = 3101;
				Game.unlockedWeapon = "SpreadCannon";
				
				Game.unlockedLevel = [7,3];
			}
			if(index == 5)//4first cannons
			{
				levelArray["from"] =     [0          ,1400       ,1900        ,2600        ];
				levelArray["till"] =     [1900       ,1900       ,4800        ,3200        ];
				levelArray["interval"] = [60         ,120        ,80          ,60          ];
				levelArray["enemy"] =    ["LightShip","LightShip","MediumShip","Trickster"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default"   ,"default"   ];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default"   ,"default"   ];
				multipleUnits(3200,4800,100,"TricksterLeft",100,"default",1);
				multipleUnits(3200,4800,100,"TricksterRight",200,"default",1);
				multipleUnits(3200,4800,100,"TricksterLeft",300,"default",1);
				multipleUnits(3200,4800,100,"TricksterRight",400,"default",1);
				addUnit(4800,"HeavyShip",250,"default");
				addUnit(4800,"HeavyShip",175,"default");
				addUnit(4800,"HeavyShip",325,"default");
				Game.EnergyAmount = 2;
				Game.energy = 100;
				Game.levelEnd = 4801;
				Game.unlockedLevel = [7,2,6];
				Game.unlockedSecondaryWeapon="SolarPanel";
				
			}
			if(index == 6)//4first cannons, solar panel unlocked
			{
				levelArray["from"] =     [0          ,0          ,2500        ,3500       ,5000];
				levelArray["till"] =     [4500       ,4500       ,3500        ,5000       ,5400];
				levelArray["interval"] = [90         ,90         ,90          ,130        ,60];
				levelArray["enemy"] =    ["LightShip","LightShip","MediumShip","HeavyShip","Bomber"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default"   ,"default"  ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default"   ,"default"  ,"default"];
				Game.energy = 100;
				Game.levelEnd = 5401;
				Game.unlockedLevel = [11,5,14];
				
			}
			if(index == 7)
			{
				levelArray["from"] =     [30          ,250        ,1300       ]
				levelArray["till"] =     [3000        ,3000       ,3000       ]
				levelArray["interval"] = [120         ,40         ,40         ]
				levelArray["enemy"] =    ["MediumShip","LightShip","Trickster"]
				levelArray["enemyX"] =   ["default"   ,"default"  ,"default"  ]
				levelArray["enemyY"] =   ["default"   ,"default"  ,"default"  ]
				
				multipleUnits(2500,3000,150,"HeavyShip",200,"default",1);
				multipleUnits(2500,3000,150,"HeavyShip",300,"default",1);
				multipleUnits(2650,3150,150,"TricksterRight",150,"default",1);
				multipleUnits(2650,3150,150,"TricksterLeft",250,"default",1);
				multipleUnits(2650,3150,150,"TricksterRight",250,"default",1);
				multipleUnits(2650,3150,150,"Tricksterleft",350,"default",1);
				Game.EnergyAmount = 5;
				Game.energy = 100;
				Game.levelEnd = 3150;
				addUnit(30,"MediumShip","default","default");
				Game.unlockedLevel = [5,4,9,12];
				Game.unlockedSecondaryWeapon="SolarPanel";
			}
			if(index == 8)
			{
				levelArray["from"] =     [30,         630          ,850        ,1150,       1400       ,1400       ,1800       ,1800];
				levelArray["till"] =     [600,        900          ,1250       ,1350,       2600       ,1800       ,2600       ,2600];
				levelArray["interval"] = [22,         22           ,22         ,22,         22         ,22         ,32         ,32];
				levelArray["enemy"] =    ["LightShip","LightShip"  ,"LightShip","LightShip","LightShip","LightShip","LightShip","LightShip"];
				levelArray["enemyX"] =   [250,        100          ,400,        250        ,50         ,450        ,450        ,250];
				levelArray["enemyY"] =   ["default",  "default",    "default" , "default"  ,"default"  ,"default"  ,"default"  ,"default"];
				Game.energy = 100;
				Game.EnergyAmount = 2;
				Game.unlockedLevel = [2];
				addUnit(2800,"MediumShip","default","default");
				Game.levelEnd = 2801;
				Game.tutorialTextField.text= 'You can press "p" to pause the game';
			}
			if(index == 9)
			{
				levelArray["from"] =     [30         ,400        ,2000           ];
				levelArray["till"] =     [400        ,3000       ,3000           ];
				levelArray["interval"] = [50         ,40         ,75             ];
				levelArray["enemy"] =    ["LightShip","LightShip","InvisibleShip"];
				levelArray["enemyX"] =   ["default","default"    ,"default"];
				levelArray["enemyY"] =   ["default","default"    ,"default"];
				multipleUnits("3000","4000",75,"InvisibleShip","default","default",2)
				addUnit(4000,"HeavyShip",250,"default");
				addUnit(4000,"HeavyShip",175,"default");
				addUnit(4000,"HeavyShip",325,"default");
				addUnit(4200,"HeavyShip",250,"default");
				addUnit(4200,"HeavyShip",175,"default");
				addUnit(4200,"HeavyShip",325,"default");
				addUnit(4300,"HeavyShip",250,"default");
				addUnit(4300,"HeavyShip",175,"default");
				addUnit(4300,"HeavyShip",325,"default");
				
				Game.energy = 100;
				Game.levelEnd = 4301;
				Game.unlockedLevel = [10,7];
				Game.unlockedWeapon = "Laser";
				//multipleUnits(from,till,interval,unit,_x,_y,amount)
			}
			if(index == 10)
			{
				levelArray["from"] =     [0,           1300      ,2500      ,3800        ,4800];
				levelArray["till"] =     [7000,        7000      ,7000      ,7000        ,7000];
				levelArray["interval"] = [28,          70        ,70        ,70          ,100];
				levelArray["enemy"] =    ["Asteroid1","Asteroid2","Asteroid2","Asteroid2","Asteroid3"];
				levelArray["enemyX"] =   ["default","default"    ,"default","default","default"];
				levelArray["enemyY"] =   ["default","default"    ,"default","default","default"];
				
				Game.energy = 100;
				Game.levelEnd = 7001;
				Game.unlockedLevel = [19,15,9];
				
			}
			if(index == 11)
			{
				levelArray["from"] =     [30];
				levelArray["till"] =     [1200];
				levelArray["interval"] = [40];
				levelArray["enemy"] =    ["Bomber"];
				levelArray["enemyX"] =   ["default"];
				levelArray["enemyY"] =   ["default"];
				Game.EnergyAmount = 0;
				Game.maxEnergy = 210;
				Game.energy = 210;
				Game.levelEnd = 1201;
				Game.unlockedLevel = [18];
			}
			if(index == 12)
			{
				levelArray["from"] =     [300       ];
				levelArray["till"] =     [1300       ];
				levelArray["interval"] = [70        ];
				levelArray["enemy"] =    ["Cluster" ];
				levelArray["enemyX"] =   ["default" ];
				levelArray["enemyY"] =   ["default" ];
				addUnit(100,"HeavyShip",250,"default");
				addUnit(100,"HeavyShip",175,"default");
				addUnit(100,"HeavyShip",325,"default");
				
				Game.EnergyAmount = 0;
				Game.maxEnergy = 400;
				Game.energy = 400;
				Game.levelEnd = 1301;
				Game.unlockedLevel = [13,15,7];
				
			}
			if(index == 13)
			{
				levelArray["from"] =     [600        ,1600       ,2000        ,2600];
				levelArray["till"] =     [1500       ,2500       ,2500        ,3000];
				levelArray["interval"] = [45         ,10         ,20          ,18];
				levelArray["enemy"] =    ["LightShip","LightShip","lightShip" ,"Teleporter"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default"   ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default"   ,"default"];
				
				multipleUnits(100,1500,100,"TricksterLeft",200,"default",1);
				multipleUnits(50,1500,100,"TricksterRight",300,"default",1);
				
				Game.EnergyAmount = 2;
				Game.maxEnergy = 100;
				Game.energy = 100;
				Game.levelEnd = 3001;
				Game.unlockedLevel = [];
				Game.unlockedWeapon = "HomingCannon";
				
			}
			if(index == 14)
			{
				
				levelArray["from"] =     [0          ,900];
				levelArray["till"] =     [4500       ,4500];
				levelArray["interval"] = [50         ,30];
				levelArray["enemy"] =    ["Trickster","LightShip"];
				levelArray["enemyX"] =   [250        ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"];
				
				multipleUnits(4500,4700,50,"Asteroid3","default","default",2);
				
				Game.EnergyAmount = 2;
				Game.maxEnergy = 100;
				Game.energy = 100;
				Game.levelEnd = 4701;
				Game.unlockedWeapon = "ChargingLaser";
				Game.unlockedLevel = [6,20];
			}
			if(index == 15)
			{
				//Enemies Asteroid1-3, LightShip, MediumShip, HeavyShip, SuperHeavy, Bomber, Trickster, Teleporter
				levelArray["from"] =     [0          ,800        ,2200        ,3700];
				levelArray["till"] =     [800        ,2200       ,3700        ,5000];
				levelArray["interval"] = [30         ,15         ,45          ,15];
				levelArray["enemy"] =    ["LightShip","LightShip","MediumShip","Teleporter"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default"   ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default"   ,"default"];
				Game.EnergyAmount = 2;
				Game.maxEnergy = 100;
				Game.energy = 90;
				Game.levelEnd = 5001;
				Game.unlockedLevel = [16,12,10];
			}
			if(index == 16)
			{
				levelArray["from"] =     [0           ,500        ,1200       ,2400];
				levelArray["till"] =     [3000        ,1300       ,3000       ,3000];
				levelArray["interval"] = [70          ,45         ,25         ,45];
				levelArray["enemy"] =    ["MediumShip","LightShip","LightShip","Teleporter"];
				levelArray["enemyX"] =   [250         ,"default"  ,"default"  ,"default"];
				levelArray["enemyY"] =   ["default"   ,"default"  ,"default"  ,"default"];
				
				multipleUnits(3200,4300,40,"TricksterLeft","default","default",2);
				multipleUnits(3200,4300,40,"TricksterRight","default","default",2);
				
				Game.EnergyAmount = 2;
				Game.maxEnergy = 200;
				Game.energy = 200;
				Game.levelEnd = 4301;
				Game.unlockedSecondaryWeapon="Platform";
				Game.unlockedLevel = [17];
			}
			if(index == 17)
			{
				levelArray["from"] =     [0          ,1500      ,3100        ,4000];
				levelArray["till"] =     [1500       ,3000      ,5000        ,5000];
				levelArray["interval"] = [45         ,90        ,120         ,90];
				levelArray["enemy"] =    ["LightShip","Cluster" ,"HeavyShip" ,"InvisibleShip"];
				levelArray["enemyX"] =   ["default"  ,"default" ,"default"   ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default" ,"default"   ,"default"];
				
				Game.EnergyAmount = 2;
				Game.maxEnergy = 200;
				Game.energy = 200;
				Game.levelEnd = 5001;
				Game.unlockedLevel = [];
				Game.unlockedWeapon = "AOECannon";
			}
			if(index == 18)
			{
				levelArray["from"] =     [0          ,500            ,500             ,1000        ];
				levelArray["till"] =     [3000       ,3000           ,3000            ,2600        ];
				levelArray["interval"] = [30         ,60             ,60              ,30          ];
				levelArray["enemy"] =    ["LightShip","TricksterLeft","TricksterRight","Teleporter"];
				levelArray["enemyX"] =   ["default"  ,"default"      ,"default"       ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"      ,"default"       ,"default"];
				
				addUnit(1500,"Carrier",100,"default");
				addUnit(1500,"Carrier",175,"default");
				addUnit(1500,"Carrier",250,"default");
				addUnit(1500,"Carrier",325,"default");
				addUnit(1500,"Carrier",400,"default");
				
				addUnit(2600,"SuperHeavy",250,"default");
				addUnit(2600,"SuperHeavy",100,"default");
				addUnit(2600,"SuperHeavy",400,"default");
				addUnit(2700,"SuperHeavy",250,"default");
				addUnit(2700,"SuperHeavy",100,"default");
				addUnit(2700,"SuperHeavy",400,"default");
				
				multipleUnits(3000,3200,50,"Bomber","default","default",4);
				
				Game.EnergyAmount = 10;
				Game.maxEnergy = 100;
				Game.energy = 50;
				Game.levelEnd = 3201;
				Game.unlockedLevel = [];
				Game.unlockedWeapon = "EnergyPrison";
			}
			if(index == 19)
			{
				levelArray["from"] =     [60           ,500            ,2000       ,3500];
				levelArray["till"] =     [500          ,5500           ,5500       ,5500];
				levelArray["interval"] = [100          ,90             ,40         ,100];
				levelArray["enemy"] =    ["MediumShip","InvisibleShip","LightShip","HeavyShip"];
				levelArray["enemyX"] =   ["default"   ,"default"      ,"default"  ,"default"];
				levelArray["enemyY"] =   ["default"   ,"default"      ,"default"  ,"default"];
				
				Game.EnergyAmount = 1;
				Game.maxEnergy = 200;
				Game.energy = 200;
				Game.levelEnd = 5501;
				Game.unlockedLevel = [10,22];
				Game.unlockedWeapon = "RocketLauncher";
			}
			if(index == 20)
			{
				levelArray["from"] =     [];
				levelArray["till"] =     [];
				levelArray["interval"] = [];
				levelArray["enemy"] =    [];
				levelArray["enemyX"] =   [];
				levelArray["enemyY"] =   [];
				
				addUnit(100,"TricksterLeft",250,"default");
				addUnit(150,"TricksterRight",250,"default");
				addUnit(200,"TricksterLeft",250,"default");
				addUnit(300,"MediumShip",200,"default");
				addUnit(300,"MediumShip",250,"default");
				addUnit(300,"MediumShip",300,"default");
				addUnit(475,"MediumShip",200,"default");
				addUnit(475,"MediumShip",250,"default");
				addUnit(475,"MediumShip",300,"default");
				addUnit(750,"Bomber",225,"default");
				addUnit(750,"Bomber",275,"default");
				addUnit(800,"Bomber",225,"default");
				addUnit(800,"Bomber",275,"default");
				addUnit(900,"HeavyShip",250,"default");
				addUnit(1000,"LightShip",250,"default");
				addUnit(1000,"LightShip",225,"default");
				addUnit(1000,"LightShip",275,"default");
				addUnit(1100,"LightShip",250,"default");
				addUnit(1100,"LightShip",225,"default");
				addUnit(1100,"LightShip",275,"default");
				addUnit(1200,"LightShip",250,"default");
				addUnit(1200,"LightShip",225,"default");
				addUnit(1200,"LightShip",275,"default");
				
				
				Game.EnergyAmount = 0;
				Game.maxEnergy = 295;
				Game.energy = 295;
				Game.unlockedLevel = [21,14];
				Game.levelEnd = 1200;
			
			}
			
			if(index == 21)
			{
				levelArray["from"] =     [0           ,1200       ,2000       ,5500];
				levelArray["till"] =     [7000        ,7000       ,7000       ,7000];
				levelArray["interval"] = [130         ,30         ,45         ,100];
				levelArray["enemy"] =    ["MediumShip","LightShip","Asteroid2","SuperHeavy"];
				levelArray["enemyX"] =   ["default"   ,"default"  ,"default"  ,"default"];
				levelArray["enemyY"] =   ["default"   ,"default"  ,"default"  ,"default"];
				Game.unlockedLevel = [20,23,25];
				Game.EnergyAmount = 2;
				Game.energy = 100;
				Game.levelEnd = 7001;
				multipleUnits(2800,6000,300,"Cluster",250,"default",1);
				multipleUnits(2800,6000,300,"Cluster",125,"default",1);
				multipleUnits(2800,6000,300,"Cluster",375,"default",1);
				addUnit(4600,"Carrier",250,"default");
				addUnit(4600,"Carrier",125,"default");
				addUnit(4600,"Carrier",375,"default");
				addUnit(5500,"Carrier",125,"default");
				addUnit(5500,"Carrier",200,"default");
				addUnit(5500,"Carrier",300,"default");
				addUnit(5500,"Carrier",375,"default");
				Game.unlockedWeapon = "FlakCannon";
			}
			if(index == 22)
			{
				levelArray["from"] =     [0          ,0           ,1300       ,3000       ,3500];
				levelArray["till"] =     [3500       ,5500        ,2500       ,5500       ,5500];
				levelArray["interval"] = [100        ,200         ,50         ,150        ,30];
				levelArray["enemy"] =    ["LightShip","MediumShip","LightShip","HeavyShip","LightShip"];
				levelArray["enemyX"] =   ["default"  ,"default"   ,"default"  ,"default"  ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"   ,"default"  ,"default"  ,"default"];
				Game.unlockedLevel = [25,26,19];
				Game.EnergyAmount = 2;
				Game.energy = 150;
				Game.maxEnergy = 150;
				Game.levelEnd = 6500;
				multipleUnits(2500,5500,200,"TricksterLeft",250,"default",1);
				multipleUnits(2500,5500,200,"TricksterRight",250,"default",1);
				multipleUnits(5500,6500,175,"HeavyShip",250,"default",1);
				multipleUnits(5500,6500,175,"HeavyShip",150,"default",1);
				multipleUnits(5500,6500,175,"HeavyShip",350,"default",1);
				multipleUnits(5550,6500,715,"Teleporter",350,"default",5);
			}
			if(index == 23)
			{
				levelArray["from"] =     [0           ,1600       ,4500           ,4750];
				levelArray["till"] =     [4500        ,4500       ,5500           ,5500];
				levelArray["interval"] = [60          ,30         ,10             ,50];
				levelArray["enemy"] =    ["Teleporter","LightShip","InvisibleShip","Cluster"];
				levelArray["enemyX"] =   ["default"   ,"default"  ,"default"      ,"default"];
				levelArray["enemyY"] =   ["default"   ,"default"  ,"default"      ,"default"];
				Game.unlockedLevel = [24,21];
				Game.energy = 300;
				Game.maxEnergy = 300;
				Game.EnergyAmount = 0;
				Game.levelEnd = 5500;
				addUnit(2000,"Carrier",250,"default");
				addUnit(2500,"Carrier",350,"default");
				addUnit(3000,"Carrier",150,"default");
				addUnit(3500,"Carrier",50,"default");
				addUnit(4000,"Carrier",450,"default");
				addUnit(4500,"Carrier",250,"default");
				addUnit(4750,"Carrier",350,"default");
			}
			if(index == 24)
			{
				levelArray["from"] =     [0           ,1200       ,2500       ,3000     ,3500        ,4500];
				levelArray["till"] =     [1200        ,3000       ,3000       ,4500     ,4500        ,5500];
				levelArray["interval"] = [130         ,130        ,30         ,30       ,30          ,50];
				levelArray["enemy"] =    ["MediumShip","HeavyShip","LightShip","Cluster","Teleporter","SuperHeavy"];
				levelArray["enemyX"] =   ["default"   ,"default"  ,"default"  ,"default","default"   ,"default"];
				levelArray["enemyY"] =   ["default"   ,"default"  ,"default"  ,"default","default"   ,"default"];
				Game.unlockedLevel = [];
				Game.energy = 100;
				Game.maxEnergy = 100;
				Game.EnergyAmount = 2;
				Game.unlockedWeapon = "Shield";
				Game.levelEnd = 5500;
			}
			if(index == 25)
			{
				levelArray["from"] =     [0          ,1200       ,3500     ,4000];
				levelArray["till"] =     [6000       ,6000       ,4000     ,6000];
				levelArray["interval"] = [30         ,19         ,100      ,100];
				levelArray["enemy"] =    ["LightShip","LightShip","Bomber" ,"HeavyShip"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default","default"];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default","default"];
				multipleUnits(2500,5000,100,"TricksterLeft",250,"default",1);
				multipleUnits(2500,5000,100,"TricksterRight",250,"default",1);
				multipleUnits(2500,5000,100,"TricksterLeft",125,"default",1);
				multipleUnits(2500,5000,100,"TricksterRight",125,"default",1);
				multipleUnits(2500,5000,100,"TricksterLeft",375,"default",1);
				multipleUnits(2500,5000,100,"TricksterRight",375,"default",1);
				addUnit(5000,"Carrier",250,"default");
				addUnit(5000,"Carrier",350,"default");
				addUnit(5000,"Carrier",150,"default");
				Game.unlockedLevel = [21,22,27];
				Game.energy = 100;
				Game.maxEnergy = 100;
				Game.EnergyAmount = 2;
				Game.levelEnd = 5500;
			}
			if(index == 26)
			{
				levelArray["from"] =     [0,          600        ,1200      ,3000];
				levelArray["till"] =     [1300,       1300       ,2000      ,4000];
				levelArray["interval"] = [25,         90         ,140       ,70];
				levelArray["enemy"] =    ["Asteroid1","Asteroid2","Asteroid3","Asteroid3"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default"  ,"default"];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default"  ,"default"];
				Game.unlockedLevel = [22,27];
				Game.energy = 100;
				Game.maxEnergy = 100;
				Game.EnergyAmount = 2;
				Game.levelEnd = 4000;
				multipleUnits(2000,4000,30,"Asteroid1","default","default",7);
			}
			if(index == 27)
			{
				levelArray["from"] =     [0           ,3500        ,5000];
				levelArray["till"] =     [1500        ,6000        ,6000];
				levelArray["interval"] = [270         ,30          ,50];
				levelArray["enemy"] =    ["HeavyShip" ,"Teleporter","HeavyShip"];
				levelArray["enemyX"] =   ["default"   ,"default"   ,"default"];
				levelArray["enemyY"] =   ["default"   ,"default"   ,"default"];
				Game.unlockedLevel = [25,26,28];
				Game.energy = 100;
				Game.maxEnergy = 100;
				Game.EnergyAmount = 2;
				Game.levelEnd = 6001;
				multipleUnits(1500,6000,80,"LightShip","default","default",7);
				addUnit(4000,"Carrier",350,"default");
				addUnit(4000,"Carrier",150,"default");
				addUnit(4000,"Carrier",250,"default");
			}
			if(index == 28)
			{
				levelArray["from"] =     [0          ,1300        ,1800           ,2800        ,3500     ,4000];
				levelArray["till"] =     [1300       ,2800        ,2800           ,4000        ,5000     ,5000];
				levelArray["interval"] = [80         ,80          ,100            ,80          ,100      ,50];
				levelArray["enemy"] =    ["LightShip","MediumShip","InvisibleShip","HeavyShip" ,"Bomber" ,"SuperHeavy"];
				levelArray["enemyX"] =   ["default"  ,"default"   ,"default"      ,"default"   ,"default","default"];
				levelArray["enemyY"] =   ["default"  ,"default"   ,"default"      ,"default"   ,"default","default"];
				Game.unlockedLevel = [];
				addUnit(0,"Carrier",250,"default");
				addUnit(1100,"Carrier",350,"default");
				addUnit(2200,"Carrier",150,"default");
				addUnit(3300,"Carrier",250,"default");
				addUnit(4500,"Carrier",350,"default");
				addUnit(4500,"Carrier",150,"default");
				Game.energy = 100;
				Game.maxEnergy = 100;
				Game.EnergyAmount = 2;
				Game.levelEnd = 5001;
			}
			
			if(index == 29)
			{
				levelArray["from"] =     [];
				levelArray["till"] =     [];
				levelArray["interval"] = [];
				levelArray["enemy"] =    [];
				levelArray["enemyX"] =   [];
				levelArray["enemyY"] =   [];
			}
			if(index == 30)
			{
				levelArray["from"] =     [];
				levelArray["till"] =     [];
				levelArray["interval"] = [];
				levelArray["enemy"] =    [];
				levelArray["enemyX"] =   [];
				levelArray["enemyY"] =   [];
			}
			if(index == 99)
			{
				levelArray["from"] =     [30,         700,        1400,       2500       ,4000];
				levelArray["till"] =     [1800,       1400,       2500,       9000000    ,9000000];
				levelArray["interval"] = [40,         60,         20,         40         ,40];
				levelArray["enemy"] =    ["Asteroid1","Asteroid2","Asteroid2","Asteroid3","Asteroid3"];
				levelArray["enemyX"] =   ["default"  ,"default"  ,"default",  "default","default"    ];
				levelArray["enemyY"] =   ["default"  ,"default"  ,"default",  "default","default"    ];
			}
			if(index == 100)
			{
				levelArray["from"] =     [0];
				levelArray["till"] =     [10000];
				levelArray["interval"] = [50];
				levelArray["enemy"] =    ["SuperHeavy"];
				levelArray["enemyX"] =   ["default"];
				levelArray["enemyY"] =   ["default"];
				Game.energy = 10000;
				Game.maxEnergy = 10000;
				Game.levelEnd = 10000;
			}
			return levelArray;
			
			function addUnit(time,unit,_x,_y)
			{
				levelArray["from"].push(time)
				levelArray["till"].push(time)
				levelArray["interval"].push(0)
				levelArray["enemy"].push(unit)
				levelArray["enemyX"].push(_x)
				levelArray["enemyY"].push(_y)
				
			}
			function multipleUnits(from,till,interval,unit,_x,_y,amount)
			{
				for(var i=0;i<amount;i++)
				{
					levelArray["from"].push(from)
					levelArray["till"].push(till)
					levelArray["interval"].push(interval)
					levelArray["enemy"].push(unit)
					levelArray["enemyX"].push(_x)
					levelArray["enemyY"].push(_y)
					
				}
			}
		}
	}
}