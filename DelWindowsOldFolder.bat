@echo off
IF "%1"=="" GOTO Usage
takeown /R /A /F %1 /D Y
icacls %1 /t /c /grant administrators:F
attrib -R -A -H -S %1\*.* /S /D
del /f/s/q %1 > nul
rmdir /s/q %1
GOTO End
:Usage
echo Usage: DelWindowsOldFolder [FolderName]
:End 
