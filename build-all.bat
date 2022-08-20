@echo off

echo build-all.bat starting

echo building engine
make -f "Makefile.engine.windows.mak" all
if %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

echo building testbed
make -f "Makefile.testbed.windows.mak" all
if %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

echo build-all.bat completed.