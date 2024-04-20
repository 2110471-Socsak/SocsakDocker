#!/bin/bash

# Get IPv4 address of the Wi-Fi network interface
hostIPv4=$(ifconfig en0 | awk '/inet / {print $2}')

# Set environment variable with host's IPv4 address
export HOST_IPV4=$hostIPv4
echo "HOST_IPV4 = $HOST_IPV4"

docker-compose build
docker-compose up

docker rmi $(docker images -f dangling=true -q)