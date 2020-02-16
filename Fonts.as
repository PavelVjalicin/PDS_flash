package
{
	import flash.text.TextFormat;
	import flash.text.Font;
	public class Fonts
	{
		public static var PixelFont:Font = new Pixel();
		public static var textFormat:TextFormat = new TextFormat();
		public static function Create()
		{
			textFormat.align = "center";
			textFormat.size = 18;
			textFormat.font = PixelFont.fontName;
		}
	}
}