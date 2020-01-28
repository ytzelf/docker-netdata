#!/bin/bash
echo "Running netdata"
exec /usr/sbin/netdata -D -u root
