@echo off
setlocal enabledelayedexpansion

REM Create the "Proxy" subdirectory
if not exist Proxy mkdir Proxy

REM Iterate through all .LRF and .lrf files in the current directory
for %%F in (*.LRF *.lrf) do (
    REM Get the base name of the file (without extension)
    set "filename=%%~nF"
    
    REM Rename the file to .MP4 and move it to the Proxy subdirectory
    ren "%%F" "!filename!.MP4"
    move "!filename!.MP4" Proxy\
    
    echo Converted and moved: %%F to Proxy\!filename!.MP4
)

echo Process completed.
pause