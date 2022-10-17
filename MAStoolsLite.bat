@echo off
title MAStools Lite
cls

:MENU
cls
echo Welcome to MAStools.
echo 1 - Backup your persistent.
echo 2 - Backup your entire Monika After Story installation
echo 3 - View credits
echo 4 - Quit MAStools
SET /P M=Press keys 1-4 to make your selection:

IF %M%==1 GOTO BACKUPPER
IF %M%==2 GOTO BACKUPGAME
IF %M%==3 GOTO CREDITS
IF %M%==4 GOTO QUIT

:BACKUPPER:
set /p drive=Please specify a drive or directory for your backup. NOTE: If the directory specified doesn't exist, it will automatically be created for you.
xcopy "%appdata%\RenPy\Monika After Story" %drive% /e /h /c /i
GOTO MENU

:BACKUPGAME:
set /p backup=Where is your Monika After Story game folder?
set /p drive=Please specify a drive or directory for your backup. NOTE: If the directory specified doesn't exist, it will automatically be created for you.
xcopy %backup% %drive% /e /h /c /i
GOTO MENU


:CREDITS:
cls
echo MAStools Lite - Monika After Story toolkit.                                           
echo Developed and tested by TheSystemGuy.                                            
echo This software is licensed under the GNU General Public License and offers absolutely no warranty of any kind.
pause
GOTO MENU


:QUIT:
exit
