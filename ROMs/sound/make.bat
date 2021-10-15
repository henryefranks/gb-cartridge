@echo off

rgbasm src\header.asm -o build\header.o
rgbasm src\main.asm -o build\main.o
rgbasm src\sound.asm -o build\sound.o

rgblink build\header.o build\main.o build\sound.o -o sound.gb
rgbfix -p0 -f hg sound.gb

@echo on

