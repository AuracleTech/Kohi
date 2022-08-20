@echo OFF

echo build.bat of engine starting

setlocal EnableDelayedExpansion

echo getting a list of all the .c files
set cFilenames=
for /R %%f in (*.c) do (
    set cFilenames=!cFilenames! %%f
)

echo files aquired : %cFilenames%

set assembly=engine
set compilerFlags=-g -shared -Wvarargs -Wall -Werror
set includeFlags=-Isrc -I%VULKAN_SDK%/Include
set linkerFlags=-luser32 -lvulkan-1 -L%VULKAN_SDK%/Lib
set defines=-D_DEBUG -DKEXPORT -D_CRT_SECURE_NO_WARNINGS

echo building %assembly%%...
clang %cFilenames% %compilerFlags% -o ../bin/%assembly%.dll %defines% %includeFlags% %linkerFlags%

echo build.bat of engine completed