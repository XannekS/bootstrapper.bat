@echo off
setlocal

REM Set the link to the GitHub repository for the bootstrapper
set "bootstrapperRepo=https://raw.githubusercontent.com/XannekS/VAPE-FILES/main/bootstrapper.bat"  REM Zmien na odpowiedni link do bootstrappera

REM Set the name of the file you want to download
set "filename=bootstrapper.bat"  REM Zmien na odpowiednia nazwe pliku

REM Check if curl is available
where curl >nul 2>nul
if %errorlevel% neq 0 (
    echo Curl is not installed. Please install curl or use another downloading tool.
    exit /b 1
)

REM Download the bootstrapper file
echo Downloading the bootstrapper from %bootstrapperRepo%...
curl -L -o "%filename%" "%bootstrapperRepo%"

REM Check if the download was successful
if %errorlevel% neq 0 (
    echo An error occurred while downloading the bootstrapper.
    exit /b 1
)

echo Bootstrapper "%filename%" has been downloaded successfully.

REM Check if 7-Zip is available for unzipping
where 7z >nul 2>nul
if %errorlevel% neq 0 (
    echo 7-Zip is not installed. Please install 7-Zip or another unzip tool.
    exit /b 1
)

REM Set the link to the file you want to download from the repository
set "url=https://raw.githubusercontent.com/XannekS/VAPE-FILES/main/Release.zip"  REM Zmien na odpowiedni link do pliku ZIP

REM Download the zip file
echo Downloading file from %url%...
curl -L -o "Release.zip" "%url%"

REM Check if the download was successful
if %errorlevel% neq 0 (
    echo An error occurred while downloading the file.
    exit /b 1
)

echo File "Release.zip" has been downloaded successfully.

REM Unzip the downloaded file
echo Unzipping the file...
7z x "Release.zip" -o"%~dp0" >nul

REM Check if unzipping was successful
if %errorlevel% neq 0 (
    echo An error occurred while unzipping the file.
    exit /b 1
)

echo File "Release.zip" has been unzipped successfully.

REM Delete the downloaded zip file and the bootstrapper
echo Cleaning up...
del "Release.zip"
del "%~f0"  REM Usuń obecny skrypt

echo Cleanup completed.
endlocal
