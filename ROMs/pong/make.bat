@echo off

rgbasm -o pong.obj pong.asm
rgblink -o pong.gb pong.obj
del pong.obj
rgbfix -p0 -v pong.gb
bgb pong.gb
