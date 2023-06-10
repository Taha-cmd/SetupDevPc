Set-ExecutionPolicy Bypass -Scope Process -Force 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Default is wsl2 with Ubuntu
wsl --install

$packagesConfig = "$PSScriptRoot\packages.config"

# Exit code 3010 means "requires reboot"
choco install $packagesConfig -y --ignore-package-exit-codes=3010
