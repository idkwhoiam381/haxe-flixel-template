#!/bin/sh
# SETUP FOR MAC AND LINUX SYSTEMS!!!
# REMINDER THAT YOU NEED HAXE INSTALLED PRIOR TO USING THIS
# https://haxe.org/download
cd ..
echo Makking the main haxelib and setuping folder in same time..
haxelib setup ~/haxelib
echo Installing dependencies...
echo This might take a few moments depending on your internet speed.
haxelib install flixel 4.10.0 --quiet
haxelib install flixel-addons 3.1.1 --quiet
haxelib install lime 8.0.2 --quiet
haxelib install openfl 9.2.2 --quiet
haxelib install hxcpp 4.3.2 --quiet
echo Finished!
