@echo off

set name="2048"

set path=%path%;..\bin\

set CC65_HOME=D:\develop\nes\soft\cc65\bin\

del %name%.nes
del %name%.s
del %name%.bin
D:\develop\nes\soft\cc65\bin\cc65 -Oi %name%.c --add-source
D:\develop\nes\soft\cc65\bin\ca65 reset.s
D:\develop\nes\soft\cc65\bin\ca65 %name%.s
D:\develop\nes\soft\cc65\bin\ca65 asm4c.s

D:\develop\nes\soft\cc65\bin\ld65 -C nes.cfg -o %name%.nes reset.o %name%.o asm4c.o nes.lib

del *.o

pause

%name%.nes
