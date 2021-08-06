@echo off
IF [%1]==[] GOTO Usage
echo Delete whatever we can
del /f/s/q %1 > nul 2>&1
rmdir /s/q %1 > nul 2>&1
echo Taking ownership of %1
takeown /R /A /F %1 /D Y > nul
echo Granting access to %1
icacls %1 /t /c /q /l /grant administrators:F 
echo Removing attributes
attrib -R -A -H -S %1\*.* /S /D 
echo Delete remaining items
del /f/s/q %1 > nul
rmdir /s/q %1
GOTO End
:Usage
echo Usage: DelWindowsOldFolder [FolderName]
:End 
