@echo off
title MAStools - Toolkit for Monika After Story
cls

:MENU
cls
echo Welcome to MAStools version 1.01B 
echo Please select from one of the following options:
echo 1 - Make a backup of your persistent
echo 2 - Make a complete backup of your Monika After Story installation
echo 3 - Install a Submod
echo 4 - Check affection levels
echo 5 - View credits
echo 6 - Quit MAStools

SET /P M=Press keys 1 through 6 to make your choice:


IF %M%==1 GOTO BACKUP1
IF %M%==2 GOTO BACKUP2
IF %M%==3 GOTO SUBMODI
IF %M%==4 GOTO AFF
IF %M%==5 GOTO CREDITS
IF %M%==6 GOTO QUIT

:BACKUP1:
set /p drive=Where do you want the backup?
xcopy "%appdata%\RenPy\Monika After Story" %drive% /e /h /c /i
GOTO MENU

:BACKUP2:
set /p backup=Where is your Monika After Story game folder?
set /p drive=Where do you want the backup?
xcopy %backup% %drive% /e /h /c /i
GOTO MENU

:CREDITS:
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:::  __  __           _____ _              _     
::: |  \/  |   /\    / ____| |            | |    TM
::: | \  / |  /  \  | (___ | |_ ___   ___ | |___ 
::: | |\/| | / /\ \  \___ \| __/ _ \ / _ \| / __|
::: | |  | |/ ____ \ ____) | || (_) | (_) | \__ \
::: |_|  |_/_/    \_\_____/ \__\___/ \___/|_|___/
:::                                             
echo Developed and tested by TheSystemGuy.                                            
echo This software is provided with no warranty of any kind and is for non-commercial use only.
pause
GOTO MENU

:SUBMODI:
echo Welcome to the submod installer.
echo Before continuing, please extract the submod to a folder.
set /p submod=Where are the submod files?
set /p masinstall=Where is your Monika After Story installation?
xcopy %submod% %masinstall% /e /h /c /i
GOTO MENU

:AFF:
set /p masinstall=Where is your Monika After Story installation?
type %masinstall%\log\aff_log.log
pause
GOTO MENU


:QUIT:
exit
