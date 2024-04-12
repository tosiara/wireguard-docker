#!/bin/bash

ip link add dev wg0 type wireguard
ip address add dev wg0 10.5.0.1/24
wg setconf wg0 wg.conf
ip link set up dev wg0

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
iptables --append FORWARD --in-interface wg0 -j ACCEPT


sleep infinity

