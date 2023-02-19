Set SRCText=Cash
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

C:\Robocopy\Tools\Robocopy  %SrcDrv%:\audiograbber                                                %DstDrv%:\Cash\audiograbber                                              /E /Purge /XA:ST /ZB /R:0 /W:5  /LOG:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy  %SrcDrv%:\Backup                                                      %DstDrv%:\Cash\Backup                                                    /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF    
C:\Robocopy\Tools\Robocopy  %SrcDrv%:\CAVEDOG                                                     %DstDrv%:\Cash\CAVEDOG                                                   /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy "%SrcDrv%:\Documents and Settings\Shaw\Application Data\Mozilla"      "%DstDrv%:\Cash\Documents and Settings\Shaw\Application Data\Mozilla"     /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy "%SrcDrv%:\Documents and Settings\Shaw\Application Data\Thunderbird"  "%DstDrv%:\Cash\Documents and Settings\Shaw\Application Data\Thunderbird" /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy "%SrcDrv%:\Documents and Settings\Shaw\Desktop" 	                 "%DstDrv%:\Cash\Documents and Settings\Shaw\Desktop"                      /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy "%SrcDrv%:\Notes"                                                     "%DstDrv%:\Cash\Notes"                                                    /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy  %SrcDrv%:\Python30                                                    %DstDrv%:\Cash\Python30                                                  /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy  %SrcDrv%:\Robocopy                                                    %DstDrv%:\Cash\Robocopy                                                  /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  
C:\Robocopy\Tools\Robocopy "%SrcDrv%:\Virtual Machines"                                          "%DstDrv%:\Cash\Virtual Machines"                                         /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:C:\Robocopy\BackupCash.log /TEE /NDL /NP /NS /COPY:DAT /PF  

:EOF

