@echo off
SET IPSWDownloaded=no
if EXIST "%1" if EXIST "%2" set IPSWDownloaded=yes
if %IPSWDownloaded%=="no" (
	echo Invalid IPSW files or not downloaded, exiting
	echo  ^> Press any key to exit
	exit
) else (
	set CRDIR=%cd%
	if NOT EXIST "%TMP%\redsn0w.zip" (
		echo Downloading redsn0w...
		cscript /nologo wget.js https://87557555-a-e3ef4290-s-sites.googlegroups.com/feeds/media/content/iphone-dev.com/files/3177273601466241911 "%TMP%\redsn0w.zip"
		echo Extracting...
		7z x "%TMP%\redsn0w.zip" -oredsn0w -y>nul
	)
	echo Extracting iDevicerestore...
	cscript /nologo wget.js https://iPhoneDowngrader.github.io/iDeviceRestore_Compiled/iDeviceRestore.7z "%TMP%\iDR.7z"
	7z x "%TMP%\iDR.7z" -o%TMP%\iDR -y>nul
	set /a ERRORLEVEL=0
	cd "%TMP%\iDR"
	set isDFU=no
	echo Restoring...
	idevicerestore --custom --erase "%2">>idevicerestore.log
	echo Done with install, booting...
	@del /f /q %TMP%\iDR>nul
	@rd %TMP%\iDR>nul
	@del /f /q %TMP%\iDR.7z>nul
	echo Running redsn0w just boot ^(let it run, do not close it, don't panic^).
	cd %CRDIR%
	"redsn0w\redsn0w" -j -i "%1"
	echo Done! You did it!
	echo  Enjoy!
	echo   -iPG1101@aol.com
	echo.
	echo  ^> Press any key to close
	pause >nul
	exit
)
pause