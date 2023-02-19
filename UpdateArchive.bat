Set SrcDrv=W:\
Set DestText=Doug
Set DstDrv=D:\
SET LOGFILE=C:\Robocopy\UpdateArchive.log
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
IF %FirstTime%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /e /z /j /XA:ST /MT:16 /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /e /z /j /XA:ST /MT:16 /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \Archive

\CD\SysinternalsSuite\sync.exe
:EOF