#!/usr/bin/env sh

INTERFACE=${INTERFACE:-'lo'}
NETMASK=${NETMASK:-'255.255.255.0'}
TIMEOUT=${TIMEOUT:-30}

IPS='10.250.250.1
100.64.250.1
100.64.250.10
100.64.250.2
100.64.250.3
100.64.250.4
100.64.250.5
100.64.250.6
100.64.250.7
100.64.250.8
100.64.250.9
100.64.251.1
100.64.252.1
100.64.253.1
100.64.254.1'

while true; do
    for ip in ${IPS}; do
        res=$( ip a s ${INTERFACE} | grep ${ip})
        if [ -z "${res}" ]; then
            ip a add ${ip}/${NETMASK} dev ${INTERFACE}
        fi
    done
    sleep $TIMEOUT
done
