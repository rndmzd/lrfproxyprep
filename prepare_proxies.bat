@echo off
setlocal enabledelayedexpansion

REM Create the "proxies" subdirectory
if not exist proxies mkdir proxies

REM Iterate through all .LRF and .lrf files in the current directory
for %%F in (*.LRF *.lrf) do (
    REM Get the base name of the file (without extension)
    set "filename=%%~nF"
    
    REM Rename the file to .MP4 and move it to the proxies subdirectory
    ren "%%F" "!filename!.MP4"
    move "!filename!.MP4" proxies\
    
    echo Converted and moved: %%F to proxies\!filename!.MP4
)

echo Process completed.
pause