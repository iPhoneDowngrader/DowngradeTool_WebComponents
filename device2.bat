@echo off
echo.
echo  Select a version
echo 1) 4.0.2
REM echo 2) 5.1.1
REM echo 3) 6.1.3
set /p version="  "
goto :%version%


:1
title Downloading IPSW ^| iPhone3,1 4.0.2
mkdir iPad
mkdir iPod
mkdir iPhone
cls
echo Downloading official IPSW (please wait for download, may take a while)
if EXIST "iPhone\Boot402.ipsw" (
	echo.
	echo Already downloaded Boot402.ipsw, continuing
) else (
	cscript /nologo wget.js http://appldnld.apple.com/iPhone4/061-8807.20100811.3Edre/iPhone3,1_4.0.2_8A400_Restore.ipsw iPhone\Boot402.ipsw
)
if EXIST "iPhone\Install402.ipsw" (
	echo.
	echo Already downloaded Install402.ipsw, continuing
) else (
	cscript /nologo wget.js https://www.dropbox.com/s/4xzcvzcwj8udm4f/iPhoneGuy1101.Downgrade.iPhone4-GSM-revA.4.0.2.ipsw?dl=1 iPhone\Install402.ipsw
)
echo.
echo Done!
echo.
echo Do you want to install it now?
choice /c:YN
if %ERRORLEVEL%==1 (
	InstallIPSW.bat "%cd%\iPhone\Boot402.ipsw" "%cd%\iPhone\Install402.ipsw"
)
exit
