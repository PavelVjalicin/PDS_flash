package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.SoundChannel;
	public class Trickster extends Enemy
	{
		private var damage:int;
		private var grid:Array = Game.grid;
		public var speedY:Number;
		public var speedX:Number;
		var speed:int;
		public var health:int;
		var xPos;
		var yPos;
		var xPos2;
		var yPos2;
		var impactTime:int;
		var impact:Boolean;
		var removed:Boolean = false;
		var Angle:Number;
		var speedR:Number;
		var right:Boolean;
		var time:int;
		function Trickster(_x,_y,direction)
		{
			if(direction == "default")
			{
				var i = Math.round(Math.random())
				if(i == 1)
				{
					right = true;
				}else{
					right = false;
				}
			}else{
				right = direction
			}
			Angle = 0;
			speed = 10;
			speedR = 8;
			impactTime = Math.random()*10+5
			if(_x == "default")
			{
				x = Math.random()*400+50;
			}else{
				x = _x;
			}
			if(_y == "default")
			{
				y = -50;
			}else{
				y = _y;
			}
			damage = 40;
			health = 7;
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			xPos2 = Math.floor(x/100);
			yPos2 = Math.floor(y/100);
			ChangeGridPosition(xPos,yPos);
			speedX = 0;
			speedY = 0;
			
			//addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener("enterFrame",enterFrame);
			
			
		}
		/*public function onClick(e:MouseEvent)
		{
			
			Damage (1,e.stageX,e.stageY);
			Game.NewBulletParticle(e.stageX,e.stageY,2);
			
		}*/
		public function ChangeGridPosition(_x,_y)
		{
			RemoveGridPosition(xPos2,yPos2);
			grid[_x+2][_y+2].push(this);
			xPos2 = xPos;
			yPos2 = yPos;
		}
		public function RemoveGridPosition(_x,_y)
		{
			for(var i in grid[_x+2][_y+2])
			{
				if( grid[_x+2][_y+2][i]==this)
				{
					grid[_x+2][_y+2].splice(i,1);
					break;
				}
			}
		}
		public function enterFrame(e:Event)
		{
			time++;
			if(time > 5)
			{
				var _x = x+Math.sin((Angle-180)*Math.PI/180)*15;
				var _y = y+Math.cos((Angle-180)*Math.PI/180)*15;
				Game.NewParticle(_x,_y,"WhiteGlow",1);
				time = 0;
			}
			if(stunTime > 0)
			{
				stunTime --;
			}else{
				Movement();
				stunned = false;
			}
			
			xPos = Math.floor(x/100);
			yPos = Math.floor(y/100);
			if(xPos != xPos2)
			{
				ChangeGridPosition(xPos,yPos);
			}
			
			if(yPos != yPos2)
			{
				ChangeGridPosition(xPos,yPos);
			}
			if(Game.bigPlanet.hitTest.hitTestPoint(this.x,this.y,true))
			{
				impact = true;
				
			}
			if(impact == true)
			{
				Impact();
			}else{
				if(y > 650)
				{
					Sounds.NewSound("enemyImpactSFX");
					Game.ChangePlanetHealth(damage);
					remove();
					return;
				}
				else if(x > 550)
				{
					remove();
					return;
				}
				else if(x <-50)
				{
					remove();
					return;
				}
			}
		}
		public function Movement()
		{
			speedX = Math.sin(Angle*Math.PI/180)*speed;
			speedY = Math.cos(Angle*Math.PI/180)*speed;
			x += speedX
			y += speedY;
			rotation = -Angle;
			
			if(right)Angle -= speedR
			else Angle += speedR;
			if(Angle > 75)right=true;
			if(Angle < -75)right=false;
		}
		public function Impact()
		{
			impactTime --;
			if(impactTime < 0)
			{
				Sounds.NewSound("enemyImpactSFX");
				Game.ChangePlanetHealth(damage);
				Game.NewParticle(this.x,this.y,"ImpactExplosion",1);
				Game.NewParticle(x,y,"AsteroidBits",3);
				Game.NewParticle(this.x,this.y,"DirtCloud",2);
				Game.NewImpactParticle(this.x,this.y,"ImpactParticle",null,null,1);
				
				remove();
			}
		}
		public function remove()
		{
			if(removed == false)
			{
				RemoveGridPosition(xPos,yPos);
				removeEventListener("enterFrame",enterFrame);
				parent.removeChild(this);
				removed = true;
			}
					
		}
		public function Damage(damage,_x,_y)
		{
			Sounds.NewSound("enemyHitSFX");
			
			
			
			if(health-damage > 0)
			{
				
				Game.NewParticle(_x,_y,"BlueShipParticle",damage);
				
				health -= damage;
			}else{
				
				Game.NewParticle(_x,_y,"BlueShipParticle",health);

				
				remove();
			}
		}
		public function Pause()
		{
			//removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			removeEventListener(Event.ENTER_FRAME,enterFrame)
		}
		public function Resume()
		{
			//addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			addEventListener(Event.ENTER_FRAME,enterFrame)
		}
	}
}