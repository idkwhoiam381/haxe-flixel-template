package;

import flixel.FlxGame;

import openfl.display.Sprite;

import states.MainMenuState;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1920, 1080, MainMenuState, true));
	}
}
