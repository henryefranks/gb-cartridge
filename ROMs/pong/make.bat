@echo off

rgbasm -o build/pong.obj src/pong.asm -i src
rgblink -o build/pong.gb build/pong.obj
rgbfix -p0 -v build/pong.gb
bgb build/pong.gb
