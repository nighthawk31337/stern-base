#!/bin/sh

# busybox doesn't support -q option, so it's removed

SYSCTL_CONF="/etc/sysctl.conf"
if [ -f "${SYSCTL_CONF}" ]; then
	/sbin/sysctl -p "${SYSCTL_CONF}"	
fi
