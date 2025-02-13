@echo off
 Check for administrative privileges
net session nul 2&1
if %errorLevel% neq 0 (
    echo This script requires administrative privileges. Please run as administrator.
    pause
    exit b
)

echo ========================================
echo Fixing MFPlat.DLL Error for Roblox on Hyper-V VMs
echo ========================================
echo.

echo Installing Media Feature Pack...
DISM Online Add-Capability CapabilityNameMedia.MediaFeaturePack~~~~0.0.1.0
if %errorLevel% neq 0 (
    echo Error installing Media Feature Pack. Please verify that your Windows version supports this feature.
    pause
    exit b
) else (
    echo Media Feature Pack installed successfully.
)
echo.

echo Registering mfplat.dll...
regsvr32 s %SystemRoot%System32mfplat.dll
echo Registration complete.
echo.

echo Attempting to launch Roblox...
 The following uses the Roblox URL protocol. If Roblox is installed, this should launch it.
start roblox
echo.

echo If Roblox does not start automatically, please launch it manually.
echo A system restart might be required for all changes to take effect.
pause
