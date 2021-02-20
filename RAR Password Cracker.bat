@echo off
title Rar Password Cracker
color 0a
mode con: cols=60 lines=20
copy "C:\Program Files\WinRAR\Unrar.exe"
SET PSWD=0
SET DEST=%TEMP%\%RANDOM%
MD %DEST%
:RAR
cls
echo ----------------------------------------------
echo DETALLES
echo ----------------------------------------------
echo.
SET/P "NOMBRE=Ingrese nombre del archivo : "
IF "%NOMBRE%"=="" goto NERROR
goto GPATH
:NERROR
echo ----------------------------------------------
echo ERROR
echo ----------------------------------------------
echo Usted no puede dejar esto en blanco.
pause
goto RAR
:GPATH
SET/P "PATH=Ingrese la ruta completa : "
IF "%PATH%"=="" goto PERROR
goto NEXT
:PERROR
echo ----------------------------------------------
echo ERROR
echo ----------------------------------------------
echo Usted no puede dejar esto en blanco.
pause
goto RAR
:NEXT IF EXIST "%PATH%\%NOMBRE%" GOTO START
goto PATH
:PATH
cls
echo ----------------------------------------------
echo ERROR
echo ----------------------------------------------
echo Opppss el archivo no existe...
pause
goto RAR
:START
SET /A PSWD=%PSWD%+1
UNRAR E -INUL -P%PSWD% "%PATH%\%NOMBRE%" "%DEST%"
IF /I %ERRORLEVEL% EQU 0 GOTO FINAL
GOTO START
:FINAL
RD %DEST% /Q /S
Del "Unrar.exe"
cls
echo ----------------------------------------------
echo CRACKEADO
echo ----------------------------------------------
echo.
echo PASSWORD ENCONTRADO!
echo ARCHIVO = %NOMBRE%
echo CONTRASE袮 = %PSWD%
pause>NUL
exit