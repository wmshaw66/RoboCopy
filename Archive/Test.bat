Set SrcDrv=\\Haros
Set DestText=Moe
SET LOGFILE=C:\Robocopy\BackupHaros.log
SET FirstTime=YES

REM -- finding removable drive called %DestText%
diskpart < C:\Robocopy\ListVol.txt > C:\Robocopy\VolList.txt
for /F "usebackq tokens=3" %%i IN (`find /C " %DestText% " VolList.txt`) DO Set DstFound=%%i:\
IF %DstFound%==0 (
	ECHO Source Drive: "%DestText%" Not Found -- Exiting.
	GOTO EOF
	)
ECHO Copying Files from %SRCDRV% to %DstDrv%


Goto :StartOfRobocopy
