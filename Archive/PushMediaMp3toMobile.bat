REM Set SRCText=CashMedia
Set DestText=BeakerMobil

diskpart < C:\Robocopy\ListVol.txt > C:\Robocopy\VolList.txt
REM for /F "usebackq tokens=3" %%i IN (`find /C " %SRCText% " VolList.txt`) DO Set SrcFound=%%i
REM IF %SRCFound%==0 (
REM 	ECHO Source Drive: "%SRCText%" Not Found -- Exiting.
REM 	GOTO EOF
REM 	)

for /F "usebackq tokens=3" %%i IN (`find /C " %DestText% " VolList.txt`) DO Set DstFound=%%i
IF %DstFound%==0 (
	ECHO Source Drive: "%DestText%" Not Found -- Exiting.
	GOTO EOF
	)
for /F "usebackq tokens=3" %%i IN (`find " %SRCText% " VolList.txt`) DO Set SrcDrv=%%i
for /F "usebackq tokens=3" %%i IN (`find " %DestText% " VolList.txt`) DO Set DstDrv=%%i

ECHO Source Drive= \\Charon\Media\Mp3
ECHO Destination Drive= %DstDrv%

C:\Robocopy\Tools\Robocopy \\CHARON\Media\Mp3\ %DstDrv%:\Mp3\ /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG:C:\RoboCopy\PushMp3ToMobile.log /TEE /NDL /NP /NS /COPY:DAT /PF  

:EOF


