Set SrcDrv=
Set DstDrv=\\haros\Server\backup\Hepheastus
SET FirstTime=YES
SET LOGFILE=C:\Robocopy\BackupHepheastus.log
Goto :StartOfRobocopy

:DOIT
REM %1 backup folder
IF %FIRSTTIME%==YES Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF  
IF %FirstTime%==NO  Robocopy %SrcDrv%%1 %DstDrv%%1 /E /Purge /XA:ST /ZB /MT /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF    
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT  \audiograbber
CALL :DOIT  \Powershell
CALL :DOIT "\Users\Shaw\AppData\Local\Apple Computer"
CALL :DOIT  \Users\Shaw\AppData\Local\Microsoft\Messenger
CALL :DOIT  \Users\Shaw\AppData\Local\Mozilla
CALL :DOIT  \Users\Shaw\AppData\Local\Thunderbird
CALL :DOIT "\Users\Shaw\AppData\Roaming\Apple Computer"
CALL :DOIT  \Users\Shaw\AppData\Roaming\Mozilla
CALL :DOIT  \Users\Shaw\AppData\Roaming\Thunderbird
CALL :DOIT  \Users\Shaw\Desktop
CALL :DOIT  \Users\Shaw\Documents
CALL :DOIT  \Users\Shaw\Music
CALL :DOIT  \Robocopy
CALL :DOIT  \Temp
