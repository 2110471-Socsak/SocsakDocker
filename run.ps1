# Get IPv4 address of the Wi-Fi network interface
$wifiInterface = Get-NetAdapter | Where-Object { $_.InterfaceDescription -like '*Wi-Fi*' }
$hostIPv4 = (Get-NetIPAddress -InterfaceIndex $wifiInterface.ifIndex -AddressFamily IPv4).IPAddress

# Set environment variable with host's IPv4 address
$env:HOST_IPV4 = $hostIPv4
Write-Host "HOST_IPV4=$env:HOST_IPV4"

docker-compose build
docker-compose up