@echo off
title Downloading IPSW ^| iPad1,1
mkdir iPad
mkdir iPod
mkdir iPhone
cls
echo Downloading official IPSW (please wait for download, may take a while)
if EXIST "iPad\Boot322.ipsw" (
	echo.
	echo Already downloaded Boot322.ipsw, continuing
) else (
	cscript /nologo wget.js http://appldnld.apple.com/iPad/061-8801.20100811.CvfR5/iPad1,1_3.2.2_7B500_Restore.ipsw iPad\Boot322.ipsw
)
if EXIST "iPad\Install322.ipsw" (
	echo.
	echo Already downloaded Install322.ipsw, continuing
) else (
	cscript /nologo wget.js https://www.dropbox.com/s/j6atqhojtkddym9/iPad1%%2C1_3.2.2_Downgrade.iPhoneGuy1101.ipsw?dl=1 iPad\Install322.ipsw
)
echo.
echo Done!
echo.
echo Do you want to install it now?
choice /c:YN
if %ERRORLEVEL%==1 (
	InstallIPSW.bat %cd%\iPad\Boot322.ipsw %cd%\iPad\Install322.ipsw
)
exit
echo.
echo Done!
echo.
echo   ^> Press any key to exit...
pause >nul