@echo off
cd %APPDATA%\
mkdir iDowngrader
cd iDowngrader
cls
title iDowngrader ^| Downgrade your A4 device! ^| RC2 ^| iPad1,1 or iPhone3,1 only ATM
echo Loading...
if NOT EXIST "wget.js" (
	echo var WinHttpReq=new ActiveXObject^("WinHttp.WinHttpRequest.5.1"^);WinHttpReq.Open^("GET",WScript.Arguments^(0^),!1^),WinHttpReq.Send^(^),BinStream=new ActiveXObject^("ADODB.Stream"^),BinStream.Type=1,BinStream.Open^(^),BinStream.Write^(WinHttpReq.ResponseBody^),BinStream.SaveToFile^(WScript.Arguments^(1^)^);>wget.js
)
if NOT EXIST "7z.exe" wget https://iPhoneDowngrader.github.io/DowngradeTool_WebComponents/7z.exe 7z.exe
if NOT EXIST "7z.dll" wget https://iPhoneDowngrader.github.io/DowngradeTool_WebComponents/7z.dll 7z.dll
if NOT EXIST "InstallIPSW.bat" wget https://iPhoneDowngrader.github.io/DowngradeTool_WebComponents/InstallIPSW.bat InstallIPSW.bat
if NOT EXIST "device1.bat" wget https://iPhoneDowngrader.github.io/DowngradeTool_WebComponents/device1.bat device1.bat
if NOT EXIST "device2.bat" wget https://iPhoneDowngrader.github.io/DowngradeTool_WebComponents/device2.bat device2.bat
if NOT EXIST "device0.bat" wget https://iPhoneDowngrader.github.io/DowngradeTool_WebComponents/device0.bat device0.bat
cls
echo What kind of device do you have?
echo 1) iPad ^(iPad1,1^)
echo 2) iPhone ^(iPhone3,1^)
echo.
echo 0) Just boot
echo.
echo More options in later versions
set /p device=Enter a number:
call device%device%.bat
echo.
echo Program done.
echo  ^> Press any key to exit
pause >nul