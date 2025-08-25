package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;

class MainMenuState extends FlxState
{
    var bg:FlxSprite;
    var cursor:FlxSprite;
    var playText:FlxText;
    var settingsText:FlxText;

    override public function create():Void
    {
        super.create();

        // Arka plan
        bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/back3.png");
        add(bg);

        // Başlık
        var title:FlxText = new FlxText(0, 50, FlxG.width, "Clicking Game");
        title.setFormat(null, 40, 0xFFFFFFFF, "center");
        add(title);

        // Oyna yazısı
        playText = new FlxText(0, 200, FlxG.width, "Play");
        playText.setFormat(null, 30, 0xFFFFFF00, "center");
        add(playText);

        // Ayar yazısı (pasif)
        settingsText = new FlxText(0, 300, FlxG.width, "Settings");
        settingsText.setFormat(null, 30, 0xAAAAAA, "center");
        add(settingsText);

        // Özelleştirilmiş mouse
        cursor = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
        cursor.loadGraphic("assets/images/cursor2.png");
        add(cursor);
        FlxG.mouse.show(false); // varsayılan imleci gizle

        // Menü müziği
        FlxG.sound.playMusic("assets/music/musicBackground.ogg", 1, true);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Mouse takip
        cursor.x = FlxG.mouse.screenX - cursor.width / 2;
        cursor.y = FlxG.mouse.screenY - cursor.height / 2;

        if (FlxG.mouse.justPressed())
        {
            // Oyna yazısına tıklayınca
            if (playText.overlapsPoint(FlxG.mouse.screenX, FlxG.mouse.screenY))
            {
                FlxG.switchState(new state.TheClicking());
            }

            // Ayar yazısına tıklanırsa pasif, hiçbir şey yapmaz
        }
    }
}
