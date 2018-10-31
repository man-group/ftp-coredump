#!/bin/bash
#
# Figure out what interface/ip currently holds the default gw

route_dev=$(ip route | awk '/default via/ { print $NF } ')
route_gw=$(ip route | awk '/default via/ { print $3 } ')
my_ip=$(ip addr show dev $route_dev | grep -w $route_dev | grep inet | awk ' { print $2 } ')

# If we have a bonded interface, get the name of the currently active slave
echo $route_dev | grep -q bond
if [[ $? -eq 0 ]]; then 
    # This is bondness
    route_dev=$(cat /proc/net/bonding/$route_dev | awk '/Currently Active Slave:/ { print $NF } ')
fi

if [[ -n "$route_dev" && -n "$route_gw" ]]; then 
    echo "$route_dev"
    echo "$route_gw"
    echo "$my_ip"
    exit 0
else
    echo "Could not determine default route interface or gateway"
    exit 1
fi
