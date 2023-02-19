Set SrcDrv=\\Haros
Set DstDrv=F:\
SET FirstTime=YES
SET LOGFILE=C:\Robocopy\BackupHarosMP3.log
Goto :StartOfRobocopy

:DOIT
REM %1 backup folder
IF %FirstTime%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT:16 /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF  
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT:16 /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF    
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \mp3
 
\CD\SysinternalsSuite\sync.exe