Set SrcDrv=\\Haros
Set DstDrv=D:\
SET FirstTime=YES
SET LOGFILE=C:\Robocopy\BackupHarosVid.log
Goto :StartOfRobocopy

:DOIT
REM %1 backup folder
IF %FirstTime%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT:16 /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF  
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT:16 /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF    
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \movies
CALL :DOIT \tv
 
\CD\SysinternalsSuite\sync.exe