# Script to copy required MinGW runtime DLLs to the build/bin directory
# This ensures the installer includes all necessary runtime libraries

$sourceDir = "C:\msys64\mingw64\bin"
$targetDir = ".\build\bin"

# Create the target directory if it doesn't exist
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force
}

# List of required DLLs
$dlls = @(
    "libgcc_s_seh-1.dll",
    "libstdc++-6.dll",
    "libwinpthread-1.dll"
)

# Copy each DLL
foreach ($dll in $dlls) {
    $sourcePath = Join-Path $sourceDir $dll
    $targetPath = Join-Path $targetDir $dll
    
    if (Test-Path $sourcePath) {
        Write-Host "Copying $dll to build directory..."
        Copy-Item -Path $sourcePath -Destination $targetPath -Force
    } else {
        Write-Host "Warning: $dll not found in $sourceDir"
    }
}

Write-Host "Done copying MinGW runtime DLLs." 