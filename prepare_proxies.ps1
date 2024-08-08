# Create the "Proxy" subdirectory if it doesn't exist
$ProxyDir = Join-Path -Path $PSScriptRoot -ChildPath "Proxy"
if (-not (Test-Path -Path $ProxyDir)) {
    New-Item -Path $ProxyDir -ItemType Directory
}

# Get all .LRF files in the current directory (case-insensitive)
$lrfFiles = Get-ChildItem -Path $PSScriptRoot -Filter "*.lrf" -File

foreach ($file in $lrfFiles) {
    # Get the base name of the file (without extension)
    $newName = [System.IO.Path]::ChangeExtension($file.Name, "MP4")
    
    # Full path for the new file in the Proxy directory
    $newPath = Join-Path -Path $ProxyDir -ChildPath $newName
    
    # Rename and move the file
    Move-Item -Path $file.FullName -Destination $newPath -Force
    
    Write-Host "Converted and moved: $($file.Name) to $newPath"
}

Write-Host "Process completed."
Read-Host -Prompt "Press Enter to exit"