package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.sound.FlxSound;
import flixel.input.mouse.FlxMouse;

class TheClickingState extends FlxState
{
    var player:FlxSprite;
    var scoreText:FlxText;
    var levelText:FlxText;
    var score:Int = 0;
    var level:Int = 1;
    var maxLevel:Int = 100;

    // Market bonusları
    var marketLevels:Array<Int> = [2, 4, 8]; 
    var marketBought:Int = 0; 

    var bg:FlxSprite;
    var cursor:FlxSprite;
    var boyfriend:FlxSprite;

    // İki müzik için FlxSound
    var music1:FlxSound;
    var music2:FlxSound;

    override public function create():Void
    {
        super.create();

        // Arka plan
        bg = new FlxSprite(0, 0);
        bg.loadGraphic("assets/images/background.png");
        add(bg);

        // Oyuncu kare
        player = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
        player.makeGraphic(50, 50, 0xFFFFFFFF);
        add(player);

        // Skor
        scoreText = new FlxText(10, 10, FlxG.width, "Score: 0");
        add(scoreText);

        // Level göstergesi
        levelText = new FlxText(10, 40, FlxG.width, "Level: 1");
        add(levelText);

        // Kedi sesi yükle
        FlxG.sound.load("assets/sounds/meow.mp3");

        // Özelleştirilmiş fare imleci
        cursor = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
        cursor.loadGraphic("assets/images/cursor2.png");
        add(cursor);
        FlxG.inputs.mouse(true);

        // Boyfriend karakteri
        boyfriend = new FlxSprite(FlxG.width - 150, FlxG.height / 2 - 50);
        boyfriend.loadGraphic("assets/images/boyfriend.png");
        add(boyfriend);

        // Müzikler
        music1 = FlxG.sound.load("assets/music/background1.ogg");
        music2 = FlxG.sound.load("assets/music/background2.ogg");

        music1.play(true);
        music2.play(true);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        var mouse = FlxG.inputs.getPointer();

        // Özelleştirilmiş imleci takip ettir
        cursor.x = mouse.screenX;
        cursor.y = mouse.screenY;

        if (FlxG.mouse.justPressed())
        {
            // Oyuncuyu taşı
            player.x = FlxG.mouse.screenX - player.width / 2;
            player.y = FlxG.mouse.screenY - player.height / 2;

            // Tıklama bonusu
            var clickBonus:Int = 1; 
            for (i in 0...marketBought)
                clickBonus += marketLevels[i];

            // Skoru arttır
            score += clickBonus;

            // Level arttırma
            if (level < maxLevel)
                level += 1;

            // Skor ve level textlerini güncelle
            scoreText.text = "Score: " + score;
            levelText.text = "Level: " + level;

            // Rastgele renk değiştir
            player.color = FlxG.random.int(0xFF000000, 0xFFFFFFFF);

            // Kedi sesi çal
            FlxG.sound.play("assets/sounds/meow.mp3");
        }
    }

    public function buyMarket():Void
    {
        if (marketBought < marketLevels.length)
            marketBought++;
    }
}
