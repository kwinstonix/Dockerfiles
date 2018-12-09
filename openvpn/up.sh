#!/bin/sh

RULE="POSTROUTING -o eth0 -s ${ifconfig_local}/${ifconfig_netmask} -j MASQUERADE"
/sbin/iptables -t nat -C $RULE  2>/dev/null || { /sbin/iptables -t nat -A $RULE; echo "add nat rule"; }
