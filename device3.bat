@echo off
echo.
echo  Select a version
echo 1) 4.3.3
REM echo 2) 5.1.1
REM echo 3) 6.1.3
set /p version="  "
goto :%version%


:1
title Downloading IPSW ^| iPod4,1 4.3.3
mkdir iPad
mkdir iPod
mkdir iPod
cls
echo Downloading official IPSW (please wait for download, may take a while)
if EXIST "iPod\Boot433.ipsw" (
	echo.
	echo Already downloaded Boot433.ipsw, continuing
) else (
	cscript /nologo wget.js http://appldnld.apple.com/iPhone4/041-1015.20110503.d7i57/iPod4,1_4.3.3_8J2_Restore.ipsw iPod\Boot433.ipsw
)
if EXIST "iPod\Install433.ipsw" (
	echo.
	echo Already downloaded Install433.ipsw, continuing
) else (
	cscript /nologo wget.js https://www.dropbox.com/s/biztw4eaeykptvm/iPod4^%2C1_4.3.3.ipsw?dl=0 iPod\Install433.ipsw
)
echo.
echo Done!
echo.
echo Do you want to install it now?
choice /c:YN
if %ERRORLEVEL%==1 (
	InstallIPSW.bat "%cd%\iPod\Boot433.ipsw" "%cd%\iPod\Install433.ipsw"
)
exit
