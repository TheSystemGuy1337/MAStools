@echo off
rem If you are reading this, you just uncovered the jank and lazy programming.
title MAStools 1.02
cls

:MENU
cls
echo Welcome to MAStools. Make a selection below
echo 1 - Backup your persistent.
echo 2 - Backup your Monika After Story installation
echo 3 - Install a Submod (READ INSTUCTIONS!)
echo 4 - Check affection levels
echo 5 - View credits
echo 6 - Quit MAStools
SET /P M=Press keys 1-6 to make your selection:

IF %M%==1 GOTO BACKUPPER
IF %M%==2 GOTO BACKUPGAME
IF %M%==3 GOTO SUBMODINSTALL
IF %M%==4 GOTO AFF
IF %M%==5 GOTO CREDITS
IF %M%==6 GOTO QUIT

:BACKUPPER:
set /p drive=Where do you want the backup?
xcopy "%appdata%\RenPy\Monika After Story" %drive% /e /h /c /i
GOTO MENU

:BACKUPGAME:
set /p backup=Where is your Monika After Story game folder?
set /p drive=Where do you want the backup?
xcopy %backup% %drive% /e /h /c /i
GOTO MENU

:SUBMODINSTALL:
echo WARNING: Read the documentation that is in the README.MD file of your submod.
echo Some submods explicitly tell you not to put it in the "game" folder or "Submods" folder.
echo Failure to read the documentation included with the submod may BRICK YOUR GAME
CHOICE /C YN /M "Did you read your submods documentation?"
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


:CREDITS:
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
:::  __  __           _____ _              _     
::: |  \/  |   /\    / ____| |            | |    TM
::: | \  / |  /  \  | (___ | |_ ___   ___ | |___ 
::: | |\/| | / /\ \  \___ \| __/ _ \ / _ \| / __|
::: | |  | |/ ____ \ ____) | || (_) | (_) | \__ \
::: |_|  |_/_/    \_\_____/ \__\___/ \___/|_|___/                                           
echo Developed and tested by TheSystemGuy.                                            
echo This software is provided with no warranty of any kind.
pause
GOTO MENU


:QUIT:
exit
