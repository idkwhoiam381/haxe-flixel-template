package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.system.FlxSound;

class TheClickingState extends FlxState
{
    var player:FlxSprite;
    var scoreText:FlxText;
    var levelText:FlxText;
    var score:Int = 0;
    var level:Int = 1;
    var maxLevel:Int = 100;

    var marketLevels:Array<Int> = [2, 4, 8]; 
    var marketBought:Int = 0; 

    var bg:FlxSprite;
    var boyfriend:FlxSprite;

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

        // Boyfriend karakteri
        boyfriend = new FlxSprite(FlxG.width - 150, FlxG.height / 2 - 50);
        boyfriend.loadGraphic("assets/images/boyfriend.png");
        add(boyfriend);

        // Müzikler
        music1 = new FlxSound();
        music1.loadEmbedded("assets/music/background1.ogg", true, true);

        music2 = new FlxSound();
        music2.loadEmbedded("assets/music/background2.ogg", true, true);

        music1.play(true);
        music2.play(true);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        var touch = FlxG.touches.getFirst();
        if (touch != null && touch.justPressed)
        {
            // Oyuncuyu dokunulan yere taşı
            player.x = touch.screenX - player.width / 2;
            player.y = touch.screenY - player.height / 2;

            // Bonus hesapla
            var clickBonus:Int = 1; 
            for (i in 0...marketBought)
                clickBonus += marketLevels[i];

            // Skor & level
            score += clickBonus;
            if (level < maxLevel)
                level += 1;

            scoreText.text = "Score: " + score;
            levelText.text = "Level: " + level;

            // Renk değiştir
            player.color = FlxG.random.int(0xFF000000, 0xFFFFFFFF);

            // Ses çal
            FlxG.sound.play("assets/sounds/meow.mp3");
        }
    }

    public function buyMarket():Void
    {
        if (marketBought < marketLevels.length)
            marketBought++;
    }
}
