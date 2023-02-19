Set SrcDrv=\\Charon\Server\Backup\Hepheastus
Set DstDrv=
Set SrcProfile=2s8vn2w0.default
Set DstProfile=2s8vn2w0.default

SET FirstTime=YES
SET LOGFILE=C:\Robocopy\PullMail_Hepheastus.log

Goto :StartOfRobocopy

:DOIT
REM %1 backup folder
IF %FIRSTTIME%==YES C:\Robocopy\Tools\Robocopy %SrcDrv%%1\%SrcProfile% %DstDrv%%1\%DstProfile% /E /Purge /XA:ST /ZB /R:0 /W:5  /LOG:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF  
IF %FirstTime%==NO  C:\Robocopy\Tools\Robocopy %SrcDrv%%1\%SrcProfile% %DstDrv%%1\%DstProfile% /E /Purge /XA:ST /ZB /R:0 /W:5 /LOG+:%LOGFILE% /TEE /NDL /NP /NS /COPY:DAT /PF    
IF %FirstTime%==YES SET FirstTime=NO
GOTO :EOF

:StartOfRobocopy
CALL :DOIT \Users\Shaw\AppData\Local\Thunderbird\Profiles
CALL :DOIT \Users\Shaw\AppData\Roaming\Thunderbird\Profiles
