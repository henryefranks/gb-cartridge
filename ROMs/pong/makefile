all:
	rgbasm -o pong.obj pong.asm
	rgblink -o pong.gb pong.obj
	rm pong.obj
	rgbfix -p0 -v pong.gb