@echo off

echo clean-all.bat starting

echo cleaning engine
make -f "Makefile.engine.windows.mak" clean
if %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

echo cleaning testbed
make -f "Makefile.testbed.windows.mak" clean
if %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

echo cleaning testbed
make -f "Makefile.tests.windows.mak" clean
if %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

echo clean-all.bat completed