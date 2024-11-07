@echo off
cls
echo ========================================
echo       AVX HWID Spoofer for Fortnite
echo ========================================
echo.



:: Request the user to input the AVX Key
set /p AVXKey=Please enter your AVX Key: 

:: Back up important registry keys before making any changes (optional)
echo Backing up original registry settings...
reg export "HKLM\HARDWARE\DESCRIPTION\System" "C:\backup\system_hwid.reg" /y
reg export "HKLM\SOFTWARE\Microsoft\Cryptography" "C:\backup\cryptography.reg" /y

:: Modify the Registry to spoof hardware identifiers

:: Spoofing CPU GUID by changing ProcessorNameString
echo Modifying CPU GUID...
reg add "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v "ProcessorNameString" /t REG_SZ /d "Intel(R) Core(TM) i9-9900K CPU @ 3.60GHz" /f

:: Spoofing Motherboard by modifying System Manufacturer and Product Name
echo Modifying Motherboard GUID...
reg add "HKLM\HARDWARE\DESCRIPTION\System" /v "SystemManufacturer" /t REG_SZ /d "ASUS" /f
reg add "HKLM\HARDWARE\DESCRIPTION\System" /v "SystemProductName" /t REG_SZ /d "ROG STRIX Z390-E" /f

:: Spoofing Windows Serial Number (optional)
echo Modifying Windows Product ID...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductId" /t REG_SZ /d "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX" /f

:: Save AVX Key to a registry entry for later use (if needed)
reg add "HKCU\Software\AVX_Spoofer" /v "AVXKey" /t REG_SZ /d "%AVXKey%" /f

:: Display success message
echo.
echo HWID spoofing has been simulated successfully.
echo Your hardware ID has been spoofed.

:: Optionally, you can launch Fortnite after spoofing.
echo Launching Fortnite with spoofed HWID...
start "" "C:\Program Files\Epic Games\Fortnite\FortniteLauncher.exe"

:: End the script
exit /b
