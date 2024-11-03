@echo off
setlocal

REM Set the link to the current bootstrapper file in the GitHub repository
set "bootstrapperRepo=https://raw.githubusercontent.com/XannekS/bootstrapper.bat/main/niger.bat"  REM Upewnij się, że to jest poprawny link

REM Set the name of the bootstrapper file
set "bootstrapperFile=bootstrapper.bat"  REM Zmien na odpowiednia nazwe pliku

REM Check if curl is available
where curl >nul 2>nul
if %errorlevel% neq 0 (
    echo Curl is not installed. Please install curl or use another downloading tool.
    exit /b 1
)

REM Download the bootstrapper file
echo Downloading the bootstrapper from %bootstrapperRepo%...
curl -L -o "%bootstrapperFile%" "%bootstrapperRepo%"

REM Check if the download was successful
if %errorlevel% neq 0 (
    echo An error occurred while downloading the bootstrapper.
    exit /b 1
)

echo Bootstrapper "%bootstrapperFile%" has been downloaded successfully.

REM Set the link to the zip file you want to download from the repository
set "zipUrl=https://github.com/XannekS/VAPE-FILES/raw/main/Release.zip"  REM Użyj poprawnego linku do pliku ZIP

REM Download the zip file
echo Downloading file from %zipUrl%...
curl -L -o "Release.zip" "%zipUrl%"

REM Check if the download was successful
if %errorlevel% neq 0 (
    echo An error occurred while downloading the file.
    exit /b 1
)

echo File "Release.zip" has been downloaded successfully.

REM Check if 7-Zip is available for unzipping
where 7z >nul 2>nul
if %errorlevel% neq 0 (
    echo 7-Zip is not installed. Please install 7-Zip to unzip files.
    exit /b 1
)

REM Unzip the downloaded file
echo Unzipping the file...
7z x "Release.zip" -o"%~dp0" >nul

REM Check if unzipping was successful
if %errorlevel% neq 0 (
    echo An error occurred while unzipping the file.
    exit /b 1
)

echo File "Release.zip" has been unzipped successfully.

REM Inform the user about the completion
echo Installation completed successfully.

REM Auto-update the bootstrapper by launching the new version
echo Launching the new version of the bootstrapper...
start "" "%bootstrapperFile%"
exit /b 0

REM Delete the downloaded zip file and the old bootstrapper
echo Cleaning up...
del "Release.zip"
del "%~f0"  REM Usuń obecny skrypt

echo Cleanup completed.
endlocal

dodaj żeby pobierał jeszcze link z discorda w pliku txt
