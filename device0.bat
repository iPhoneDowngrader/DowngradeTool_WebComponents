@echo off
echo What device?
echo 1^) iPad1,1
echo 2^) iPhone3,1
set /p device="Enter the number: "
set IPSW="null"
if %device%==1 set IPSW="%APPDATA%\iDowngrader\iPad\Boot322.ipsw"
if %device%==2 set IPSW="%APPDATA%\iDowngrader\iPhone\Boot402.ipsw"
if "%IPSW%"=="null" (echo Invalid choice & exit)
cd "%APPDATA%\iDowngrader\"
if NOT EXIST "%TMP%\redsn0w.zip" (
	echo Downloading redsn0w...
	cscript /nologo wget.js https://87557555-a-e3ef4290-s-sites.googlegroups.com/feeds/media/content/iphone-dev.com/files/3177273601466241911 "%TMP%\redsn0w.zip"
	echo Extracting...
	7z x "%TMP%\redsn0w.zip" -oredsn0w -y>nul
)
"redsn0w\redsn0w_win_0.9.15b3\redsn0w" -j -i "%IPSW%"