Set SrcDrv=E:\
Set DstDrv=\\Haros
SET FirstTime=YES
SET LOGFILE=C:\Robocopy\RestoreHaros.log
Goto :StartOfRobocopy

:DOIT
REM %1 backup folder
IF %FirstTime%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /E /XA:ST /ZB /MT:16 /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /E /XA:ST /ZB /MT:16 /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \mp3
CALL :DOIT \Movies
CALL :DOIT \tv
CALL :DOIT \Server

\CD\SysinternalsSuite\sync.exe