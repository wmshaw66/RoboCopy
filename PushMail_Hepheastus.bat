Set SrcDrv=
Set DstDrv=\\HAROS\Server\Shaw
Set SrcProfile=bj8mnd44.default
Set DstProfile=bj8mnd44.default

SET FirstTime=YES
SET LOGFILE=C:\Robocopy\PushMail_Hepheastus.log

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
