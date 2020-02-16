package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Stage;
	public class OptionsScreen extends MovieClip
	{
		public var mainMenuButton:MovieClip;
		var E:String;
		function OptionsScreen(e:String = "LevelSelect")
		{
			E = e;
			if(E != "LevelSelect")
			{
				logo.visible = false;
				lol.visible = false;
			}
			mainMenuButton.addEventListener(MouseEvent.MOUSE_UP,ReturnMainMenu);
			sOn.addEventListener(MouseEvent.MOUSE_UP,soundOn);
			sOff.addEventListener(MouseEvent.MOUSE_UP,soundOff);
			mOn.addEventListener(MouseEvent.MOUSE_UP,musicOn);
			mOff.addEventListener(MouseEvent.MOUSE_UP,musicOff);
			high.addEventListener(MouseEvent.MOUSE_UP,gHigh);
			low.addEventListener(MouseEvent.MOUSE_UP,gLow);
			if(Main.sounds == true)sOff.alpha = 0.5; else sOn.alpha = 0.5;
			if(Main.music == true)mOff.alpha = 0.5; else mOn.alpha = 0.5;
			if(Main.gfx == true)low.alpha = 0.5; else high.alpha = 0.5;
			sOn.buttonMode = true;
			sOff.buttonMode = true;
			mOn.buttonMode = true;
			mOff.buttonMode = true;
			mainMenuButton.buttonMode = true;
			
		}
		function gHigh(e:MouseEvent)
		{
			Main.gfx = true;
			low.alpha = 0.5;
			high.alpha = 1;
			stage.quality = "HIGH"
			var main = Main.main;
			main.SaveOptions();
		}
		function gLow(e:MouseEvent)
		{
			Main.gfx = false;
			high.alpha = 0.5;
			low.alpha = 1;
			stage.quality = "LOW"
			var main = Main.main;
			main.SaveOptions();
		}
		function ReturnMainMenu(e:MouseEvent)
		{
			var levelSelect = parent;
			if(E == "LevelSelect")
			{
			
				levelSelect.resume();
			}
			remove();
		}
		function remove()
		{
			
			mainMenuButton.removeEventListener(MouseEvent.MOUSE_UP,ReturnMainMenu);
			sOn.removeEventListener(MouseEvent.MOUSE_UP,soundOn);
			sOff.removeEventListener(MouseEvent.MOUSE_UP,soundOff);
			mOn.removeEventListener(MouseEvent.MOUSE_UP,musicOn);
			mOff.removeEventListener(MouseEvent.MOUSE_UP,musicOff);
			parent.removeChild(this);
		}
		function soundOn(e:MouseEvent)
		{
			var main = Main.main;
			Main.sounds = true;
			sOn.alpha = 1;
			sOff.alpha = 0.5;
			main.SaveOptions();
		}
		function soundOff(e:MouseEvent)
		{
			var main = Main.main;
			Main.sounds = false;
			sOn.alpha = 0.5;
			sOff.alpha = 1;
			main.SaveOptions();
		}
		function musicOn(e:MouseEvent)
		{
			Sounds.PlayMusic();
			mOn.alpha = 1;
			mOff.alpha = 0.5;
			Main.music = true;
			var main = Main.main;
			main.SaveOptions();
		}
		function musicOff(e:MouseEvent)
		{
			Sounds.StopMusic();
			mOn.alpha = 0.5;
			mOff.alpha = 1;
			Main.music = false;
			var main = Main.main;
			main.SaveOptions();
		}
	}
	
}