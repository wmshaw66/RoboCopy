Set SrcDrv=\\Charon
Set DstDrv=F:\Charon
SET FirstTime=YES
SET LOGFILE=C:\Robocopy\BackupCharon.log
Goto :StartOfRobocopy

:DOIT
REM %1 backup folder
IF %FIRSTTIME%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF  
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF    
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \Media\MP3
CALL :DOIT \Media\Video
CALL :DOIT \Server\Backup
CALL :DOIT \Server\Books
CALL :DOIT \Server\CBT
CALL :DOIT \Server\CD
CALL :DOIT \Server\Files.ON.Desktop
CALL :DOIT \Server\Photos
CALL :DOIT \Server\PinnacleMicro
CALL :DOIT \Server\Sherry_Backup
CALL :DOIT \Server\TV
CALL :DOIT \Server\USGSMaps

\CD\SysinternalsSuite\sync.exe