Set SRCText=BeakerMobil
Set DestText=BeakerClose
diskpart < C:\Robocopy\ListVol.txt > C:\Robocopy\VolList.txt
for /F "usebackq tokens=3" %%i IN (`find /C " %SRCText% " VolList.txt`) DO Set SrcFound=%%i
IF %SRCFound%==0 (
	ECHO Source Drive: "%SRCText%" Not Found -- Exiting.
	GOTO EOF
	)
for /F "usebackq tokens=3" %%i IN (`find /C " %DestText% " VolList.txt`) DO Set DstFound=%%i
IF %DstFound%==0 (
	ECHO Source Drive: "%DestText%" Not Found -- Exiting.
	GOTO EOF
	)
for /F "usebackq tokens=3" %%i IN (`find " %SRCText% " VolList.txt`) DO Set SrcDrv=%%i
for /F "usebackq tokens=3" %%i IN (`find " %DestText% " VolList.txt`) DO Set DstDrv=%%i

ECHO Source Drive= %SrcDrv%
ECHO Destination Drive= %DstDrv%

C:\Robocopy\Tools\Robocopy %SrcDrv%:\ %DstDrv%:\BeakerMobile\ /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG:C:\RoboCopy\BackupBeakerMobile.log /TEE /NDL /NP /NS /COPY:DAT /PF  

:EOF


