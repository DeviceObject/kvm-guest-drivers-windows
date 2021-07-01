@echo off

call :rmdir Install
call :rmdir Install_Debug
call :rmfiles *.log
call :rmfiles *.err
call :cleandir

pushd pvpanic
call :cleandir
for /D %%D IN (objchk_*) do call call :rmdir %%D
for /D %%D IN (objfre_*) do call call :rmdir %%D
call :rmfiles *.tmh
call :rmdir .\sdv
call :rmdir .\sdv.temp
call :rmfiles *.dvl.xml
call :rmfiles sdv-map.h
popd

pushd "PVPanic Package"
call :cleandir
popd

goto :eof

:rmdir
if exist "%~1" rmdir "%~1" /s /q
goto :eof

:rmfiles
if "%~1"=="" goto :eof
if exist "%~1" del /f "%~1"
shift
goto rmfiles

:cleandir
call :rmdir Win32
call :rmdir x64
call :rmdir ARM64
goto :eof
