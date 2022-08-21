@echo OFF

echo build.bat of tests starting

setlocal EnableDelayedExpansion

echo getting a list of all the .c files
set cFilenames=
for /R %%f in (*.c) do (SET cFilenames=!cFilenames! %%f)

echo files aquired : %cFilenames%

set assembly=tests
set compilerFlags=-g -Wno-missing-braces
set includeFlags=-Isrc -I../engine/src/
set linkerFlags=-L../bin/ -lengine.lib
set defines=-D_DEBUG -DKIMPORT

echo building %assembly%%...
clang %cFilenames% %compilerFlags% -o ../bin/%assembly%.exe %defines% %includeFlags% %linkerFlags% 

echo build.bat of tests completed