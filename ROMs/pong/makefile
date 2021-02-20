all:
	rgbasm -o build/pong.obj src/pong.asm
	rgblink -o build/pong.gb build/pong.obj
	rm build/pong.obj
	rgbfix -p0 -v build/pong.gb
