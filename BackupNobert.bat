Set SrcDrv=\\Haros
Set DestText=Nobert
Set DstDrv=D:\
SET LOGFILE=C:\Robocopy\BackupNobert.log
SET FirstTime=YES

REM -- finding removable drive called %DestText%
diskpart < C:\Robocopy\ListVol.txt > C:\Robocopy\VolList.txt
for /F "usebackq tokens=3" %%i IN (`find /C " %DestText% " VolList.txt`) DO Set DstFound=%%i
IF %DstFound%==0 (
	ECHO Source Drive: "%DestText%" Not Found -- Exiting.
	GOTO EOF
	)
for /F "usebackq tokens=3" %%i IN (`find " %DestText% " VolList.txt`) DO Set DstDrv=%%i:\
	
ECHO Copying Files from %SrcDrv% to %DstDrv%

Goto :StartOfRobocopy
REM Goto :EOF

:DOIT
REM %1 backup folder
IF %FirstTime%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XD WindowsImageBackup Hepheastus-10 /XA:ST /ZB /MT:16 /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF  
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XD WindowsImageBackup Hepheastus-10 /XA:ST /ZB /MT:16 /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF    
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \TV
CALL :DOIT \Movies

:EOF