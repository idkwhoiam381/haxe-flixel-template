package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class MainMenuState extends FlxState
{
    var bg:FlxSprite;
    var playText:FlxText;
    var settingsText:FlxText;

    override public function create():Void
    {
        super.create();

        // Arka plan
        bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/background.png");
        add(bg);

        // Başlık
        var title:FlxText = new FlxText(0, 50, FlxG.width, "ClickingGame Android");
        title.setFormat(null, 40, 0xFFFFFFFF, "center");
        add(title);

        // Oyna yazısı
        playText = new FlxText(0, 200, FlxG.width, "Play");
        playText.setFormat(null, 30, 0xFFFFFF00, "center");
        add(playText);

        // Ayarlar yazısı
        settingsText = new FlxText(0, 300, FlxG.width, "Settings");
        settingsText.setFormat(null, 30, 0xAAAAAA, "center");
        add(settingsText);

        // Menü müziği
        FlxG.sound.playMusic("assets/music/musicbackground.ogg", 1, true);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Dokunmatik kontrol
        var touch = FlxG.touches.getFirst();
        if (touch != null && touch.justPressed)
        {
            if (playText.overlapsPoint(touch.getScreenPosition()))
            {
                FlxG.switchState(new states.TheClickingState());
            }
        }
    }
}
